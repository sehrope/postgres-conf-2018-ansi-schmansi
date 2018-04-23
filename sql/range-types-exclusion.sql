CREATE TABLE reservation (
    id              bigserial PRIMARY KEY,
    room_id         bigint NOT NULL REFERENCES room (id),
    booking_dates   daterange NOT NULL,
    -- Prohibit overlapping bookings for the same room:
    CONSTRAINT reservation_uk_room_id_booking_dates
      EXCLUDE USING gist
        (room_id WITH =, booking_dates WITH &&),
    -- Ensure that the daterange are half open
    CONSTRAINT reservation_ck_booking_dates_valid
      CHECK (        lower_inc(booking_dates)
             AND NOT upper_inc(booking_dates))
);
