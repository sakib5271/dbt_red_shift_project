
SELECT 
    transaction_id, 
    product_id, 
    user_id, 
    transaction_timestamp, 
    revenue, 
    cost
FROM {{ source('raw', 'sales_transactions') }}