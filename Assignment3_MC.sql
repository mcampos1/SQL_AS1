USE my_guitar_shop; 
SELECT 
    product_name AS 'Product Name',
    product_code AS ' Product Code',
    list_price AS 'Price'
FROM
    products
WHERE
    list_price > (SELECT AVG(list_price)
        FROM
            products
        WHERE
            category_id = (SELECT category_id
                FROM
                    categories
                WHERE
                    category_name = 'Drums'))
ORDER BY list_price;


SELECT 
    email_address,
    COUNT(orders.order_id) AS num_orders,
    SUM(num_items) AS num_items,
    ROUND(SUM(order_total), 2) AS order_total
FROM
    customers
        JOINorders USING (customer_id)
        JOIN
    (SELECT order_id,
            COUNT(item_id) AS num_items,
            SUM((item_price - discount_amount) * quantity) AS order_total
    FROM order_items
    GROUP BY order_id) t1 USING (order_id)
GROUP BY (email_address)
HAVING order_total > 600
ORDER BY num_orders DESC , num_items DESC , order_total DESC;


