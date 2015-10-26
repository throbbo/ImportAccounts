update transactions 
set transaction_type_id = 28
from transactions t
	inner join merchants m on t.merchant_id = m.merchant_id
where t.card_scheme_id in (select card_scheme_id from card_schemes where card_feed_type = 'cdf')
	and m.name = 'payment - thank you' 