BEGIN;
CREATE FUNCTION pg_temp.convert_legacy_id (p_id IN int)
  RETURNS uuid
  AS $BODY$
  SELECT encode(substring(pgcrypto.hmac('' || 1, 'some-random-key', 'sha256'), 1 ,16), 'hex')::uuid;
  $BODY$
  LANGUAGE SQL;
ALTER TABLE foo ADD new_id uuid;