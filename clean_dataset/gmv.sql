SELECT *
FROM
    (SELECT
        date_part('year', o.order_purchase_timestamp) ||'-'||
			   date_part('month', o.order_purchase_timestamp) AS year_month,
        SUM(op.payment_value) AS transaction_value
    FROM 
        olist_clean.df_order AS o
    INNER JOIN
        olist_clean.df_order_payments AS op ON o.order_id = op.order_id
    GROUP BY 
        year_month
    ORDER BY
        year_month DESC
    LIMIT 12
) AS ym
ORDER BY year_month ASC