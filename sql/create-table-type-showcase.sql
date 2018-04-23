CREATE TABLE foobar (
  id                    uuid PRIMARY KEY,
  name                  text NOT NULL,
  is_active             boolean NOT NULL DEFAULT false,
  last_accessed_from    inet,
  detail                json,
);
