SELECT
    oc.customer_state AS cust_loc,
    SUM(op.payment_value) AS transaction_value
FROM
    olist_clean.df_order AS o
INNER JOIN
    olist_clean.df_order_payments AS op ON o.order_id = op.order_id
INNER JOIN
    olist_clean.df_order_customer AS oc ON o.customer_id = oc.customer_id

GROUP BY oc.customer_state
ORDER BY transaction_value DESC
LIMIT 10;