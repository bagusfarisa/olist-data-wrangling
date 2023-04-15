SELECT
    pcnt.product_category_name_english AS product_category,
    SUM(op.payment_value) AS transaction_value
FROM
    olist_clean.df_order AS o
INNER JOIN
    olist_clean.df_order_items AS oi ON o.order_id = oi.order_id
INNER JOIN
    olist_clean.df_products AS p ON oi.product_id = p.product_id
INNER JOIN
    olist_clean.df_prod_cat_name_transl AS pcnt ON p.product_category_name = pcnt.product_category_name
INNER JOIN
    olist_clean.df_order_payments AS op ON o.order_id = op.order_id
GROUP BY product_category
ORDER BY transaction_value DESC
LIMIT 10;