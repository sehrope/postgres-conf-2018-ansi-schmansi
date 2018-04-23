CREATE EXTENSION redis_fdw;
CREATE SERVER redis_server
  FOREIGN DATA WRAPPER redis_fdw
  OPTIONS ( /* Server details for Redis */ );
CREATE USER MAPPING FOR PUBLIC
  SERVER redis_server
  OPTIONS ( /* Credentials for Redis */ );
CREATE FOREIGN TABLE redis_session (
    key text,
    value text)
  SERVER redis_server;
