USE dz3;
SELECT cat.name, COUNT(*) as CNT,AVG(quantity) AS AC 
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
LEFT JOIN customers c ON o.customer_id = c.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
RIGHT JOIN shippers s ON o.shipper_id = s.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id
LEFT JOIN categories cat ON p.category_id = cat.id
WHERE e.employee_id > 3 AND e.employee_id <= 10

GROUP BY cat.name
HAVING AC>21
ORDER BY CNT DESC 
LIMIT 4 OFFSET 1 ;