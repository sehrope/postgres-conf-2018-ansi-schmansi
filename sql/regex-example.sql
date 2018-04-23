SELECT *
FROM conference c
WHERE c.year = 2018
  AND c.name ~* '(postgresql)|(pgsql)'
