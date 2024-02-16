--- 1. Revenue per tahun
CREATE TABLE total_revenue AS 
WITH revenue_orders AS (
	SELECT 
		order_id,
		round(CAST(SUM(price + freight_value) AS numeric), 2) AS revenue
	FROM order_items_dataset AS oi
	GROUP BY 1
)
SELECT 
	date_part('year', o.order_purchase_timestamp) AS year,
	sum(ro.revenue) AS revenue
FROM orders_dataset AS o 
JOIN revenue_orders AS ro
ON o.order_id = ro.order_id 
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

--- 2. Jumlah cancel order per tahun
CREATE TABLE total_cancel_order AS 
SELECT 
	date_part('year', order_purchase_timestamp) AS year,
	count(order_id) AS total_cancel
FROM orders_dataset AS o
WHERE order_status = 'canceled'
GROUP BY 1
ORDER BY 1;

--- 3. Top kategori yang menghasilkan revenue terbesar per tahun
CREATE TABLE top_revenue_product AS 
WITH revenue_category_orders AS (
	SELECT 
		date_part('year', o.order_purchase_timestamp) AS year,
		p.product_category_name,
		round(CAST(SUM(oi.price + oi.freight_value)AS numeric),2) AS revenue,
		ROW_NUMBER() OVER(
			PARTITION BY date_part('year', o.order_purchase_timestamp) 
			ORDER BY SUM(oi.price + oi.freight_value) desc
		) AS rank
	FROM orders_dataset AS o 
	JOIN order_items_dataset AS oi
	ON o.order_id = oi.order_id 
	JOIN product_dataset AS p 
	ON oi.product_id = p.product_id 
	WHERE order_status = 'delivered'
	GROUP BY 1, 2
)
SELECT 
	year, 
	product_category_name,
	revenue
FROM revenue_category_orders
WHERE rank = 1;

--- 4.kategori yang mengalami cancel order terbanyak per tahun
CREATE TABLE top_cancel_product AS 
WITH canceled_category_orders AS (
	SELECT 
		date_part('year', o.order_purchase_timestamp) AS year,
		p.product_category_name,
		count(*) AS total_cancel,
		ROW_NUMBER() OVER(
			PARTITION BY date_part('year', o.order_purchase_timestamp) 
			ORDER BY count(*) desc
		) AS rank
	FROM orders_dataset AS o 
	JOIN order_items_dataset AS oi
	ON o.order_id = oi.order_id 
	JOIN product_dataset AS p 
	ON oi.product_id = p.product_id 
	WHERE order_status = 'canceled'
	GROUP BY 1, 2
)
SELECT 
	year, 
	product_category_name,
	total_cancel
FROM canceled_category_orders
WHERE rank = 1;

--- 5. Gabungan ke lima tabel

SELECT 
	trp.year, 
	trp.product_category_name AS top_product, 
	trp.revenue AS top_revenue_product, 
	tr.revenue AS total_revenue,
	tcp.product_category_name AS top_cancel_product,
	tcp.total_cancel AS total_cancel_product,
	tco.total_cancel AS total_cancel_order
FROM top_revenue_product AS trp
JOIN total_revenue AS tr
ON trp.year = tr.year
JOIN top_cancel_product AS tcp
ON trp.year = tcp.year
JOIN total_cancel_order AS tco 
ON trp.year = tco.YEAR;