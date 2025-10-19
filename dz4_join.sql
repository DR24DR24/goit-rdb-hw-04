USE dz3;
SELECT COUNT(*) FROM (
SELECT 
    od.id AS order_detail_id,
    o.id AS order_id,
    o.date AS order_date,
    c.name AS customer_name,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    s.name AS shipper_name,
    p.name AS product_name,
    p.unit AS product_unit,
    p.price AS product_price,
    cat.name AS category_name,
    sup.name AS supplier_name,
    od.quantity
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
LEFT JOIN customers c ON o.customer_id = c.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
RIGHT JOIN shippers s ON o.shipper_id = s.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id
LEFT JOIN categories cat ON p.category_id = cat.id
WHERE e.employee_id > 3 AND e.employee_id <= 10
) AS temp;
