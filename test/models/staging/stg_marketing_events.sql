

SELECT 
    event_id, 
    user_id, 
    event_type, 
    event_timestamp, 
    channel, 
    campaign, 
    cost
FROM {{ source('raw', 'marketing_events') }}