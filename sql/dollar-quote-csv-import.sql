SELECT
  t.fields[1] AS title,
  t.fields[2]::date AS start_date,
  t.fields[3]::date AS end_date,
  t.fields[4] AS city
FROM (
  SELECT regexp_split_to_array(line, ',') AS fields
  FROM regexp_split_to_table(
$$PGConf US,2016-04-18,2016-04-20,New York City
PostgresConf US 2017,2017-03-28,2017-03-31,Jersey City
PostgresConf US 2018,2018-04-16,2018-04-20,Jersey City$$
       , '\n') AS line) t
