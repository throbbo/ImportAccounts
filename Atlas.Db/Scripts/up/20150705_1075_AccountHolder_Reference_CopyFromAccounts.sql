update account_holders set
reference = a.reference
from account_holders ah
inner join accounts a on a.account_holder_id = ah.account_holder_id