-- Query5 Discount Impact
-- Generated: 2025-12-19 19:52:18
-- Database: ecommerce_funnel.db
-- Table: funnel


SELECT 
    CASE WHEN has_discount = 1 THEN 'With Discount' ELSE 'No Discount' END as discount_status,

    COUNT(*) as total_sessions,
    SUM(added_to_cart) as carts_added,
    SUM(completed_purchase) as purchases,

    -- Conversion metrics
    ROUND(SUM(completed_purchase) * 100.0 / COUNT(*), 2) as overall_conversion,
    ROUND(SUM(completed_purchase) * 100.0 / NULLIF(SUM(added_to_cart), 0), 2) as cart_to_purchase,
    ROUND((SUM(added_to_cart) - SUM(reached_checkout)) * 100.0 / 
          NULLIF(SUM(added_to_cart), 0), 2) as abandonment_rate,

    -- Financial impact
    ROUND(AVG(cart_value), 2) as avg_cart_value,
    ROUND(SUM(CASE WHEN completed_purchase = 1 THEN cart_value ELSE 0 END), 2) as total_revenue,
    ROUND(AVG(CASE WHEN completed_purchase = 1 THEN cart_value END), 2) as avg_order_value

FROM funnel
GROUP BY has_discount
ORDER BY discount_status DESC;
