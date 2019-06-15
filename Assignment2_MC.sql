-- April 22, 2018, at 10:19:21 AM
/* Answer 1 */
use my_guitar_shop;

drop table if exists categories_copy;
drop table if exists products_copy;

create table categories_copy as select * from categories;

create table products_copy as select * from products;

/* Answer 2 */

insert into addresses(customer_id,line1,line2,city,state,zip_code,phone,disabled) 
values(4,"1205 Monroe ST NE","Apt 16","Washington","DC",20018,"202-636-8888",0);

/* Answer 3 */
insert into orders(customer_id,order_date,ship_amount,tax_amount,ship_date,ship_address_id,card_type,card_number,card_expires,billing_address_id)
values(4,date_format("2018-04-22 10:19:21", '%Y-%m-%d-%T'),10,0,NOW(),13,"Mastercard",7890123456789012,date_format("2021-11-11",'%c/%Y'),5); 

/* Answer 4 */
update orders set tax_amount = 6.60, card_type="American Express" where order_id=11;

/* Answer 5 */
SET SQL_SAFE_UPDATES=0;
update addresses set disabled = 1 where state = "NY";

/* Answer 6 */
delete from addresses where address_id = 13;
delete from orders where ship_address_id = 13;
