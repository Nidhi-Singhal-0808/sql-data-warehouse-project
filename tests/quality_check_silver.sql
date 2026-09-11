/*
================================================================================
Quality Checks
================================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schemas. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
================================================================================
*/

--++++++++++++++++++++++++++++++++++++++++++++--
print'checking for silver.crm_cust_info'
--++++++++++++++++++++++++++++++++++++++++++++--

--check for nulls or duplicates in primary key
--expectation: No Result

select
cst_id,
count(*)
from silver.crm_cust_info
group by cst_id
having count(*)>1 or cst_id is null

--check for unwanted spaces
--expectation: No Result

select
cst_firstname,cst_lastname,cst_gndr
from silver.crm_cust_info
where cst_firstname != trim(cst_firstname) or
cst_lastname != trim(cst_lastname) or
cst_gndr != trim(cst_gndr)

--data standardization & consistency
select distinct cst_gndr
from silver.crm_cust_info
select distinct cst_marital_status
from silver.crm_cust_info

--++++++++++++++++++++++++++++++++++++++++++++--
print'checking for silver.crm_prd_info'
--++++++++++++++++++++++++++++++++++++++++++++--

--check for nulls or duplicates in primary key
--expectation: No Result

select
prd_id,
count(*)
from silver.crm_prd_info
group by prd_id
having count(*)>1 or prd_id is null

--check for unwanted spaces
--expectation: No Result

select
prd_key,prd_nm
from silver.crm_prd_info
where prd_key != trim(prd_key) or
prd_nm != trim(prd_nm)

--check for NULLS or Negative Numbers
--expectation: No Result

select prd_cost
from silver.crm_prd_info
where prd_cost < 0 or prd_cost is null

--data standardization & consistency
select distinct prd_line
from silver.crm_prd_info

--check for invalid date orders
select*
from silver.crm_prd_info
where prd_end_dt < prd_start_dt

--++++++++++++++++++++++++++++++++++++++++++++--
print'checking for silver.crm_sales_details'
--++++++++++++++++++++++++++++++++++++++++++++--

--check for extra spaces at the start or end
--expectations: No Result

select
sls_ord_num
from silver.crm_sales_details
where sls_ord_num != trim(sls_ord_num)

--check for missmatch in primary keys
--expectations: No Result

select
sls_prd_key,sls_cust_id
from silver.crm_sales_details
where sls_cust_id not in
        (select cst_id from silver.crm_cust_info)
--+++++++++++++++++++++++++++++++++++++++++++++++--
select
sls_prd_key,sls_cust_id
from silver.crm_sales_details
where sls_prd_key not in
        (select prd_key from silver.crm_prd_info) 

--check for invalid dates
--expectations: No Result
select
nullif(sls_order_dt,0) sls_order_dt
from silver.crm_sales_details
where sls_order_dt <= 0 or
      len(sls_order_dt) !=  8 or
      sls_order_dt > 20500101 or
      sls_order_dt < 19000101
--+++++++++++++++++++++++++++++++++++++++++++++++--
select
nullif(sls_ship_dt,0) sls_ship_dt
from silver.crm_sales_details
where sls_ship_dt <= 0 or
      len(sls_ship_dt) !=  8 or
      sls_ship_dt > 20500101 or
      sls_ship_dt < 19000101 
--+++++++++++++++++++++++++++++++++++++++++++++++--
select
nullif(sls_due_dt,0) sls_order_dt
from silver.crm_sales_details
where sls_due_dt <= 0 or
      len(sls_due_dt) !=  8 or
      sls_due_dt > 20500101 or
      sls_due_dt < 19000101

--check for invalid dates orders
--expectations: No Result

select
sls_order_dt
from silver.crm_sales_details
where sls_order_dt > sls_ship_dt or
      sls_order_dt > sls_due_dt
     
--check data concistency:; between sales, quantiy, and price
-->> sales = quantity*price
-->> values must not be NULL, zero, or negative.

select distinct
    sls_sales,
    sls_quantity,
    sls_price
from silver.crm_sales_details
where sls_sales != sls_quantity * sls_price or
      sls_sales is null or 
      sls_quantity is null or
      sls_price is null or
      sls_sales <= 0 or
      sls_quantity <= 0 or
      sls_price <= 0 
order by sls_sales,sls_quantity,sls_price 

--++++++++++++++++++++++++++++++++++++++++++++--
print'checking for silver.erp_CUST_AZ12'
--++++++++++++++++++++++++++++++++++++++++++++--

--check for mismatch in primary keys
--expectation: No Result

select
CID
from silver.erp_CUST_AZ12
where CID not in 
(select cst_key from silver.crm_cust_info)

--check for out-of-range dates

select distinct 
bdate
from silver.erp_CUST_AZ12
where bdate < '1924-01-01' or bdate > getdate()

--data standardization and concistency

select distinct
GEN
from silver.erp_CUST_AZ12

--++++++++++++++++++++++++++++++++++++++++++++--
print'checking for silver.erp_loc_a101'
--++++++++++++++++++++++++++++++++++++++++++++--

--check for mismatch in primary key
--expectation: No Result

select 
cid
from silver.erp_loc_a101
where cid not in
(select cst_key from silver.crm_cust_info)

--check for extra spaces at start or at the end 
--expectation:No Result

select 
cntry , cid
from silver.erp_LOC_A101
where cntry != trim(cntry) or
      cid != trim(cid)

--data standardization and concistency

select distinct
cntry
from silver.erp_LOC_A101
order by cntry

--++++++++++++++++++++++++++++++++++++++++++++--
print'checking for silver.erp_PX_CAT_G1V2'
--++++++++++++++++++++++++++++++++++++++++++++--

--check for primary keys mismatch
--expectation: No Result

select 
id 
from silver.erp_PX_CAT_G1V2
where id not in 
(select cat_id from silver.crm_prd_info)

--check for unwanted spaces
--expectation: No Result

select * from silver.erp_PX_CAT_G1V2
where cat != trim(cat) or
      subcat != trim(subcat) or
      MAINTENANCE != trim(MAINTENANCE)

--data standardization and concistency

select distinct
*
from silver.erp_PX_CAT_G1V2
