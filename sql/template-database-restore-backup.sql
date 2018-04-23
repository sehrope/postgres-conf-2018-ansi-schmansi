-- Drop the current app database:
DROP DATABASE app;
-- Create it again from our backup:
CREATE DATABASE app
  TEMPLATE app_backup
  OWNER app_owner;
