    create table clients (
        ID bigint not null auto_increment,
        NOM varchar(30) not null,
        PRENOM varchar(30) not null,
        ID_COMPTE bigint not null,
        primary key (ID)

    ) ENGINE=InnoDB;

    create table comptes (
        ID bigint not null auto_increment,
        numero bigint,
        Solde FLOAT ,
        MONTANT FLOAT ,
        ID_CLIENT bigint,
        primary key (ID) ,
        foreign key (ID_CLIENT) references clients (ID)

    ) ENGINE=InnoDB;

    


    create table transferts(
        ID bigint not null auto_increment,
        MONTANT FLOAT ,
        ID_EMETTEUR bigint not null,
        ID_RECEPTEUR bigint not null,
        DATE DATE,
        primary key (ID) ,
        foreign key (ID_EMETTEUR) references clients (ID),
        foreign key (ID_RECEPTEUR) references clients (ID)


    ) ENGINE=InnoDB;
 create table Employees (
        ID bigint not null auto_increment,
        NOM varchar(30) not null,
        DATE_RECRUTEMENT Date ,
        CIN integer ,
        primary key (ID) 
     
    ) ENGINE=InnoDB;


    create table comptes (
        ID bigint not null auto_increment,
        numero varchar(30) not null,
        SOLDE FLOAT ,
        MONTANT FLOAT ,
      
        primary key (ID)
    ) ENGINE=InnoDB;

 


INSERT INTO clients VALUES (1, 'mohamd1', 'mohamd');

INSERT INTO clients VALUES (1, 'mohamd2', 'mohamd2');

INSERT INTO clients VALUES (1, 'mohamd3', 'mohamd3');

COMMIT WORK;


INSERT INTO employees VALUES (1, 'mohamd1', 11447744 ,'2016-12-2');

INSERT INTO  employees VALUES (1, 'mohamd2', 11556688 ,'2016-12-3');

INSERT INTO employees VALUES (1, 'mohamd3', 11223366 , '2016-12-4');


COMMIT WORK;



