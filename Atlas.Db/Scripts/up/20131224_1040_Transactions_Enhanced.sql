CREATE TABLE transaction_line_items
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_line_item_id int identity NOT NULL
	,item_sequence_number int NOT NULL
	,message_identifier nvarchar(20)
	,item_commodity_code nvarchar(20)
	,item_descriptor nvarchar(50)
	,quantity numeric(16,4)
	,unit_cost numeric(16,4)
	,unit_measure nvarchar(20)
	,tax_amount numeric(16,4)
	,type_supply int
	,last_item_indicator int
	,tax_rate numeric(16,4)
	,item_discount_amount numeric(16,4)
	,item_total_amount numeric(16,4)
	,item_product_code nvarchar(20)
	,service_identifier nvarchar(10)
	,purchase_id nvarchar(70)
	,line_item_sales_tax_charged_flag int
	,item_level_usage_code nvarchar(10)
	,line_item_source nvarchar(20)
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_line_items PRIMARY KEY (transaction_id,transaction_line_item_id)
)
	
CREATE TABLE transaction_line_item_summaries
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_line_item_summary_id int identity NOT NULL
	,discount_amount numeric(16,4)
	,freight_amount numeric(16,4)	
	,duty_amount numeric(16,4)	
	,destination_postal_code nvarchar(14)
	,source_postal_code nvarchar(14)
	,destination_country nvarchar(50)
	,destination_country_iso_code char(3)
	,vat_reference_number nvarchar(16)
	,order_date date NULL
	,freight_tax_amount numeric(16,4)
	,freight_tax_rate numeric(16,4)
	,service_identifier nvarchar(10)
	,purchase_id nvarchar(70)
	,source_country nvarchar(50)
	,source_country_iso_code char(3)
	,destination_state nvarchar(4)
	,source_state nvarchar(4)
	,source nvarchar(10)	
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_line_item_summaries PRIMARY KEY (transaction_id,transaction_line_item_summary_id)
)

CREATE TABLE transaction_passengers
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_passenger_id int IDENTITY NOT NULL
	,departure_date date
	,travel_agency_code nvarchar(20)
	,travel_agency_name nvarchar(50)
	,restricted_ticket bit NULL
	,ticket_number nvarchar(20)
	,passenger_name nvarchar(50)
	,exchange_ticket_number nvarchar(20)
	,exchange_ticket_amount numeric(16,4)
	,internet_ticket bit
	,total_fare_amount numeric(16,4)
	,total_fee_amount numeric(16,4)
	,total_tax_amount numeric(16,4)
	,endorsement_restrictions nvarchar(50)
	,purchase_id nvarchar(70)
	,passenger_specific_data  nvarchar(70)
	,ticket_issue_date date
	,number_of_legs int
	,eticket bit
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,travel_obligation_number nvarchar(20)
	,tcn_passenger_name nvarchar(70)
	,CONSTRAINT pk_transaction_passengers PRIMARY KEY (transaction_id,transaction_passenger_id)
)

CREATE TABLE transaction_lodgings
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_lodging_id int identity NOT NULL	
	,daily_room_rate numeric(16,4) NULL
	,discount_rate numeric(16,4) NULL
	,total_food_beverage_charges numeric(16,4) NULL
    ,total_folio_cash_advances numeric(16,4) NULL
	,total_valet_parking_charges numeric(16,4) NULL
	,total_mini_bar_charges numeric(16,4) NULL
	,total_laundry_charges numeric(16,4) NULL
	,total_telephone_charges numeric(16,4) NULL
	,total_gift_shop_purchases numeric(16,4) NULL
	,total_movie_charges numeric(16,4) NULL
	,total_business_center_charges numeric(16,4) NULL
	,health_club_charges numeric(16,4) NULL
	,room_tax_amount numeric(16,4) NULL
	,room_tax_amount_2 numeric(16,4) NULL
	,room_tax_amount_3 numeric(16,4) NULL
	,room_tax_amount_4 numeric(16,4) NULL
	,total_other_charges numeric(16,4) NULL
	,description_of_other_charge nvarchar(20)
	,extra_charge_code nvarchar(5)
	,purchase_id nvarchar(70)	
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_lodgings PRIMARY KEY (transaction_id,transaction_lodging_id)
)

