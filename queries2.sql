-- INNER JOIN - Kesişim

-- select * from orders inner join customers on orders.customer_id = customers.id
-- select orders.id, customers.first_name, orders.order_date from orders inner join customers on orders.customer_id = customers.id
-- select o.id, c.first_name, o.order_date from orders o inner join customers c on o.customer_id = c.id
-- select o.id order_id , concat(c.first_name, c.last_name) customername, o.order_date from orders o inner join customers c on o.customer_id = c.id
-- select o.id order_id , concat(c.first_name, c.last_name) customername, o.order_date from orders o inner join customers c on o.customer_id = c.id where c.city = 'New York'

-- INNER JOIN - İkiden Fazla Tablo Birleşimi

-- select o.id order_id, od.product_id , p.product_name, (od.unit_price * od.quantity) total,concat(c.first_name, c.last_name) customername,  o.order_date from orders o 
-- inner join customers c on o.customer_id = c.id 
-- inner join order_details od on od.order_id = o.id
-- inner join products p on p.id = od.product_id 
-- order by customername 

-- select o.id order_id, sum(od.unit_price * od.quantity) total,concat(c.first_name, c.last_name) customername,  o.order_date from orders o 
-- inner join customers c on o.customer_id = c.id 
-- inner join order_details od on od.order_id = o.id
-- inner join products p on p.id = od.product_id 
-- group by o.id


-- LEFT JOIN - Örneğin müşteri var ama siparişi yok. 

-- bu sorgu kaydı olan ama siparişi olmayan müşterileri getirir (null)
select c.first_name,o.id as orderid from customers c
left join orders o
on o.customer_id = c.id
where o.id is null
order by c.first_name

-- bu sorgu henüz hiç satılmamış ürünleri getirir
select p.id, p.product_name, od.id from products p left join order_details od
on p.id = od.product_id
where od.id is null

-- RIGHT JOIN 

-- bu sorgu sipariş almamış bir çalışanı gösterir
select o.id, e.first_name from orders o right join employees e 
on e.id = o.employee_id 
where o.id is null
order by o.id

-- DERS: 37 - Seçilen Kayıtların Tabloya Eklenmesi

insert into employee_performance(employee_id, fullname, email, satis_adeti)
select e.id, concat(e.first_name,' ', e.last_name) as fullname , e.email_address, count(o.id) as adet
from employees e left join orders o 
on e.id = o.employee_id
group by e.id

-- DERS: 38 - Join ile Update

update employees e inner join employee_performance ep
on e.id = ep.employee_id
set e.email_address = ep.email
where ep.email like '%updated%'

-- DERS: 39 - Join ile Delete 
-- Siparişi olmayan müşterileri sil

select c.id, c.first_name, o.customer_id from customers c
left join orders o 
on c.id = o.customer_id
where o.customer_id is null

-- 13 id'ye sahip olan kullanıcıyı silme sorgusu
delete customers
from customers left join orders 
on orders.customer_id = customers.id
where orders.customer_id is null and customers.id = 13

-- DERS: 40 - Union Kullanımı

select email from employee_performance
union all
select email_address from employees

select city, country_region from employees
union 
select city, country_region  from customers

-- DERS: 41 - SUBQUERY

select id, order_date from orders
where status_id = (select id from orders_status where status_name = 'Closed')

select c.id, c.first_name, c.last_name, 
(select count(o.id) from orders o where o.customer_id = c.id) as ordercount
from customers c

select id, product_name from products
where id in (1,2,3)

select id, product_name from products
where id in (select product_id from order_details where quantity > 100)

-- DERS: 42 - EXISTS

-- ödeme yöntemi kredi kartı olan müşterileri getirir
select c.id, c.first_name from customers c
where EXISTS
(select o.id from orders o where c.id = o.customer_id and o.payment_type = 'Credit Card')

-- ikiden fazla sipariş veren müşterileri getirir
select id, first_name, last_name from customers c
where EXISTS 
(select count(*) from orders o 
where c.id = o.customer_id
group by o.customer_id
having count(*)>2)

-- DERS: 43 - ANY & ALL Operatörü

select id, product_name, list_price from products
where id in (2,3,5,10)

-- where id = any (2,3,5,10)
-- (id=2) or (id=3) or (id=5) or (id=10)

select id, product_name, list_price from products
where id = any (select product_id from order_details where quantity > 10)

-- (id=2) or (id=3) or (id=5) or (id=10) -> any

select id, product_name, list_price from products
where id > all (select product_id from order_details where quantity > 10)

-- (id=2) and (id=3) and (id=5) and (id=10) -> all

-- select avg(salary) from customers2

-- ortalamanın üstünde maaş alanları gösterir
select * from customers2 
where salary > any (select avg(salary) from customers2)

-- (select age from customers2 where salary > 5000)  bu kosulun verdiği cıktıdan herhangi bir tanesini sağladığı durumlarda alınır. hepsini sağlamasına gerek yok (or)
select * from customers2
where age > any (select age from customers2 where salary > 5000) 

-- (select age from customers2 where salary > 5000)  bu kosulun verdiği cıktıdan hepsini kapsamak durumundadır. bir tanesini sağlaması kabul edilmez (and)
select * from customers2
where age > all (select age from customers2 where salary > 5000) 

