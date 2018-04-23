-- Workaround with CASE ... WHEN ... END
SELECT
  SUM(CASE
        WHEN c.type = 'postgres' THEN 1 ELSE 0
      END) AS num_postgres,
  SUM(CASE
        WHEN c.type != 'postgres' THEN 1 ELSE 0
      END) AS num_non_postgres
FROM conference c

-- With filtered aggregates
SELECT
  COUNT(*) FILTER (WHERE c.type = 'postgres')
    AS num_postgres,
  COUNT(*) FILTER (WHERE c.type != 'postgres')
    AS num_non_postgres
FROM conference c
