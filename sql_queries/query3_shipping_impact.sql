-- Query3 Shipping Impact
-- Generated: 2025-12-19 19:52:18
-- Database: ecommerce_funnel.db
-- Table: funnel


SELECT 
    CASE 
        WHEN shipping_cost = 0 THEN 'Free Shipping'
        WHEN shipping_cost <= 10 THEN 'Low ($1-$10)'
        WHEN shipping_cost <= 15 THEN 'Medium ($11-$15)'
        ELSE 'High (>$15)'
    END as shipping_tier,

    COUNT(*) as sessions,
    SUM(added_to_cart) as carts_added,
    SUM(reached_checkout) as checkouts,
    SUM(completed_purchase) as purchases,

    ROUND(SUM(completed_purchase) * 100.0 / NULLIF(SUM(added_to_cart), 0), 2) as cart_to_purchase_rate,
    ROUND((SUM(added_to_cart) - SUM(reached_checkout)) * 100.0 / 
          NULLIF(SUM(added_to_cart), 0), 2) as abandonment_rate,

    ROUND(AVG(shipping_cost), 2) as avg_shipping_cost,
    ROUND(AVG(cart_value), 2) as avg_cart_value

FROM funnel
WHERE added_to_cart = 1  -- Only look at users who added to cart
GROUP BY shipping_tier
ORDER BY 
    CASE shipping_tier
        WHEN 'Free Shipping' THEN 1
        WHEN 'Low ($1-$10)' THEN 2
        WHEN 'Medium ($11-$15)' THEN 3
        WHEN 'High (>$15)' THEN 4
    END;
