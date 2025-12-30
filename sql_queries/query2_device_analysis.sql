-- Query2 Device Analysis
-- Generated: 2025-12-19 19:52:18
-- Database: ecommerce_funnel.db
-- Table: funnel


SELECT 
    device,
    COUNT(*) as total_sessions,
    SUM(completed_purchase) as purchases,
    ROUND(SUM(completed_purchase) * 100.0 / COUNT(*), 2) as conversion_rate,

    -- Cart abandonment by device
    SUM(added_to_cart) as carts_added,
    SUM(reached_checkout) as checkouts_reached,
    ROUND((SUM(added_to_cart) - SUM(reached_checkout)) * 100.0 / 
          NULLIF(SUM(added_to_cart), 0), 2) as abandonment_rate,

    -- Average metrics
    ROUND(AVG(cart_value), 2) as avg_cart_value,
    ROUND(AVG(time_on_page_seconds), 1) as avg_time_on_page

FROM funnel
GROUP BY device
ORDER BY conversion_rate DESC;
