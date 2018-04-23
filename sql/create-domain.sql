-- Account ids start with an "A" followed by 8 digits
CREATE DOMAIN account_id_type AS text
  CONSTRAINT account_id_type_ck_format
    CHECK (VALUE ~ '^A[0-9]{8}$');

-- Usernames must start with a letter and be alphanumeric
CREATE DOMAIN app_username AS text
  CONSTRAINT app_username_ck_valid
    CHECK (VALUE ~ '^[a-z][a-z0-9]{2,254}$');

-- Person ids start with an "P" followed by 15 digits
CREATE DOMAIN person_id_type AS text
  CONSTRAINT person_id_type_ck_format
    CHECK (VALUE ~ '^P[0-9]{15}$');
