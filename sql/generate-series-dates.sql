SELECT now()::date - x AS some_date
FROM generate_series(1, 100) x;
