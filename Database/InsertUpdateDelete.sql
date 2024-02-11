Use BiaDecor
go
-- Insert data into Magazine table
INSERT INTO Magazine (Nume, Oras) VALUES ('BiaDecor', 'Oradea');
INSERT INTO Magazine (Nume, Oras) VALUES ('BiaDecor', 'Beius');
INSERT INTO Magazine (Nume, Oras) VALUES ('AleBiaLux', 'Bucuresti');
-- Insert data into TipuriPerdele table
INSERT INTO TipuriPerdele (Tip, Culoare) VALUES ('Matase', 'Crem');
INSERT INTO TipuriPerdele (Tip, Culoare) VALUES ('Bumbac', 'Alb');
INSERT INTO TipuriPerdele (Tip, Culoare) VALUES ('Poliester', 'Violet');
INSERT INTO TipuriPerdele (Tip, Culoare) VALUES ('Dantela', 'Mix');
-- Insert data into TipuriDraperii table
INSERT INTO TipuriDraperii(Tip, Culoare) VALUES ('Catifea', 'Bordo');
INSERT INTO TipuriDraperii (Tip, Culoare) VALUES ('Poliester', 'Albastru Royal');
INSERT INTO TipuriDraperii (Tip, Culoare) VALUES ('Brocart', 'Maroon');
INSERT INTO TipuriDraperii (Tip, Culoare) VALUES ('Bumbac', 'Galben Mustar');
-- Insert data into Perdele table
INSERT INTO Perdele (Nume, Cantitate, Pret, Pid) VALUES ('Lzso', 10, 100,1);
INSERT INTO Perdele (Nume, Cantitate, Pret, Pid) VALUES ('Kadda', 5, 120,2);
INSERT INTO Perdele (Nume, Cantitate, Pret, Pid) VALUES ('Kadda', 12, 84,3);
INSERT INTO Perdele (Nume, Cantitate, Pret, Pid) VALUES ('Monna', 15, 123,4);
INSERT INTO Perdele (Nume, Cantitate, Pret, Pid) VALUES ('Atria', 23, 235,2);
INSERT INTO Perdele (Nume, Cantitate, Pret, Pid) VALUES ('Zorlu', 9, 263,2);
-- Insert data into Draperii table
INSERT INTO Draperii(Nume, Cantitate, Pret, Did) VALUES ('Portofino', 13, 100,1);
INSERT INTO Draperii (Nume, Cantitate, Pret, Did) VALUES ('Rivera', 6, 120,2);
INSERT INTO Draperii (Nume, Cantitate, Pret, Did) VALUES ('Florence', 14, 154,3);
INSERT INTO Draperii (Nume, Cantitate, Pret, Did) VALUES ('Vallarta', 8, 123,4);
INSERT INTO Draperii (Nume, Cantitate, Pret, Did) VALUES ('Amelie', 25, 235,2);
INSERT INTO Draperii (Nume, Cantitate, Pret, Did) VALUES ('Amelie', 23, 263,3);

INSERT INTO Managers (ManagersID, Nume, Experienta) VALUES (1, 'Nistor Dana', 7);
INSERT INTO Managers (ManagersID, Nume, Experienta) VALUES (2, 'Iova Violeta', 5);
INSERT INTO Managers (ManagersID, Nume, Experienta) VALUES (3, 'Ion Popescu :) ', 3);

INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (1, 1);
INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (2, 2); 
INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (3, 3); 
INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (4, 1);
INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (5, 2); 
INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (6, 3); 

INSERT INTO MagazinDraperii(DraperiiID, MagazineID) VALUES (1, 1); 
INSERT INTO MagazinDraperii (DraperiiID, MagazineID) VALUES (2, 2);
INSERT INTO MagazinDraperii (DraperiiID, MagazineID) VALUES (3, 3);
INSERT INTO MagazinDraperii(DraperiiID, MagazineID) VALUES (4, 1); 
INSERT INTO MagazinDraperii (DraperiiID, MagazineID) VALUES (5, 2);
INSERT INTO MagazinDraperii (DraperiiID, MagazineID) VALUES (6, 3);

-- Insert data into MagazinPerdele table (violating referential integrity)
INSERT INTO MagazinPerdele (PerdeleID, MagazineID) VALUES (1, 10); -- Assuming MagazineID 10 does not exist


Select *From Managers
Select *From MagazinPerdele
Select *From MagazinDraperii
SELECT *FROM Magazine;
SELECT *FROM TipuriPerdele;
SELECT *FROM Perdele;


-- Update data in Magazine table using AND, IS NOT NULL
UPDATE Magazine SET Oras = 'Cluj-Napoca' WHERE MagazineID = 2 AND Oras IS NOT NULL;
-- Update data in TipuriPerdele table using OR, IN
UPDATE TipuriPerdele SET Culoare = 'Turcoaz' WHERE TipuriPerdeleID = 1 OR Tip IN ('Lzso', 'Monna');
-- Update data in Perdele table using >, LIKE
UPDATE Perdele SET Cantitate = Cantitate + 1 WHERE PerdeleID < 4 OR Nume LIKE '%Zorlu%';

SELECT *FROM Magazine;
SELECT *FROM TipuriPerdele;
SELECT *FROM Perdele;

-- Delete data from Magazine table using AND, IS NULL
DELETE FROM Magazine WHERE MagazineID = 1 AND Oras IS NULL;
-- Delete data from TipuriPerdele table using OR, IN
DELETE FROM TipuriPerdele WHERE TipuriPerdeleID = 1 OR Tip IN ('Lzso', 'Monna');
-- Delete data from Perdele table using NOT, BETWEEN
DELETE FROM Perdele WHERE Cantitate NOT BETWEEN 10 AND 20;
-- Delete data from Draperii table using >, LIKE
DELETE FROM Draperii WHERE Pret > 200 AND Nume LIKE '%Amel%';


SELECT *FROM Magazine;
SELECT *FROM TipuriPerdele;
SELECT *FROM Perdele;