CREATE TABLE transaction_lodging_summaries
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_lodging_summary_id int identity NOT NULL
	,no_show_charged bit NULL
	,check_in_date date
	,daily_room_rate numeric(16,4) NULL
	,total_other_charges numeric(16,4) NULL
	,total_tax_amount numeric(16,4) NULL
	,total_food_beverage_charges numeric(16,4) NULL
	,total_prepaid_expenses numeric(16,4) NULL
	,total_folio_cash_advances numeric(16,4) NULL
	,total_valet_parking_charges numeric(16,4) NULL
	,total_mini_bar_charges numeric(16,4) NULL
	,total_laundry_charges numeric(16,4) NULL
	,total_telephone_charges numeric(16,4) NULL
	,total_gift_shop_purchases numeric(16,4) NULL
	,total_movie_charges numeric(16,4) NULL
	,total_business_center_charges numeric(16,4) NULL
	,health_club_charges numeric(16,4) NULL
	,extra_charge_code nvarchar(10)
	,total_room_tax_amount numeric(16,4) NULL
	,lodging_nights int NULL
	,total_non_room_charges numeric(16,4) NULL
	,purchase_id nvarchar(70)
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_lodging_summaries PRIMARY KEY (transaction_id,transaction_lodging_summary_id)
)

CREATE TABLE transaction_car_rentals
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_car_rental_id int IDENTITY NOT NULL
	,daily_rental_rate numeric(16,4)
	,other_charges numeric(16,4)
	,insurance_charges numeric(16,4)
	,auto_towing_charges numeric(16,4)
	,extra_mileage_charges numeric(16,4)
	,telephone_charges numeric(16,4)
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_car_rentals PRIMARY KEY (transaction_id,transaction_car_rental_id)
)
	
CREATE TABLE transaction_car_rental_summaries
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_car_rental_summary_id int IDENTITY NOT NULL
	,no_show_indicator int
	,daily_rental_rate numeric(16,4)
	,other_charges numeric(16,4)
	,check_out_date date
	,weekly_rental_rate numeric(16,4)
	,insurance_charges numeric(16,4)
	,fuel_charges numeric(16,4)
	,class_code nvarchar(10)
	,one_way_drop_off_charges numeric(16,4)
	,renter_name nvarchar(50)
	,auto_towing_charges numeric(16,4)
	,regular_mileage_charges numeric(16,4)
	,extra_mileage_charges numeric(16,4)
	,late_return_charges numeric(16,4)
	,return_location nvarchar(50)
	,total_tax numeric(16,4)
	,telephone_charges numeric(16,4)
	,corporate_identification nvarchar(20)
	,extra_charge_code nvarchar(10)
	,days_rented int
	,purchase_id nvarchar(70)
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_car_rental_summaries PRIMARY KEY (transaction_id,transaction_car_rental_summary_id)
)

	
CREATE TABLE transaction_legs
(
	transaction_id int NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id)
	,transaction_leg_id int identity NOT NULL
	,leg_number int
	,destination_code nvarchar(10)
	,carrier_code nvarchar(10)
	,service_class nvarchar(10)
	,fare_basis nvarchar(10)
	,departure_date datetime null
	,stopover_code int null
	,coupon_number int null
	,carrier_reference_number nvarchar(10)
	,origination_code nvarchar(10)
	,conjunction_ticket_number nvarchar(20)
	,purchase_id nvarchar(70)
	,international_leg bit
	,arrival_date datetime null
	,departure_tax numeric(16,4)
	,optional_field_1 nvarchar(50)
	,optional_field_2 nvarchar(50)
	,optional_field_3 nvarchar(50)
	,optional_field_4 nvarchar(50)
	,CONSTRAINT pk_transaction_legs PRIMARY KEY (transaction_id,transaction_leg_id)
)
	