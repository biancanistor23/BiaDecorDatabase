Create database BiaDecor2
go
use BiaDecor2
go

CREATE TABLE Magazine
(
	MagazineID SMALLINT NOT NULL,
	Nume varchar(50),
	Strada varchar(50) Not Null,
	CONSTRAINT pk_Magazine PRIMARY KEY(MagazineID)
);

INSERT INTO Magazine VALUES (1,'BiaDECOR','str.Ciheiului 11')
INSERT INTO Magazine VALUES (2,'BiaDECOR','str.Feleacului 12')
INSERT INTO Magazine VALUES (3,'BiaDECOR','str.Porumbeilor 2')

Select * From Magazine

CREATE TABLE Accesorii
(
	AccesoriiID SMALLINT NOT NULL,
	Model varchar(50) DEFAULT 'Inele',
	Pret DECIMAL Not Null,
	CONSTRAINT pk_Accesorii PRIMARY KEY(AccesoriiID)
);

INSERT INTO Accesorii(AccesoriiID,Pret) VALUES (1,1)
INSERT INTO Accesorii VALUES (2,'Sina',100)
INSERT INTO Accesorii VALUES (3,'Catarama',25)
INSERT INTO Accesorii VALUES (4,'Butoane',10)
INSERT INTO Accesorii VALUES (5,'Suporti',50)

Select * From Accesorii

CREATE TABLE Draperii
(
	DraperiiID SMALLINT NOT NULL,
	Model varchar(50) DEFAULT 'Karm',
	Pret INT Not Null,
	CONSTRAINT pk_Draperii PRIMARY KEY(DraperiiID)
);

INSERT INTO Draperii(DraperiiID,Pret) VALUES (1,230)
INSERT INTO Draperii VALUES (2,'Lzo',120)
INSERT INTO Draperii VALUES (3,'Katri',130)
INSERT INTO Draperii VALUES (4,'Adda',321)
INSERT INTO Draperii VALUES (5,'Biri',92)

Select * From Draperii

CREATE TABLE Perdele
(
	PerdeleID SMALLINT NOT NULL,
	Model varchar(50) DEFAULT 'Louis',
	Pret INT Not Null,
	CONSTRAINT pk_Perdele PRIMARY KEY(PerdeleID)
);

INSERT INTO Perdele(PerdeleID,Pret) VALUES (1,123)
INSERT INTO Perdele VALUES (2,'Leo',231)
INSERT INTO Perdele VALUES (3,'Astrid',130)
INSERT INTO Perdele VALUES (4,'Sigrid',98)
INSERT INTO Perdele VALUES (5,'Velrous',43)

Select * From Perdele

CREATE TABLE StocPerdele
(
	PerdeaID SMALLINT NOT NULL,
	MagazinID SMALLINT NOT NULL,
	Cantitate INT Not Null,
	CONSTRAINT fk_PerdeaID FOREIGN KEY(PerdeaID) REFERENCES Perdele(PerdeleID) ON DELETE CASCADE,
	CONSTRAINT fk_MagazinPID FOREIGN KEY(MagazinID) REFERENCES Magazine(MagazineID) ON DELETE CASCADE,
	CONSTRAINT pk_StocPerdele PRIMARY KEY (PerdeaID,MagazinID)
);

INSERT INTO StocPerdele VALUES (1,1,75)
INSERT INTO StocPerdele VALUES (2,1,20)
INSERT INTO StocPerdele VALUES (3,2,30)
INSERT INTO StocPerdele VALUES (4,3,120)
INSERT INTO StocPerdele VALUES (5,2,43)

Select * From StocPerdele

CREATE TABLE StocDraperii
(
	DraperiiID SMALLINT NOT NULL,
	MagazinID SMALLINT NOT NULL,
	Cantitate INT Not Null,
	CONSTRAINT fk_DraperiiID FOREIGN KEY(DraperiiID) REFERENCES Draperii(DraperiiID) ON DELETE CASCADE,
	CONSTRAINT fk_MagazinDID FOREIGN KEY(MagazinID) REFERENCES Magazine(MagazineID) ON DELETE CASCADE,
	CONSTRAINT pk_StocDraperii PRIMARY KEY (DraperiiID,MagazinID)
);
INSERT INTO StocDraperii VALUES (1,1,32)
INSERT INTO StocDraperii VALUES (2,1,22)
INSERT INTO StocDraperii VALUES (3,2,12)
INSERT INTO StocDraperii VALUES (4,3,41)
INSERT INTO StocDraperii VALUES (5,2,29)

