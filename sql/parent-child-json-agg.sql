SELECT
  p.id,
  p.name,
  p.type,
  (SELECT
      -- Convert NULL to empty list:
      COALESCE(json_agg(t.*), '[]'::json)
    FROM (
      -- Sub-SELECT to get subset of keys we want:
      SELECT 
        c.id,
        c.name
      FROM child c
      WHERE c.parent_id = p.id) t) AS children
FROM parent p
