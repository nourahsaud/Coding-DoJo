use ecommcrce;
show tables ;

 INSERT INTO categories (id,name) 
VALUES 	(432,'khalid'),(111,'mohammed');





INSERT INTO customers (id,email,pasword,full_name,billing_address,default_shipping_address,country,phone) 
VALUES
(200,'mona211@gmail.com','CD3210099','mona naser','jeddah','jeddah_111','SA',0566772111) 	
,(250,'kaleedr@gmail.com','ASEW12311','mona sami','makkah','makkah_213','SA',0566449810);

INSERT INTO order_detalis(id,price,quantity,products_id,orders_id)
VALUES (123,400.0,4,12345,222),
       (124,460.0,3,12344,333);


INSERT INTO orders(id,ammount,shipping_address,order_address,order_email,order_date,order_status,customers_id)
VALUES (222,33,'jeddah_safa','alhamdanyah','memo@gmail.com','1992-03-21','start',250),
(333,9,'jeddah_sammer','alhamdanyah','nor@gmail.com','1992-03-27','start',250);

INSERT INTO product_categories(id,categories_id)
VALUES(1234,111),
      (1233,432);

INSERT INTO products(id,name,price,weight,category,create_date,stock,product_categories_id)
VALUES(12345,'maha',43.4,45.3,'apple','1992-03-3','44',1234),
      (12344,'mram',43.4,45.3,'orang','1992-03-31','6',1233);


select * from 
categories;