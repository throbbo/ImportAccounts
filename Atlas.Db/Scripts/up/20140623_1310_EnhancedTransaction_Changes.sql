ALTER TABLE transaction_car_rental_summaries ADD no_show_charged bit null
-- UPDATE transaction_car_rental_summaries SET no_show_charged = (no_show_indicator = 1)
ALTER TABLE transaction_car_rental_summaries DROP COLUMN no_show_indicator

ALTER TABLE transaction_legs ALTER COLUMN service_class nvarchar(255) null
ALTER TABLE transaction_legs ALTER COLUMN fare_basis nvarchar(255) null