CREATE PROCEDURE temp_upsert_transaction_types	
	@card_scheme_id int, 
	@transaction_type_id int, 
	@name nvarchar(50), 
	@transaction_type_category_id int
AS
BEGIN
	SET NOCOUNT ON
	if exists (select * from transaction_types where card_scheme_id = @card_scheme_id and transaction_type_id = @transaction_type_id)
	begin
		update transaction_types set 
			name = @name,
			transaction_type_category_id = @transaction_type_category_id
		where 
			card_scheme_id = @card_scheme_id and 
			transaction_type_id = @transaction_type_id
	end 
	else
	begin
		insert into transaction_types (card_scheme_id, transaction_type_id, name, transaction_type_category_id) values (@card_scheme_id, @transaction_type_id, @name, @transaction_type_category_id)
	end
END
GO

-- missing transaction codes
EXECUTE temp_upsert_transaction_types 2, 610, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4788, 'DIRECT DEBIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7700, 'ANNUAL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7701, 'LATE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7715, 'DIRECT DEBIT PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 7719, 'LATE PAYMENT FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 7729, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7970, 'CASH ADVANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7990, 'CASH ADVANCE FEE', 1

-- full MV1 list of transaction codes
-- Standard Transaction Codes
EXECUTE temp_upsert_transaction_types 2, 00, 'Purchase', 8
EXECUTE temp_upsert_transaction_types 2, 01, 'ATM Cash Withdrawl', 2
EXECUTE temp_upsert_transaction_types 2, 09, 'Purchase with Cash Back', 8
EXECUTE temp_upsert_transaction_types 2, 12, 'Cash Disbursement', 2
EXECUTE temp_upsert_transaction_types 2, 17, 'Convenience Check', 1
EXECUTE temp_upsert_transaction_types 2, 18, 'Unique Transaction', 1
EXECUTE temp_upsert_transaction_types 2, 19, 'Fee Collection', 1
EXECUTE temp_upsert_transaction_types 2, 20, 'Credit Purchase Return', 8
EXECUTE temp_upsert_transaction_types 2, 28, 'Payment', 7
EXECUTE temp_upsert_transaction_types 2, 29, 'Fee Collection', 1
EXECUTE temp_upsert_transaction_types 2, 30, 'Balance Inquiry', 1
EXECUTE temp_upsert_transaction_types 2, 50, 'Payment/Balance Transfer', 7
EXECUTE temp_upsert_transaction_types 2, 91, 'PIN Unblock', 7
EXECUTE temp_upsert_transaction_types 2, 92, 'PIN Change', 7

