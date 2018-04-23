COPY (
  SELECT s.*
  FROM some_huge_table s
  WHERE s.foo = 'bar'
    AND s.baz = 123
) TO STDOUT
WITH (FORMAT CSV)
