BEGIN;
CREATE TABLE foo (/* ... */);
CREATE INDEX foo_ix_id ON foo (/* ... */);
INSERT INTO foo (/* ... */);
CREATE TABLE bar (/* ... */);
CREATE INDEX bar_ix_id ON bar (/* ... */);
CREATE INDEX bar_ix_foo_id ON bar (/* ... */);
INSERT INTO bar (/* ... */);
COMMIT; -- Or ROLLBACK!
