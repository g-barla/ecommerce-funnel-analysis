-- Query4 Traffic Source
-- Generated: 2025-12-19 19:52:18
-- Database: ecommerce_funnel.db
-- Table: funnel


SELECT 
    traffic_source,
    COUNT(*) as total_sessions,
    SUM(completed_purchase) as purchases,
    ROUND(SUM(completed_purchase) * 100.0 / COUNT(*), 2) as conversion_rate,

    -- Engagement metrics
    ROUND(AVG(products_viewed), 1) as avg_products_viewed,
    ROUND(AVG(time_on_page_seconds), 0) as avg_time_seconds,

    -- Financial metrics
    ROUND(AVG(CASE WHEN completed_purchase = 1 THEN cart_value END), 2) as avg_order_value,
    ROUND(SUM(CASE WHEN completed_purchase = 1 THEN cart_value ELSE 0 END), 2) as total_revenue,

    -- Cart abandonment
    ROUND((SUM(added_to_cart) - SUM(reached_checkout)) * 100.0 / 
          NULLIF(SUM(added_to_cart), 0), 2) as abandonment_rate

FROM funnel
GROUP BY traffic_source
ORDER BY conversion_rate DESC;
