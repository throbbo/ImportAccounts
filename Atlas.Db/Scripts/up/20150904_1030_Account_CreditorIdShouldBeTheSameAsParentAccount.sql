update accounts set 
	creditor_id = pa.creditor_id
from accounts 
	inner join accounts pa on accounts.parent_account_id = pa.account_id
where accounts.parent_account_id is not null