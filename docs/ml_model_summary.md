
# CART ABANDONMENT PREDICTION MODEL - SUMMARY

## MODEL SPECIFICATIONS
- Algorithm: Random Forest Classifier
- Number of trees: 100
- Max depth: 10
- Features: 7
- Training samples: 40,768
- Test samples: 10,193

## PERFORMANCE METRICS
- Precision: 58.24%
- Recall: 50.95%
- F1-Score: 0.5435

## TOP 3 FEATURES (by importance)
1. shipping_cost: 0.3184
2. cart_value: 0.2348
3. time_on_page_seconds: 0.1415

## HIGH-RISK USER IDENTIFICATION
- Users with >70% abandonment probability: 4,176
- Prediction accuracy on high-risk: 58.24%

## BUSINESS IMPACT
- Potential annual net revenue recovery: $711,114.20
- ROI on interventions: 9.00x

## RECOMMENDATIONS
1. Implement real-time scoring on checkout page
2. Trigger exit-intent popup for high-risk users (>70% probability)
3. Offer targeted discounts to prevent abandonment
4. A/B test intervention strategies
5. Monitor model performance monthly and retrain as needed

---
