-- Regular single quotes:
SELECT 'This is a literal with a '' single quote';

-- Dollar quotes:
SELECT $$This is a literal with a ' single quote$$;

-- Tagged dollar quotes:
SELECT $tag$I can even include $$ in $$ quotes$tag$;
