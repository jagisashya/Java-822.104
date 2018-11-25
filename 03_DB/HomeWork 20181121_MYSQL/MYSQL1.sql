/*
   1. List all rental records (start date, end date) with vehicle's registration number, 
      brand, and customer name, sorted by vehicle's categories followed by start date.
*/
USE `rental_db`; 
SELECT 
	   v.category,
	   r_r.rental_id ,
       r_r.customer_id ,
       r_r.start_date,
       r_r.end_date,
       cs.name,
       v.brand,
       v.veh_reg_no
    
FROM 
	rental_records r_r 

INNER JOIN 
	customers cs
    ON r_r.customer_id = cs.customer_id
    
INNER JOIN 
	vehicles v
    ON r_r.veh_reg_no = v.veh_reg_no
    
ORDER BY
	v.category , r_r.start_date;
    
    
/*    
    2. List the vehicles rented out on '2012-01-10' (not available for rental), 
       in columns of vehicle registration no, customer name, start date and end date. 
       (Hint: the given date is in between the start_date and end_date.)
    
*/    

SELECT 
	'2012-01-10' as 'Date',
	r_r.start_date,
    r_r.end_date,
    r_r.veh_reg_no,
    c.name
    
FROM 
	rental_records r_r
    
INNER JOIN
	customers c
	ON r_r.customer_id = c.customer_id
    
WHERE 
	r_r.start_date <= '2012-01-10' and
    r_r.end_date   >= '2012-01-10';



/*
	3. List the vehicles (registration number, brand and description) 
       rented out (not available for rental) 
       for the period from '2012-01-03' to '2012-01-18'. 
       (Hint: start_date is inside the range;
        or end_date is inside the range; 
        or start_date is before the range 
        and end_date is beyond the range.)
*/

SELECT 
	"'2012-01-03' to '2012-01-18'" as 'Period',
	r_r.veh_reg_no,
    v.brand,
    v.desc,
	r_r.start_date,
    r_r.end_date
    
FROM 
	rental_records r_r
    
INNER JOIN
	vehicles v
    ON r_r.veh_reg_no = v.veh_reg_no
    
WHERE 
	r_r.start_date between '2012-01-03' and '2012-01-18' or
    r_r.end_date   between '2012-01-03' and '2012-01-18' or
    (r_r.start_date < '2012-01-03' and r_r.end_date > '2012-01-18');



/*
	4. List the vehicles (registration number, brand and description) 
       available for rental (not rented out) on '2012-01-10' 
       (Hint: You could use a subquery based on a earlier query).
*/

SELECT 
	v.veh_reg_no,
    v.brand,
    v.brand
    
FROM
	vehicles v
    
WHERE v.veh_reg_no NOT IN (
	SELECT DISTINCT
		r_r.veh_reg_no
   
	FROM 
		rental_records r_r

	WHERE 
		r_r.start_date <= '2012-01-10' and
		r_r.end_date   >= '2012-01-10');
	
	

