CREATE EXTENSION postgres_fdw;
CREATE SERVER billing_db
   FOREIGN DATA WRAPPER postgres_fdw
   OPTIONS ( /* Server info for billing database */ );
CREATE USER MAPPING FOR public
  SERVER billing_db
  OPTIONS ( /* Credentails for billing database */ );
CREATE FOREIGN TABLE billing_transaction (
    id                  uuid NOT NULL,
    customer_id         uuid NOT NULL,
    created_at          timestamptz NOT NULL,
    amount              numeric NOT NULL
  ) SERVER billing_db;
