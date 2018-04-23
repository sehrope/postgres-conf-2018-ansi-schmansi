CREATE TABLE menu_item (
  id                        uuid PRIMARY KEY,
  menu_date                 date NOT NULL,
  name                      text NOT NULL,
  price                     numeric NOT NULL,
  is_daily_special          boolean NOT NULL DEFAULT false
);

CREATE INDEX menu_item_ix_menu_date_name
  ON menu_item (menu_date, name);

-- Only allow one item to be the daily special per day
CREATE UNIQUE INDEX menu_item_uk_menu_date_is_daily_special
  ON menu_item (menu_date)
  WHERE is_daily_special;
