---- VCF changes

update transaction_car_rentals set
extra_mileage_charges = extra_mileage_charges / 100,
telephone_charges = telephone_charges / 100,
other_charges = other_charges / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'vcf'
)

update transaction_car_rental_summaries set
daily_rental_rate = daily_rental_rate / 100,
other_charges = other_charges / 100,
weekly_rental_rate = weekly_rental_rate / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'vcf'
)

update transaction_lodgings set
daily_room_rate = daily_room_rate / 100,
discount_rate = discount_rate / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'vcf'
)

update transaction_lodging_summaries set
daily_room_rate = daily_room_rate / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'vcf'
)

---- CDF changes

update transaction_passengers set
total_fare_amount = total_fare_amount / 100,
total_fee_amount = total_fee_amount / 100,
total_tax_amount = total_tax_amount / 100,
exchange_ticket_amount = exchange_ticket_amount / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'cdf'
)

update transaction_car_rental_summaries set
auto_towing_charges = auto_towing_charges / 100,
extra_mileage_charges = extra_mileage_charges / 100,
fuel_charges = fuel_charges / 100,
late_return_charges = late_return_charges / 100,
one_way_drop_off_charges = one_way_drop_off_charges / 100,
other_charges = other_charges / 100,
regular_mileage_charges = regular_mileage_charges / 100,
total_tax = total_tax / 100,
weekly_rental_rate = weekly_rental_rate / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'cdf'
)

update transaction_line_items set
item_discount_amount = item_discount_amount / 100,
item_total_amount = item_total_amount / 100,
quantity = quantity / 10000,
tax_amount = tax_rate / 100, -- tax_amount and tax_rate were switched
tax_rate = tax_amount / 100, -- tax_amount and tax_rate were switched
unit_cost = unit_cost / 10000
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'cdf'
)

update transaction_lodging_summaries set
health_club_charges = health_club_charges / 100,
total_business_center_charges = total_business_center_charges / 100,
total_food_beverage_charges = total_food_beverage_charges / 100,
total_gift_shop_purchases = total_gift_shop_purchases / 100,
total_laundry_charges = total_laundry_charges / 100,
total_mini_bar_charges = total_mini_bar_charges / 100,
total_movie_charges = total_movie_charges / 100,
total_non_room_charges = total_non_room_charges / 100,
total_prepaid_expenses = total_prepaid_expenses / 100,
total_tax_amount = total_tax_amount / 100,
total_telephone_charges = total_telephone_charges / 100,
total_valet_parking_charges = total_valet_parking_charges / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'cdf'
)

update transaction_line_item_summaries set
discount_amount = discount_amount / 100,
duty_amount = duty_amount / 100,
freight_amount = freight_amount / 100,
freight_tax_amount = freight_tax_amount / 100,
freight_tax_rate = freight_tax_rate / 100
where transaction_id in
(
	select tp.transaction_id from transaction_passengers tp
	inner join transactions t on tp.transaction_id = t.transaction_id
	inner join accounts a on t.account_id = a.account_id
	inner join card_schemes cs on a.card_scheme_id = cs.card_scheme_id
	where card_feed_type = 'cdf'
)

-- delete all enhanced transaction projections as they are now incorrect
delete enhanced_transaction_projections