/* Martin Campos 
/* Answer 1 */
use om;

select concat(customer_first_name,' ', customer_last_name) as 'customer_name',
concat(customer_address,',',' ', customer_city,' ', customer_zip) as 'customer address',
concat('Phone #: ', customer_phone)
from customers
order by customer_last_name;

/*Answer 2*/
use ap;
select invoice_id, vendor_name,invoice_number, invoice_due_date, (invoice_total-payment_total-credit_total) as balance_left,"low balance" as balance_level
from invoices i
join vendors v on i.vendor_id = v.vendor_id
where(invoice_total-payment_total-credit_total)<100 and (invoice_total-payment_total-credit_total) > 0
union
select invoice_id,vendor_name, invoice_number,invoice_due_date, (invoice_total-payment_total-credit_total) as balance_left, "HIGH_BALANCE" as balance_level
from invoices i
join vendors v on i.vendor_id = v.vendor_id
where(invoice_total-payment_total-credit_total)>=100 
order by invoice_due_date, invoice_number,balance_left;

/*Answer 3 */
use om;

select concat(customer_first_name, " " , customer_last_name) as customer_name,
concat(DATE_FORMAT(order_date, "%m"),"/",
DATE_FORMAT(order_date,"%Y"))as order_month,item_id
from customers
left join orders on customers.customer_id = orders.customer_id
left join order_details on orders.order_id = order_details.order_id
where customer_last_name >= "Q"
order by customer_last_name;

/*Answer 4 */
use ap;

select invoice_id, line_item_description, account_description, line_item_amount
from invoices
join invoice_line_items using(invoice_id)
join general_ledger_accounts using(account_number)
where line_item_amount > 700 and line_item_amount < 1200
order by line_item_description;