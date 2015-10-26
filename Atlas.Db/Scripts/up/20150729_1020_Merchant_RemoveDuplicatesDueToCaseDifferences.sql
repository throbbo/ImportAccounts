-- map transactions to the first merchant when merchant has been duplicated
update t
set t.merchant_id = md.first_merchant_id
from transactions t
inner join merchants m on t.merchant_id = m.merchant_id
left join (
select m.name, m.card_scheme_id, m.merchant_category_code, m.post_code, m.city, m.card_acceptor_id, min(m.merchant_id) as first_merchant_id, count(*) as duplicates from merchants m
group by m.name, m.card_scheme_id, m.merchant_category_code, m.post_code, m.city, m.card_acceptor_id
) md on
       (
                 m.name = md.name and
                 m.card_scheme_id = md.card_scheme_id and
                 m.merchant_category_code = md.merchant_category_code and
                 m.post_code = md.post_code and
                 m.city = md.city and
                 m.card_acceptor_id = md.card_acceptor_id and
                 md.duplicates > 1
       )
where md.first_merchant_id is not null and t.merchant_id != md.first_merchant_id


--remove duplicated merchants
delete from merchants
where merchant_id not in
(
    select distinct merchant_id from transactions
)