Select * From StocDraperii

CREATE TABLE StocAccesorii
(
	AccesoriiID SMALLINT NOT NULL,
	MagazinID SMALLINT NOT NULL,
	Cantitate INT Not Null,
	CONSTRAINT fk_AccesoriiID FOREIGN KEY(AccesoriiID) REFERENCES Accesorii(AccesoriiID) ON DELETE CASCADE,
	CONSTRAINT fk_MagazinAID FOREIGN KEY(MagazinID) REFERENCES Magazine(MagazineID) ON DELETE CASCADE,
	CONSTRAINT pk_StocAccesorii PRIMARY KEY (AccesoriiID,MagazinID)
);

INSERT INTO StocAccesorii VALUES (1,1,5)
INSERT INTO StocAccesorii VALUES (2,2,11)
INSERT INTO StocAccesorii VALUES (3,2,13)
INSERT INTO StocAccesorii VALUES (4,3,10)
INSERT INTO StocAccesorii VALUES (5,2,7)

Select* From StocAccesorii

CREATE TABLE Angajati
(
	AngajatID SMALLINT NOT NULL,
	MagazinID SMALLINT NOT NULL,
	Nume varchar(50) NOT NULL,
	Experienta INT,
	CONSTRAINT fk_MagaineAngajati FOREIGN KEY (MagazinID) REFERENCES Magazine(MagazineID),
	CONSTRAINT pk_Angajati PRIMARY KEY(AngajatID)
);

INSERT INTO Angajati VALUES (1,2,'Mezei',1)
INSERT INTO Angajati VALUES (2,1,'Flori',10)
INSERT INTO Angajati VALUES (3,1,'Dana',7)
INSERT INTO Angajati VALUES (4,3,'Vio',3)
INSERT INTO Angajati VALUES (5,2,'Marcel',6)

Select * From Angajati

CREATE TABLE Comenzi
(
  ComenziID SMALLINT NOT NULL, 
  Item VARCHAR(20) Not NUll,
  Valoare INT Not Null,
  PayMethod VARCHAR(20),
  CONSTRAINT pk_Comenzi PRIMARY KEY (ComenziID)
);

INSERT INTO Comenzi VALUES (1,'Perdea Astrid',431,'card')
INSERT INTO Comenzi VALUES (2,'Draperie Adda',532,'card')
INSERT INTO Comenzi(ComenziID,Item,Valoare) VALUES (3,'Perdea Sigrid',1230)
INSERT INTO Comenzi VALUES (4,'Draperie Biri',432,'card')
INSERT INTO Comenzi(ComenziID,Item,Valoare) VALUES (5,'Perdea Lzo',2421)

Select * From Comenzi

CREATE TABLE Clienti
(
  ClientiID SMALLINT NOT NULL ,
  ComenziClientiID SMALLINT NOT NULL,
  ClientiAngajatiID SMALLINT NOT NULL,
  Nume VARCHAR(50) NOT NULL,
  Tel VARCHAR(15),
  CONSTRAINT fk_Clienti_Angajati FOREIGN KEY (ClientiAngajatiID) REFERENCES Angajati(AngajatID),
  CONSTRAINT fk_Clienti_Comenzi FOREIGN KEY (ComenziClientiID) REFERENCES Comenzi(ComenziID),
  CONSTRAINT pk_Clienti PRIMARY KEY(ClientiID)
);

INSERT INTO Clienti VALUES (1,1,1,'Anton Martin','0714245123')
INSERT INTO Clienti VALUES (2,2,2,'Ion Popovici','0741002934')
INSERT INTO Clienti VALUES (3,3,3,'Ana Maria','0770513143')
INSERT INTO Clienti VALUES (4,4,4,'Carina Oros','0770918249')
INSERT INTO Clienti VALUES (5,5,5,'Rares Mile','0724918492')

SELECT
    c.Nume AS ClientName,
    c.Tel AS ClientTel,
    a.Nume AS AngajatName,
    co.Item,
    co.Valoare,
    co.PayMethod
FROM
    Clienti c
LEFT JOIN
    Angajati a ON c.ClientiAngajatiID = a.AngajatID
LEFT JOIN
    Comenzi co ON c.ComenziClientiID = co.ComenziID;



