select 
	year, 
	round(avg(mau), 2) as average_mau
from (   
    select
        date_part('year',o.order_purchase_timestamp) as year,
        date_part('month',o.order_purchase_timestamp) as month,
        count(distinct c.customer_unique_id) as mau
    from orders_dataset AS o
    join customers_dataset AS c on o.customer_id = c.customer_id
    group by 1,2
)avg_mau
group by 1
ORDER BY 1;

--	2. Menampilkan jumlah customer baru pada masing-masing tahun
select
    date_part('year', first_date_order) as year,
    count(customer_unique_id) AS new_customer
from(
	SELECT 
		c.customer_unique_id, 
		min(o.order_purchase_timestamp) AS first_date_order
	FROM orders_dataset AS o 
	JOIN customers_dataset AS c 
	ON o.customer_id = c.customer_id 
	GROUP BY 1
)new_cust
GROUP BY 1
ORDER BY 1;

--	3. Menampilkan jumlah customer yang melakukan pembelian lebih dari satu kali (repeat order) pada masing-masing tahun
SELECT 
	year,
	count(DISTINCT customer_unique_id) AS repeating_customer
FROM (	
	SELECT  
		date_part('year', o.order_purchase_timestamp) AS year,
		c.customer_unique_id,
		count(c.customer_unique_id) AS n_customer,
		count(o.order_id) AS n_order
	FROM orders_dataset AS o 
	JOIN customers_dataset AS c 
	ON o.customer_id = c.customer_id 
	GROUP BY 1,2
	HAVING count(o.order_id) > 1
) rep_ord
GROUP BY 1
ORDER BY 1;

--	4. Menampilkan rata-rata jumlah order yang dilakukan customer untuk masing-masing tahun
SELECT 
	year,
	round(avg(n_order), 2) AS average_order
FROM (
	SELECT 
		date_part('year', o.order_purchase_timestamp) AS year,
		c.customer_unique_id,
		count(c.customer_unique_id) AS n_customer,
		count(o.order_id) AS n_order
	FROM orders_dataset AS o 
	JOIN customers_dataset AS c 
	ON o.customer_id = c.customer_id 
	GROUP BY 1,2
) avg_ord
GROUP BY 1
ORDER BY 1;

--	5. Menggabungkan keempat metrik yang telah berhasil ditampilkan menjadi satu tampilan tabel
WITH mau AS (
	SELECT 
		year, 
		round(avg(n_customers),2) AS average_mau
	FROM (
		SELECT 
			date_part('year', o.order_purchase_timestamp) AS year,
			date_part('month', o.order_purchase_timestamp) AS month,
			count(DISTINCT c.customer_unique_id) AS n_customers
		FROM orders_dataset AS o
		JOIN customers_dataset AS c 
		ON o.customer_id = c.customer_id 
		GROUP BY 1,2
	) avg_mau
	GROUP BY 1
),
new_cust AS (
	SELECT 
		date_part('year', first_date_order) AS year,
		count(customer_unique_id) AS new_customer
	FROM (
		SELECT 
			c.customer_unique_id, 
			min(o.order_purchase_timestamp) AS first_date_order
		FROM orders_dataset AS o 
		JOIN customers_dataset AS c 
		ON o.customer_id = c.customer_id 
		GROUP BY 1
	) first_order
	GROUP BY 1
),
rep_cust AS (
	SELECT 
		year,
		count(DISTINCT customer_unique_id) AS repeating_customer
	FROM (
		SELECT 
			date_part('year', o.order_purchase_timestamp) AS year,
			c.customer_unique_id,
			count(c.customer_unique_id) AS n_customer,
			count(o.order_id) AS n_order
		FROM orders_dataset AS o 
		JOIN customers_dataset AS c 
		ON o.customer_id = c.customer_id 
		GROUP BY 1,2
		HAVING count(o.order_id) > 1
	) repeat_order
	GROUP BY 1
),
avg_ord AS (
	SELECT 
		year,
		round(avg(n_order), 2) AS average_order
	FROM (
		SELECT 
			date_part('year', o.order_purchase_timestamp) AS year,
			c.customer_unique_id,
			count(c.customer_unique_id) AS n_customer,
			count(o.order_id) AS n_order
		FROM orders_dataset AS o 
		JOIN customers_dataset AS c 
		ON o.customer_id = c.customer_id 
		GROUP BY 1,2
	) order_customer
	GROUP BY 1
)
SELECT 
	m.year, 
	m.average_mau, 
	n.new_customer, 
	r.repeating_customer, 
	a.average_order
FROM mau AS m
JOIN new_cust AS n
ON m.year = n.year 
JOIN rep_cust AS r
ON m.year = r.year 
JOIN avg_ord AS a
ON m.year = a.year 
ORDER BY 1;