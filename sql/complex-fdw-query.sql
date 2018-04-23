SELECT
  /* ... Customer details ... */
  bt.total_amount,
  (s.detail->>'created_at')::timestamptz AS session_created_at,
  (s.detail->>'page_views')::int AS page_views
FROM (SELECT
        bt.customer_id,
        SUM(amount) AS total_amount
      FROM billing_transaction bt
      WHERE br.created_at > (now() - '30 days'::interval) bt
  JOIN customer c ON c.id = bt.customer_id,
  LATERAL (SELECT ((s.value)::json) AS detail
           FROM redis_session s
           WHERE s.key = ('customer:' || c.id)) s
WHERE (s.detail->>'page_views')::int > 10
