

WITH sales AS (
    SELECT
        EXTRACT(YEAR FROM transaction_timestamp) AS transaction_year,
        EXTRACT(MONTH FROM transaction_timestamp) AS transaction_month,
        p.category,
        COUNT(DISTINCT s.user_id) AS unique_customers,
        SUM(s.revenue) AS total_revenue,
        SUM(s.cost) AS total_cost
    FROM {{ ref('stg_sales_transactions') }} s
    LEFT JOIN {{ ref('stg_product_catalog') }} p ON s.product_id = p.product_id
    GROUP BY 1, 2, 3
),

marketing AS (
    SELECT
        EXTRACT(YEAR FROM event_timestamp) AS event_year,
        EXTRACT(MONTH FROM event_timestamp) AS event_month,
        SUM(cost) AS total_marketing_cost,
        COUNT(event_id) AS total_marketing_events
    FROM {{ ref('stg_marketing_events') }}
    GROUP BY 1, 2
)

SELECT 
    s.transaction_year,
    s.transaction_month,
    s.category,
    s.unique_customers,
    s.total_revenue,
    s.total_cost,
    COALESCE(m.total_marketing_cost, 0) AS total_marketing_cost,
    COALESCE(m.total_marketing_events, 0) AS total_marketing_events,
{{ calculate_ratio('s.total_revenue', 's.total_cost') }} AS revenue_to_cost_ratio
FROM sales s
LEFT JOIN marketing m
ON s.transaction_year = m.event_year
AND s.transaction_month = m.event_month
ORDER BY 1, 2, 3;
