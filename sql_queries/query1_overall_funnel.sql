-- Query1 Overall Funnel
-- Generated: 2025-12-19 19:52:18
-- Database: ecommerce_funnel.db
-- Table: funnel


SELECT 
    COUNT(*) as total_sessions,
    SUM(browsed) as browsed,
    SUM(viewed_product) as viewed_product,
    SUM(added_to_cart) as added_to_cart,
    SUM(reached_checkout) as reached_checkout,
    SUM(completed_purchase) as completed_purchase,

    -- Conversion rates at each stage
    ROUND(SUM(viewed_product) * 100.0 / COUNT(*), 2) as view_rate,
    ROUND(SUM(added_to_cart) * 100.0 / COUNT(*), 2) as cart_rate,
    ROUND(SUM(reached_checkout) * 100.0 / COUNT(*), 2) as checkout_rate,
    ROUND(SUM(completed_purchase) * 100.0 / COUNT(*), 2) as purchase_rate,

    -- Key metrics
    ROUND(SUM(completed_purchase) * 100.0 / COUNT(*), 2) as overall_conversion,
    ROUND((SUM(added_to_cart) - SUM(reached_checkout)) * 100.0 / 
          NULLIF(SUM(added_to_cart), 0), 2) as cart_abandonment_rate
FROM funnel;
