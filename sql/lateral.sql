-- Most recent purchase per customer
SELECT
  c.id,
  c.email,
  p.transaction_date,
  p.total_price
FROM customer c
  LEFT JOIN LATERAL (
    SELECT
    FROM purchase p
    -- Filter on this specific customer's purchases:
    WHERE p.customer_id = c.id
    -- Get only the most recent transaction
    ORDER BY p.transaction_date DESC
    LIMIT 1) p ON true
