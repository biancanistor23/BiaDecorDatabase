Create database BiaDecor
go
use BiaDecor
go

CREATE TABLE Magazine
(
MagazineID INT PRIMARY KEY IDENTITY,
Nume varchar(50),
Oras varchar(50) Not Null
)

CREATE TABLE TipuriPerdele
(
TipuriPerdeleID INT PRIMARY KEY IDENTITY,
Tip varchar(50) DEFAULT 'Voal',
Culoare varchar(50) DEFAULT 'Alb'
)
CREATE TABLE Perdele
(
PerdeleID INT PRIMARY KEY IDENTITY,
Nume varchar(50),
Cantitate int,
Pret int,
Pid INT FOREIGN KEY REFERENCES TipuriPerdele(TipuriPerdeleID)
)
CREATE TABLE MagazinPerdele
(
PerdeleID INT FOREIGN KEY REFERENCES Perdele(PerdeleID),
MagazineID INT FOREIGN KEY REFERENCES Magazine(MagazineID),
CONSTRAINT pk_Perdele PRIMARY KEY (PerdeleID,MagazineID)
)

CREATE TABLE TipuriDraperii
(
TipuriDraperiiID INT PRIMARY KEY IDENTITY,
Tip varchar(50) DEFAULT 'Blackout',
Culoare varchar(50) DEFAULT 'Crem'
)
CREATE TABLE Draperii
(
DraperiiID INT PRIMARY KEY IDENTITY,
Nume varchar(50),
Cantitate int,
Pret int,
Did INT FOREIGN KEY REFERENCES TipuriDraperii(TipuriDraperiiID)
)
CREATE TABLE MagazinDraperii
(
DraperiiID INT FOREIGN KEY REFERENCES Draperii(DraperiiID),
MagazineID INT FOREIGN KEY REFERENCES Magazine(MagazineID),
CONSTRAINT pk_Draperii PRIMARY KEY (DraperiiID,MagazineID)
)

CREATE TABLE Managers
(
ManagersID INT FOREIGN KEY REFERENCES Magazine(MagazineID),
Nume varchar(50) NOT NULL,
Experienta INT,
CONSTRAINT pk_ShopsManagers PRIMARY KEY(ManagersID)
)

CREATE TABLE Clienti
(
  ClientiID INT PRIMARY KEY IDENTITY,
  Nume VARCHAR(50) NOT NULL,
  Prenume VARCHAR(50) NOT NULL,
  Tel VARCHAR(15),
  MagazineID INT FOREIGN KEY REFERENCES Magazine(MagazineID)
);

CREATE TABLE Comenzi
(
  ComenziID INT PRIMARY KEY IDENTITY,
  ClientiID INT FOREIGN KEY REFERENCES Clienti(ClientiID),
  DataComanda DATE,
  Valoare INT,
  StatusComanda VARCHAR(20) DEFAULT 'In asteptare',
  Adresa VARCHAR(255)
);
