-- select * from shopapp.products
-- select Name from shopapp.products
-- select Name,Price from shopapp.products
-- select Name as Ürün, Price as Fiyat from shopapp.products
-- select * from shopapp.products where Id=3
-- select * from shopapp.products where Price = 2000 
-- select Name,Price from shopapp.products where Price >= 2000 
-- select Name,Price from shopapp.products where Price >= 2000 And Price <= 4000
-- select * from shopapp.products where Id = 1 Or Id = 2
-- select * from shopapp.products where Name ='samsung s5'
-- select * from shopapp.products where Name !='samsung s5'
-- select * from shopapp.products where NOT Name ='samsung s5'
-- select * from shopapp.products where Name ='samsung s5' and Price = 3000
-- select * from shopapp.products where Name ='samsung s5' and (Price = 3000 or Price=2000)


-- Ders 3: Where - Filtreleme Operatörleri

-- select * from shopapp.products where Price >= 2000 And Price <= 4000
-- select * from shopapp.products where Price Between 2000 and 4000
-- select * from shopapp.products where Id Not Between 1 and 2

-- select * from shopapp.products where Category = 'Telefon'
-- select * from shopapp.products where Category IN ('Telefon','Bilgisayar')
-- select * from shopapp.products where Category NOT IN ('Telefon')
-- select * from shopapp.products where Id NOT IN (1,2)

-- select * from shopapp.products where Name LIKE '%samsung%'
-- select * from shopapp.products where Name LIKE '___o%'
-- select * from shopapp.products where Name NOT LIKE '%iphone%' and Price > 2000

-- select * from shopapp.products where Name LIKE '%samsung%' and Description LIKE '%çift sim kart%'

-- Ders 4: Order - Kayıt Sıralama

-- select * from shopapp.products order by Price 
-- select * from shopapp.products order by Name

-- Artan sekilde sıralama ASC ile, azalan sekilde sıralama DESC ile yapılır
-- select * from shopapp.products order by Name DESC 
-- select * from shopapp.products order by Category DESC, Price ASC

-- Ders 5: SQL Fonksiyonları - Hesaplama
-- min(), max(), count(), avg(), sum()

-- select min(price) 'minimum fiyat' from shopapp.products 
-- select max(price) 'maksimum fiyat' from shopapp.products 

-- select name,price from shopapp.products order by price
-- select name,price from shopapp.products order by price limit 1
-- select name,price from shopapp.products order by price desc limit 1

-- select count(*) from shopapp.products
-- select count(Id) as adet from shopapp.products

-- select avg(Price) as ortalama from shopapp.products 
-- select sum(Price) as toplam from shopapp.products 
-- select sum(Price * Stock) as toplam from shopapp.products 

-- Ders 6: SQL Fonksiyonları - String

-- select length('Sena Yazici') as karaktersayisi
-- select name,length(name) as karakteruzunlugu from shopapp.products
-- select name, concat(left(name,3),'...') as karakteruzunlugu from shopapp.products 
-- select right('Sena Yazici',6) as name
-- select name,right(description,5) as name from shopapp.products
-- select name, lower(name) from shopapp.products
-- select name, upper(name) from shopapp.products
-- select name, lower(replace(name,' ','-')) as name from shopapp.products
-- select concat(trim('      Sena Yazici   '),'***') --sagındaki ve solundaki boslukları siler
-- select name, trim(name) from shopapp.products
-- select name, ltrim(name) from shopapp.products
-- select name, rtrim(name) from shopapp.products

-- Ders 7: Group By - Distinct 
-- distinct tekrarlananları kaldırır

-- select distinct category from shopapp.products 
-- select category from shopapp.products group by category
-- select category, Count(*) as adet from shopapp.products group by category
-- select category, Sum(Price) as toplam from shopapp.products group by category
-- select category, Avg(Price) as ortalama from shopapp.products group by category
-- select category, Avg(Price) as ortalama from shopapp.products where price>3000 group by category
-- select category, Count(*) as adet from shopapp.products group by category having Count(*) > 1

-- Ders 8: Kayıt Ekleme - Insert

-- select * from shopapp.products

-- INSERT INTO shopapp.products (Name, Price, ImageUrl, Category, Description, Stock) VALUES ('samsung s10', 7000, '1.jpg', 'Telefon', 'Çok iyi telefon', 10 )
-- INSERT INTO shopapp.products (Name, Price, Category) VALUES ('samsung s11', 8000, 'Telefon')

-- select count(ImageUrl) adet from shopapp.products

-- Ders 9: Kayıt Güncelleme - Update

-- UPDATE shopapp.products SET Name = 'samsung s7', Price = 3000 WHERE Id = 1

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE shopapp.products SET Price = Price * 1.5 WHERE Category = 'Telefon'

-- UPDATE shopapp.products SET ImageUrl = 'noproduct.jpg' WHERE ImageUrl IS NULL 

-- Ders 10: Kayıt Silme - Delete

-- DELETE FROM shopapp.products WHERE Id = 1 
-- DELETE FROM shopapp.products WHERE price > 2000 and category = 'bilgisayar'
-- DELETE FROM shopapp.products WHERE description IS null













