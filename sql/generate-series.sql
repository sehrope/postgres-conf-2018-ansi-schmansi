-- Without a built-in generator:
SELECT x
FROM (SELECT ROWNUM AS x
      FROM some_big_table_i_hope_is_big_enough) t;
WHERE x < 1000;

-- With built-in generate_series(...)
SELECT x
FROM generate_series(1, 100) x;
