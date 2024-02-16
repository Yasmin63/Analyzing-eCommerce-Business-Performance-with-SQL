---1. Menampilkan jumlah penggunaan masing-masing tipe pembayaran secara all time diurutkan dari yang terfavorit 

SELECT 
	op.payment_type,
	COUNT(*) AS num_of_usage
FROM orders_dataset AS o 
JOIN order_payments_dataset AS op 
ON o.order_id = op.order_id
GROUP BY 1
ORDER BY 2 DESC;

--- 2. Menampilkan detail informasi jumlah penggunaan masing-masing tipe pembayaran untuk setiap tahun

SELECT 
	date_part('year', o.order_purchase_timestamp) AS year,
	op.payment_type,
	COUNT(*) AS num_of_usage 
FROM orders_dataset AS o 
JOIN order_payments_dataset AS op 
ON o.order_id = op.order_id
GROUP BY 1,2
ORDER BY 1 ASC, 3 DESC;

--- 3. Tabel gabungan jumlah penggunaan tipe-tipe pembayaran untuk masing-masing tahun.

WITH type_payments AS (
	SELECT 
		date_part('year', o.order_purchase_timestamp) AS year,
		op.payment_type,
		COUNT(*) AS num_of_usage 
	FROM orders_dataset AS o 
	JOIN order_payments_dataset AS op 
	ON o.order_id = op.order_id
	GROUP BY 1,2
)
SELECT 
  payment_type,
  SUM(CASE WHEN YEAR = '2016' THEN num_of_usage ELSE 0 END) AS year_2016,
  SUM(CASE WHEN YEAR = '2017' THEN num_of_usage ELSE 0 END) AS year_2017,
  SUM(CASE WHEN YEAR = '2018' THEN num_of_usage ELSE 0 END) AS year_2018
FROM type_payments
GROUP BY 1
ORDER BY 4 DESC;