-- Financial Adjustment Transaction Codes
EXECUTE temp_upsert_transaction_types 2, 06, 'CHEQUE HOLD AUTHORISATION - ADD', 1
EXECUTE temp_upsert_transaction_types 2, 07, 'CHEQUE HOLD AUTHORISATION - REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 10, 'CASH DISPUTE', 1
EXECUTE temp_upsert_transaction_types 2, 11, 'DISPUTED TRANSACTION', 1
EXECUTE temp_upsert_transaction_types 2, 21, 'DISPUTED TRANSACTION', 1
EXECUTE temp_upsert_transaction_types 2, 24, 'DISPUTED TRANSACTION', 1
EXECUTE temp_upsert_transaction_types 2, 25, 'OPEN ITEM DISPUTE RELEASE', 1
EXECUTE temp_upsert_transaction_types 2, 31, 'RESOLVE DISPUTE - WRITE OFF', 1
EXECUTE temp_upsert_transaction_types 2, 51, 'PREPAID RETURN', 1
EXECUTE temp_upsert_transaction_types 2, 52, 'PREPAID FEE', 1
EXECUTE temp_upsert_transaction_types 2, 53, 'PREPAID FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 54, 'PREPAID LOAD', 1
EXECUTE temp_upsert_transaction_types 2, 55, 'PREPAID LOAD REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 56, 'PREPAID PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 57, 'PREPAID PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 58, 'FORCE POST LOAD', 1
EXECUTE temp_upsert_transaction_types 2, 59, 'FORCE POST LOAD REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 60, 'FORCE POST PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 61, 'FORCE POST PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 62, 'PREPAID DOMESTIC SALE', 1
EXECUTE temp_upsert_transaction_types 2, 63, 'PREPAID - DOM QUASI CASH / RTN', 1
EXECUTE temp_upsert_transaction_types 2, 64, 'PREPAID - DOM QUASI CASH / ATM', 1
EXECUTE temp_upsert_transaction_types 2, 65, 'PREPAID INTERNATIONAL SALE', 1
EXECUTE temp_upsert_transaction_types 2, 66, 'PREPAID - INT QUASI CASH / RTN', 1
EXECUTE temp_upsert_transaction_types 2, 67, 'PREPAID - INT QUASI CASH / ATM', 1
EXECUTE temp_upsert_transaction_types 2, 68, 'FASTER PAYMENT AUTHORIZATION', 1
EXECUTE temp_upsert_transaction_types 2, 69, 'FASTER PAYMENT AUTHORISATION REVERSA', 1
EXECUTE temp_upsert_transaction_types 2, 83, 'RATE CHANGE MEMO', 1
EXECUTE temp_upsert_transaction_types 2, 90, 'AUTO CHARGEBACK', 1
EXECUTE temp_upsert_transaction_types 2, 96, 'CURRENCY CONV MEMO TC', 1
EXECUTE temp_upsert_transaction_types 2, 97, 'CONVERSION - DISPUTES', 1
EXECUTE temp_upsert_transaction_types 2, 98, 'ADD OUTSTANDING AUTHORISATION', 1
EXECUTE temp_upsert_transaction_types 2, 99, 'AUTHORISATION REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 100, 'ANNUAL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 101, 'LATE PAYMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 102, 'OVERLIMIT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 103, 'UNPAID CHEQUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 104, 'TRANSACTION FEE CASH', 1
EXECUTE temp_upsert_transaction_types 2, 105, 'TRANSACTION FEE CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 106, 'MISCELLANEOUS FEE', 1
EXECUTE temp_upsert_transaction_types 2, 107, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 108, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 110, 'RUSH PROCESSING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 112, 'CREDIT LIMIT INCREASE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 113, 'RE-INSTATEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 114, 'PIN REPLACEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 115, 'FAX FEE', 1
EXECUTE temp_upsert_transaction_types 2, 116, 'CARD REPLACEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 117, 'MONTHLY MAINTENANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 118, 'STATEMENT COPY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 119, 'APPLICATION COPY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 120, 'GATS TRANSFER DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 121, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 123, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 124, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 125, 'BALANCE TRANSFER CHARGE', 1
EXECUTE temp_upsert_transaction_types 2, 126, 'CARD BLOCKING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 127, 'PIN CHANGE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 128, 'REWARDS MEMBERSHIP FEE', 1
EXECUTE temp_upsert_transaction_types 2, 129, 'APPLICATION PROCESSING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 130, 'CREDIT PLAN TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 131, 'CASH ATM', 1
EXECUTE temp_upsert_transaction_types 2, 132, 'CASH ADVANCE - MANUAL', 1
EXECUTE temp_upsert_transaction_types 2, 133, 'INTERNATIONAL CASH ADVANCE ATM', 1
EXECUTE temp_upsert_transaction_types 2, 134, 'INTERNATIONAL CASH ADVANCE', 1
EXECUTE temp_upsert_transaction_types 2, 135, 'LOCAL ATM CASH ADVANCE', 1
EXECUTE temp_upsert_transaction_types 2, 136, 'MERCHANT PURCHASE', 1
EXECUTE temp_upsert_transaction_types 2, 137, 'CHEQUE PAID', 1
EXECUTE temp_upsert_transaction_types 2, 138, 'BALANCE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 139, 'BALANCE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 140, 'QUASI CASH', 1
EXECUTE temp_upsert_transaction_types 2, 141, 'QUASI CASH', 1
EXECUTE temp_upsert_transaction_types 2, 142, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 143, 'BILL PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 144, 'INTERNET BILL PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 145, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 146, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 147, 'CONVENIENCE CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 148, 'BALANCE TRANSFER CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 149, 'INSTALMENT PURCHASE', 1
EXECUTE temp_upsert_transaction_types 2, 150, 'QUASI CASH', 1
EXECUTE temp_upsert_transaction_types 2, 151, 'BALANCE TRANSFER CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 152, 'ATM CASH ADVANCE PLUS', 1
EXECUTE temp_upsert_transaction_types 2, 153, 'ATM CASH ADVANCE CIRRUS', 1
EXECUTE temp_upsert_transaction_types 2, 154, 'ATM CASH ADVANCE GATS', 1
EXECUTE temp_upsert_transaction_types 2, 155, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 156, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 157, 'PIN ISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 158, 'BALANCE TRANSFER FEE', 1
EXECUTE temp_upsert_transaction_types 2, 159, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 160, 'PURCHASE', 1
EXECUTE temp_upsert_transaction_types 2, 161, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 162, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 163, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 164, 'LOCAL ATM TRANSFER DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 165, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 166, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 167, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 168, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 169, 'INSTALMENT INTEREST DEBIT ADJ', 1
EXECUTE temp_upsert_transaction_types 2, 170, 'INTERNATIONAL DEBIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 171, 'INTERNATIONAL CASH ADVANCE ADJUSTMEN', 1
EXECUTE temp_upsert_transaction_types 2, 172, 'INTERNATIONAL CASH ADVANCE ADJUSTMEN', 1
EXECUTE temp_upsert_transaction_types 2, 173, 'INTERNATIONAL QUASI CASH ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 175, 'SCHEME TO SCHEME TRANSFER FEE', 1
EXECUTE temp_upsert_transaction_types 2, 176, 'SCHEME TO SCHEME PLASTIC FEE', 1
EXECUTE temp_upsert_transaction_types 2, 177, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 179, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 180, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 181, 'LEGAL FEES', 1
EXECUTE temp_upsert_transaction_types 2, 182, 'LEGAL FEES', 1
EXECUTE temp_upsert_transaction_types 2, 183, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 184, 'COURT COSTS', 1
EXECUTE temp_upsert_transaction_types 2, 185, 'LEGAL FEES', 1
EXECUTE temp_upsert_transaction_types 2, 186, 'LEGAL FEES', 1
EXECUTE temp_upsert_transaction_types 2, 187, 'MISCELLANEOUS LEGAL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 188, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 189, 'BALANCE TRANSFER CONFIRMATION FEE', 1
EXECUTE temp_upsert_transaction_types 2, 190, 'STATEMENT CHANGE DATE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 191, 'BALANCE TRANSFER CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 192, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 193, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 194, 'DOMESTIC CASH ADVANCE FEE (ATM)', 1
EXECUTE temp_upsert_transaction_types 2, 195, 'DOMESTIC CASH ADVANCE FEE (BRANCH)', 1
EXECUTE temp_upsert_transaction_types 2, 196, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 197, 'INTL CASH ADVANCE FEE (ATM)', 1
EXECUTE temp_upsert_transaction_types 2, 198, 'INTERNATIONAL CASH ADVANCE FEE (BRAN', 1
EXECUTE temp_upsert_transaction_types 2, 199, 'SMS MESSAGE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 204, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 206, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 210, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 212, 'UNPAID DIRECT DEBIT PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 213, 'PAYMENT CORRECTION', 1
EXECUTE temp_upsert_transaction_types 2, 215, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 216, 'RETURNED PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 217, 'PAYMENT CORRECTION', 1
EXECUTE temp_upsert_transaction_types 2, 218, 'PAYMENT CORRECTION', 1
EXECUTE temp_upsert_transaction_types 2, 219, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 220, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 221, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 223, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 224, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 229, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 231, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 232, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 233, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 234, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 235, 'DIRECT DEBIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 236, 'RETURNED PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 238, 'HSBC CHEQUE PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 239, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 240, 'CASH PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 241, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 243, 'DIRECT DEBIT PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 244, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 245, 'REMOVE PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 246, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 247, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 248, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 249, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 250, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 251, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 252, 'GAMBLING TRANSACTION', 1
EXECUTE temp_upsert_transaction_types 2, 254, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 260, 'ACCOUNT JOINING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 261, 'ADDITIONAL JOINING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 262, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 263, 'CARD MEMBERSHIP FEE', 1
EXECUTE temp_upsert_transaction_types 2, 264, 'ADDL CARD MEMBERSHIP FEE', 1
EXECUTE temp_upsert_transaction_types 2, 265, 'MEMBERSHIP FEE REBATE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 266, 'ANNIVERSARY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 267, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 268, 'SECONDARY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 270, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 271, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 272, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 273, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 274, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 275, 'HSBC NEW ACCOUNT BALANCE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 276, 'HSBC ACC BAL XFER DR', 1
EXECUTE temp_upsert_transaction_types 2, 277, 'NON HSBC NEW BALANCE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 278, 'STAMP DUTY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 280, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 290, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 291, 'CARD ISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 292, 'RETURNED CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 293, 'EMERGENCY CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 294, 'REISSUE CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 295, 'REISSUE CARD W/DIFF NBR FEE', 1
EXECUTE temp_upsert_transaction_types 2, 296, 'CARD TECH REISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 297, 'ISSUE ADDTL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 300, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 309, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 310, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 311, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 312, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 313, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 320, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 340, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 351, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 359, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 362, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 363, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 400, 'ANNUAL FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 401, 'LATE FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 402, 'OVERLIMIT FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 403, 'UNPAID CHEQUE FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 404, 'CASH TRANSACTION FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 405, 'TRANSACTION FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 406, 'MISCELLANEOUS FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 407, 'INSURANCE PREMIUM REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 408, 'INSURANCE PREMIUM REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 409, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 410, 'REVERSE RUSH PROCESSING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 412, 'REVERSE CREDIT LINE INCREASE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 413, 'REVERSE RE-INSTATEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 414, 'REVERSE PIN REPLACEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 415, 'REVERSE FAX FEE', 1
EXECUTE temp_upsert_transaction_types 2, 416, 'REVERSE CARD REPLACEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 417, 'REVERSE MONTHLY MAINTENANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 418, 'REPLACEMENT STMT COPY FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 419, 'REPLACEMENT APPL COPY FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 420, 'GATS TRANSFER DEBIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 422, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 423, 'CASH TRANSFER FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 424, 'BILL PAYMENT CHARGE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 425, 'BALANCE TRANSFER FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 426, 'CARD BLOCKING REVERSAL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 427, 'PIN CHANGE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 428, 'REWARDS MEMBERSHIP FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 429, 'REVERSE PROCESSING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 430, 'CREDIT PLAN TRANSFER REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 431, 'REVERSAL OF CASH ADVANCE - ATM', 1
EXECUTE temp_upsert_transaction_types 2, 432, 'REVERSAL OF MANUAL CASH ADVANCE', 1
EXECUTE temp_upsert_transaction_types 2, 433, 'INTERNATIONAL CASH ADVANCE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 434, 'INTERNATIONAL CASH ADVANCE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 435, 'LOCAL ATM CASH ADVANCE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 436, 'STORE MERCHANDISE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 437, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 438, 'BALANCE TRANSFER ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 439, 'BALANCE TRANSFER ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 440, 'QUASI CASH REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 441, 'QUASI CASH REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 442, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 443, 'BILL PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 444, 'INTERNET BILL PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 445, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 446, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 447, 'CHEQUE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 448, 'BALANCE TRANSFER REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 449, 'INSTALMENT PURCHASE RETURN', 1
EXECUTE temp_upsert_transaction_types 2, 450, 'QUASI CASH REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 451, 'BALANCE TRANSFER REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 452, 'PLS ATM CASH ADVANCE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 453, 'CRS ATM CASH ADVANCE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 454, 'GTS ATM CASH ADVANCE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 455, 'UTILITY PAYMENT FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 456, 'VENDOR CREDIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 457, 'PIN ISSUE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 458, 'BALANCE TRANSFER FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 459, 'CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 460, 'RETURNED MERCHANDISE', 1
EXECUTE temp_upsert_transaction_types 2, 461, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 462, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 463, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 464, 'LOCAL ATM TRANSFER DEBIT REV', 1
EXECUTE temp_upsert_transaction_types 2, 466, 'VENDOR CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 467, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 468, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 469, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 470, 'INTERNATIONAL PURCHASE ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 471, 'INTERNATIONAL CASH ADVANCE ADJUSTMEN', 1
EXECUTE temp_upsert_transaction_types 2, 472, 'INTERNATIONAL CASH ADVANCE ADJUSTMEN', 1
EXECUTE temp_upsert_transaction_types 2, 473, 'INTERNATIONAL QUASI CASH ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 475, 'SCHEME TO SCHEME TRANSFER FEE REVERS', 1
EXECUTE temp_upsert_transaction_types 2, 476, 'SCHEME TO SCHEME PLASTIC FEE REVERSA', 1
EXECUTE temp_upsert_transaction_types 2, 479, 'MERCHANT LOAN PURCHASE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 480, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 481, 'LEGAL FEES REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 482, 'LEGAL FEES REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 483, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 484, 'COURT COSTS REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 485, 'LEGAL FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 486, 'LEGAL FEES REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 487, 'MISCELLANEOUS LEGAL FEE ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 488, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 489, 'BALANCE TRANSFER CONFIRMATION FEE RE', 1
EXECUTE temp_upsert_transaction_types 2, 490, 'STATEMENT CHANGE DATE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 491, 'BALANCE TRANSFER CHEQUE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 492, 'REBATE CREDIT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 493, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 494, 'DOMESTIC CASH ADVANCE FEE (ATM) REVE', 1
EXECUTE temp_upsert_transaction_types 2, 495, 'DOMESTIC CASH ADVANCE FEE (BRANCH) R', 1
EXECUTE temp_upsert_transaction_types 2, 496, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 497, 'INT''L CASH ADVANCE FEE (ATM) REVERSA', 1
EXECUTE temp_upsert_transaction_types 2, 498, 'INT''L CASH ADVANCE FEE (BRANCH) REVE', 1
EXECUTE temp_upsert_transaction_types 2, 499, 'SMS MESSAGE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 504, 'ATM PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 505, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 506, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 507, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 508, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 509, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 510, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 511, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 512, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 513, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 515, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 517, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 518, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 519, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 520, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 522, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 523, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 524, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 525, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 526, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 527, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 528, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 529, 'PROCESSING FEE PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 530, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 531, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 532, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 533, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 534, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 535, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 536, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 537, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 538, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 539, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 540, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 541, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 542, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 544, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 546, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 547, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 548, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 549, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 550, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 552, 'GAMBLING TRANSACTION REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 554, 'RETRIEVAL REQUEST FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 560, 'ACCOUNT JOINING FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 561, 'ADDITIONAL JOINING FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 562, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 563, 'CARD MEMBERSHIP FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 564, 'ADDL CARD MEMBERSHIP FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 565, 'MEMBERSHIP FEE REBATE', 1
EXECUTE temp_upsert_transaction_types 2, 566, 'ANNIVERSARY FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 567, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 568, 'SECONDARY FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 569, 'ISSUE ADDITIONAL CARD FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 570, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 571, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 572, 'BALANCE TRANSFER CASH REVERSAL NON H', 1
EXECUTE temp_upsert_transaction_types 2, 573, 'BANK FEE PURCHASE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 574, 'BANK FEE CASH PURCHASE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 575, 'HSBC NEW ACC BAL XFER', 1
EXECUTE temp_upsert_transaction_types 2, 576, 'HSBC ACC BAL XFER CR', 1
EXECUTE temp_upsert_transaction_types 2, 577, 'NON HSBC NEW BALANCE TRANSFER REVERS', 1
EXECUTE temp_upsert_transaction_types 2, 578, 'STAMP DUTY FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 580, 'LMS IMMEDIATE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 585, 'REJECT RE-ENTRY CLEAR DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 586, 'REJECT RE-ENTRY CLEAR CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 590, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 591, 'CARD ISSUE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 592, 'RETURNED CARD FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 593, 'EMERGENCY CARD FEE RV', 1
EXECUTE temp_upsert_transaction_types 2, 594, 'REISSUE CARD FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 595, 'REISSCRD W/DF N FEE RV', 1
EXECUTE temp_upsert_transaction_types 2, 596, 'CARD TECH REISS FEE RV', 1
EXECUTE temp_upsert_transaction_types 2, 597, 'ISSUE ADDTL FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 600, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 601, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 609, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 610, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 611, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 612, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 613, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 621, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 630, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 640, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 653, 'BAD DEBT WRITE-OFF', 1
EXECUTE temp_upsert_transaction_types 2, 668, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 725, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 726, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 727, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 728, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 740, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 741, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 742, 'INSURANCE PREMIUM', 1
EXECUTE temp_upsert_transaction_types 2, 750, 'STAMP DUTY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 751, 'CARD ISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 752, 'ISSUE REPLACEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 753, 'RETURNED CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 754, 'NEW PIN MAILER REQUEST FEE', 1
EXECUTE temp_upsert_transaction_types 2, 755, 'SAME PIN MAILER REQ FEE', 1
EXECUTE temp_upsert_transaction_types 2, 756, 'SELECT PIN MAILER REQ FEE', 1
EXECUTE temp_upsert_transaction_types 2, 757, 'EMERGENCY CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 758, 'REISSUE CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 759, 'REISSUE CARD W/DIFF NBR FEE', 1
EXECUTE temp_upsert_transaction_types 2, 760, 'CARD TECH REISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 893, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 894, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 895, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 896, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 897, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 898, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 899, 'INSURANCE PREMIUM CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 900, 'PURGE NON-POST DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 950, 'PURGE NON-POST CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 960, 'PURGE NON-POST MEMO', 1
EXECUTE temp_upsert_transaction_types 2, 4000, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4002, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4003, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4004, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4005, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4006, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4007, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4008, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4009, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4010, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4011, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4012, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4013, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4014, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4015, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4016, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4017, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4018, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4030, 'BALANCE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 4031, 'CASH TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 4032, 'CASH TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 4033, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4034, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4035, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4036, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4037, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4038, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4039, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4040, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4041, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4042, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4043, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4044, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4049, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4050, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4051, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4052, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4053, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4054, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4055, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4056, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4057, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4058, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4059, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4060, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4061, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4062, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4063, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4064, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4065, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4066, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4067, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4068, 'INTEREST', 1
EXECUTE temp_upsert_transaction_types 2, 4069, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4070, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4071, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4072, 'GOODWILL ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4073, 'GOODWILL ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4101, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4102, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4103, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4104, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4105, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4107, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4201, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4202, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4203, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4204, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4205, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4250, 'BALANCE TRANSFER REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4251, 'CASH TRANSFER REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4252, 'CASH TRANSFER REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4253, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4254, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4255, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4256, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4257, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4258, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4259, 'EMERGENCY CASH ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4260, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4261, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4301, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4302, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 4303, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 4304, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4305, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4306, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4307, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4308, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4309, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4310, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4311, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4312, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4313, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4314, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4315, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4316, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4317, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4318, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4319, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4320, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4321, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4322, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4323, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4324, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4325, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4326, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4327, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4328, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4329, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4330, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4331, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4332, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4333, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4334, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4335, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4336, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4337, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4338, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4341, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4349, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4350, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4370, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4371, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4372, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4373, 'CREDIT BALANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 4374, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4375, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4376, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4377, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4378, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4380, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4384, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4385, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4386, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4387, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4388, 'RETURN OF A CREDIT BALANCE', 1
EXECUTE temp_upsert_transaction_types 2, 4389, 'RETURN OF A CREDIT BALANCE', 1
EXECUTE temp_upsert_transaction_types 2, 4390, 'TRANSFER TO BANK ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4391, 'CCA LIABILITY  REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4392, 'CARDGUARD', 1
EXECUTE temp_upsert_transaction_types 2, 4393, 'CONSOLIDATION ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4394, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4395, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4396, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4397, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4398, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4399, 'INTEREST', 1
EXECUTE temp_upsert_transaction_types 2, 4401, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4402, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4403, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4404, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4405, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4406, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4407, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4408, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4409, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4410, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4411, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4412, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4413, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4414, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4415, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4416, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4417, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4418, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4419, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4420, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4421, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4422, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4423, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4424, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4425, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4426, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4427, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4428, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4429, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4430, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4431, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4432, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4433, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4434, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4435, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4436, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4437, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4438, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4439, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4440, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4441, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4442, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4443, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4444, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4445, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4446, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4447, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4448, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4449, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4450, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4451, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4452, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4453, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4454, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4455, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4456, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4457, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4458, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4474, 'CREDIT BALANCE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4477, 'GOODWILL ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4478, 'GOODWILL ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4479, 'GOODWILL ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4489, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4493, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4496, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4500, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4501, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4502, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4503, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4515, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4551, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4561, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4671, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4672, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4680, 'CASH TRANSFER FEE', 1
EXECUTE temp_upsert_transaction_types 2, 4681, 'BILL PAYMENT CHARGE', 1
EXECUTE temp_upsert_transaction_types 2, 4682, 'COPY VOUCHER FEE', 1
EXECUTE temp_upsert_transaction_types 2, 4683, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4684, 'DISPUTE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 4685, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4687, 'CASH ADVANCE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4701, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4702, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4704, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4705, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4706, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4707, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4709, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4710, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4711, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4712, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4713, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4714, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4715, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4716, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4717, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4748, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4749, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4752, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4753, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4754, 'COMMERCIAL CHARGE', 1
EXECUTE temp_upsert_transaction_types 2, 4755, 'DPA ENQUIRY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 4756, 'COURIER CHARGES', 1
EXECUTE temp_upsert_transaction_types 2, 4757, 'COMMERCIAL CHARGE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4758, 'DPA ENQUIRY FEE  REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 4759, 'COPY STATEMENT FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 4760, 'COURIER CHARGE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 4761, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4762, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4763, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4764, 'FEE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 4765, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4766, 'FEE TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 4767, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4768, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4769, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4770, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4772, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 4773, 'CASH PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 4774, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 4775, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 4776, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 4777, 'UNPAID CHEQUE', 1
EXECUTE temp_upsert_transaction_types 2, 4778, 'CREDIT ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 4779, 'TRANSFER FROM A BANK ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4780, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4782, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4783, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4784, 'TRANSFER TO BANK ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4785, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4786, 'PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 4787, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4788, 'DIRECT DEBIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4801, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4802, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4850, 'PAYMENT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 4851, 'UNPAID DIRECT DEBIT FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 4852, 'UNPAID DIRECT DEBIT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 4853, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4854, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4855, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4856, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4857, 'STATEMENT MESSAGE HISTORY (MEMO)', 1
EXECUTE temp_upsert_transaction_types 2, 4858, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4859, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4941, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4981, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4982, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4998, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 4999, 'RESERVED FOR CCA/ STATEMENT - TERRY', 1
EXECUTE temp_upsert_transaction_types 2, 7001, 'INTEREST REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 7002, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7003, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7004, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7005, 'TRIAD MEMBERSHIP FEE DISCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7006, 'CARD FEE DISCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7011, 'SEC CARD MEM FEE DISCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7012, 'ADDL CARD MEM FEE DISCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7013, 'LUMP CARD MEM FEE DISCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7014, 'FUNDS TRANSFER FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7015, 'SECONDARY CARD MEMB FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7024, 'ACH SETUP FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7025, 'CHK SETUP FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7026, 'ACH ONE TIME FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7027, 'CHK ONE TIME FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7028, 'ACH RECUR FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7029, 'CHK RECUR FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7030, 'CHK ORIGNATION PMT', 1
EXECUTE temp_upsert_transaction_types 2, 7031, 'STAMP DUTY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7032, 'CARD ISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7033, 'ISSUE REPLACEMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7034, 'RETURNED CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7035, 'NEW PIN MAILER REQUEST FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7036, 'SAME PIN MAILER REQ FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7037, 'SELECT PIN MAILER REQ FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7038, 'EMERGENCY CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7039, 'REISSUE CARD FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7040, 'REISSUE CARD W/DIFF NBR FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7041, 'CARD TECH REISSUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7042, 'ISSUE ADDITIONAL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7500, 'MEMBERSHIP FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 7614, 'ACTUAL MNGT CHARGE CR ADJSUTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7672, 'DC BALANCE INQUIRY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7673, 'DC BALANCE INQUIRY FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7674, 'DC MINI STMT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7675, 'DC MINI STMT FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7676, 'DC INTL ATM WDRL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7677, 'DC INTL ATM WDRL FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7678, 'DC DOM ATM WDRL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7679, 'DC DOM ATM WDRL FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7680, 'DC INTL POS WDRL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7681, 'DC INTL POS WDRL FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7682, 'DC DOM POS WDRL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7683, 'DC DOM POS WDRL FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7684, 'DC LOCAL NETWORK FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7685, 'DC LOCAL NETWORK FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7686, 'DC GATS FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7687, 'DC GATS FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7688, 'DC UBP FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7689, 'DC UBP FEE REV', 1
EXECUTE temp_upsert_transaction_types 2, 7700, 'ANNUAL FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7701, 'LATE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7702, 'OVERLIMIT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7703, 'UNPAID CHEQUE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7704, 'UNPAID DIRECT DEBIT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7705, 'SERVICE CHARGE ASSESSED', 1
EXECUTE temp_upsert_transaction_types 2, 7706, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7707, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7708, 'UNPAID PAYMENT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7709, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7710, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7711, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7712, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7713, 'INTEREST', 1
EXECUTE temp_upsert_transaction_types 2, 7714, 'INTEREST', 1
EXECUTE temp_upsert_transaction_types 2, 7715, 'DIRECT DEBIT PAYMENT - THANK YOU', 1
EXECUTE temp_upsert_transaction_types 2, 7716, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7717, 'CHARGE OFF ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7718, 'CHARGE OFF ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7719, 'LATE PAYMENT FEE REFUND', 1
EXECUTE temp_upsert_transaction_types 2, 7720, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7721, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7722, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7723, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7724, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7725, 'LOAN SKIP PMT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7726, 'ACCT SKIP PMT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7727, 'BILL BALANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7728, 'AMANAH MANAGEMENT CHARGE', 1
EXECUTE temp_upsert_transaction_types 2, 7729, 'INTEREST ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7730, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7731, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7732, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7733, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7734, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7735, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7736, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7737, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7738, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7739, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7740, 'MEMBERSHIP FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7741, 'STATEMENT REPRINT FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7742, 'SMS MESSAGE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7743, 'FAILED SI FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7744, 'ANNIV FEE ASSESSMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7745, 'MNGT CHG REBATE', 1
EXECUTE temp_upsert_transaction_types 2, 7746, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7747, 'AUTO REL DISPUTE WITH INT', 1
EXECUTE temp_upsert_transaction_types 2, 7748, 'AUTO REL DISPUTE WITHOUT INT', 1
EXECUTE temp_upsert_transaction_types 2, 7749, 'ACCRUED INTEREST CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7750, 'INITIAL NON-POST DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 7751, 'NON-POST BATCH DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 7752, 'NON-POST DEBIT PURGE', 1
EXECUTE temp_upsert_transaction_types 2, 7753, 'REPEAT NON-POST DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 7754, 'NON-POST CREDIT BATCH REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7755, 'NON-POST CREDIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7756, 'ACCT JOINING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7757, 'ADDITIONAL JOINING FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7758, 'VALUE ADDED TAX ASSESSMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7759, 'VALUE ADDED TAX REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7760, 'CARD MEMBERSHIP FEE IND', 1
EXECUTE temp_upsert_transaction_types 2, 7761, 'ADDITIONAL CARD MEMB FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7762, 'DD REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7763, 'BILL PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7764, 'CASH TRANSFER', 1
EXECUTE temp_upsert_transaction_types 2, 7765, 'COMP BAL XFR', 1
EXECUTE temp_upsert_transaction_types 2, 7766, 'SECONDARY FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7767, 'UNPAID DD PAYMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7768, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7769, 'SKIP DEFER FIN CHG BILLED', 1
EXECUTE temp_upsert_transaction_types 2, 7770, 'SKIP DEFER FIN CHG CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7771, 'SKIP DEFER FIN CHG DEBIT', 1
EXECUTE temp_upsert_transaction_types 2, 7773, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7774, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7775, 'REBATE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7776, 'REBATE CREDIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7777, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7778, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7779, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7780, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7781, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7782, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7783, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7784, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7785, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7786, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7787, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7788, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7789, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7790, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7791, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7792, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7793, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7794, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7795, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7796, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7797, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7798, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7799, 'CARD MEMBERSHIP FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7800, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7801, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7802, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7803, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7804, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7805, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7806, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7807, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7808, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7809, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7810, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7811, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7812, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7813, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7814, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7815, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7816, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7817, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7818, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7819, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7820, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7821, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7822, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7823, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7824, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7825, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7826, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7827, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7828, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7829, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7830, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7831, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7832, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7833, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7834, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7835, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7836, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7837, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7838, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7839, 'BAD AND DOUBTFUL DEBIT IN', 1
EXECUTE temp_upsert_transaction_types 2, 7840, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7841, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7842, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7843, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7844, 'UNPAID CHEQUE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7845, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7846, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7847, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7848, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7849, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7850, 'INITIAL NON-POST CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7851, 'NON-POST BATCH CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7852, 'NON-POST CREDIT PURGE', 1
EXECUTE temp_upsert_transaction_types 2, 7853, 'REPEAT NON-POST CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7854, 'NON-POST DEBIT BATCH REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7855, 'NON-POST DEBIT REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7856, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7857, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7858, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7859, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7860, 'UNPPAID DIRECT DEBIT FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7861, 'UNPAID PAYMENT FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7862, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7863, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7864, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7865, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7866, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7867, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7868, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7869, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7870, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7871, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7872, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7873, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7874, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7875, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7876, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7877, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7878, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7879, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7880, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7881, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7882, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7883, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7884, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7885, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7886, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7887, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7888, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7889, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7890, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7891, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7892, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7893, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7894, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7895, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7896, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7897, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7898, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7899, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7900, 'LATE FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7901, 'MEMBERSHIP FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7902, 'OVERLIMIT FEE CREDIT', 1
EXECUTE temp_upsert_transaction_types 2, 7903, 'DELINQUENT FIN CHGS CR ADJ', 1
EXECUTE temp_upsert_transaction_types 2, 7904, 'DELINQUENT FIN CHGS PAID', 1
EXECUTE temp_upsert_transaction_types 2, 7905, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7906, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7907, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7908, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7909, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7910, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7911, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7912, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7913, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7914, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7915, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7916, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7917, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7918, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7919, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7920, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7921, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7922, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7923, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7924, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7925, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7926, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7927, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7928, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7929, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7930, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7931, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7932, 'INTEREST REBATE', 1
EXECUTE temp_upsert_transaction_types 2, 7933, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7934, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7935, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7936, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7937, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7938, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7939, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7940, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7941, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7942, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7943, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7944, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7945, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7946, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7947, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7948, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7949, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7950, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7951, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7952, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7953, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7954, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7955, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7956, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7957, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7958, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7959, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7961, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7962, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7963, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7964, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7965, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7966, 'EXCHANGE RATE ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7967, 'EXCHANGE RATE ADJUSTMENT', 1
EXECUTE temp_upsert_transaction_types 2, 7968, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7969, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7970, 'CASH ADVANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7971, 'CASH ADVANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7972, 'CASH ADVANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7973, 'BALANCE TRANSFER FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7974, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7975, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7976, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7977, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7978, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7979, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7980, 'CASH ADVANCE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7981, 'CASH ADVANCE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7982, 'CASH ADVANCE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7983, 'BALANCE TRANSFER FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7984, 'CASH TRANSFER FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7985, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7986, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7987, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7988, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7989, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7990, 'CASH ADVANCE FEE', 1
EXECUTE temp_upsert_transaction_types 2, 7991, 'CASH ADVANCE FEE REVERSAL', 1
EXECUTE temp_upsert_transaction_types 2, 7992, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7993, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7994, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7996, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 7997, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8900, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8901, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8902, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8903, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8904, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8907, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8908, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 8909, 'ADJUSTMENT TO YOUR ACCOUNT', 1
EXECUTE temp_upsert_transaction_types 2, 9900, 'ADJUSTMENT TO YOUR ACCOUNT', 1
GO

DROP PROCEDURE temp_upsert_transaction_types