
CREATE DATABASE vente;



CREATE TABLE client(
        id Int BIGSERIAL,
        first_name     Varchar (255),
        last_name     Varchar (255),
        email     Varchar (200),
        password     Varchar (200),
        phone_number     Varchar (100),
        PRIMARY KEY (id)
);

CREATE TABLE commande(
        id  Int BIGSERIAL,
        commande_date Date,
        id_client  Int,
        id_production Int ,
        how_many_production Int,
        PRIMARY KEY (id)
);


CREATE TABLE production(
        id  Int BIGSERIAL,
        production_name  Varchar (255),
        production_price     Int,
        depot_date     Date,
        is_available boolean,
        production_category Varchar (255),
        buying_date current_date,
        PRIMARY KEY (id)
);

CREATE TABLE payement(
        id Int BIGSERIAL,
        payement_date     Date,
        payement_method     Varchar (100),
        id_commande  Int,
        PRIMARY KEY (id)
);


ALTER TABLE commande ADD CONSTRAINT FK_commande_id_client FOREIGN KEY (id_client) REFERENCES client(id);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_production FOREIGN KEY (id_production) REFERENCES production(id);
ALTER TABLE production ADD CONSTRAINT FK_production_id_production_category FOREIGN KEY (id_production_category) REFERENCES production_category(id);
ALTER TABLE payement ADD CONSTRAINT FK_payement_id_commande FOREIGN KEY (id_commande) REFERENCES commande(id);

SELECT count(*) FROM production;

SELECT min(production.production_price) as le moins cher , max(production.product_price) as le plus cher from production group by production.production_category;

SELECT sum(production.production_price) as somme from client ct inner join commande cmd on ct.id = cmd.id_client join production p on p.id = cmd.id_production group by commande.id;

SELECT count(commande.id) as achats FROM commande inner join production on commande.id_production = production.id group by production.production_name order by  achats desc ;

SELECT sum(production.production_price) as C_A FROM production where EXTRACT(year from production.buying_date) = '2024'; 

-- exercice 2
 
 CREATE INDEX index_first_name on "user"(first_name);
 CREATE VIEW users_detail as select user_id, first_name,age ,email,number_of_posts from "user" u join posts p on u.posts_id = p.posts_id;
 SELECT first_name,age FROM users_detail where age<'20' and number_of_posts >0;
 SELECT first_name,age FROM "user" u join posts p on u.posts_id = p.posts_id where age<'20' and number_of_posts >0;          