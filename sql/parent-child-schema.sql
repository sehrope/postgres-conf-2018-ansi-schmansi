CREATE TABLE parent (
    id          serial PRIMARY KEY,
    name        text NOT NULL,
    type        text NOT NULL,
    created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE child (
    id          serial PRIMARY KEY,
    parent_id   int NOT NULL REFERENCES parent (id),
    name        text NOT NULL,
    created_at  timestamptz NOT NULL DEFAULT now()
);

INSERT INTO parent (name, type) VALUES ('foo', 'wizzle');
INSERT INTO parent (name, type) VALUES ('bar', 'wizzle');
INSERT INTO parent (name, type) VALUES ('baz', 'wozzle');

INSERT INTO child (name, parent_id) SELECT 'a', (SELECT id FROM parent WHERE name = 'foo');
INSERT INTO child (name, parent_id) SELECT 'b', (SELECT id FROM parent WHERE name = 'foo');
INSERT INTO child (name, parent_id) SELECT 'c', (SELECT id FROM parent WHERE name = 'foo');
INSERT INTO child (name, parent_id) SELECT 'd', (SELECT id FROM parent WHERE name = 'bar');

