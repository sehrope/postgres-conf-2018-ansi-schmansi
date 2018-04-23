CREATE TABLE person (
  id            person_id_type PRIMARY KEY,
  username      app_username,
  name          text NOT NULL
);

CREATE TABLE account (
    id          account_id_type PRIMARY KEY,
    owner_id    person_id_type NOT NULL REFERENCES person (id),
    balance     numeric NOT NULL
);
