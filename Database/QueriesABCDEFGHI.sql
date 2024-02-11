use BiaDecor
go

--a. 2 queries with the union operation; use UNION [ALL] and OR;
--combines the unique values from nume perdele and tip into a single result set 
SELECT DISTINCT Nume FROM Perdele
UNION 
SELECT Tip FROM TipuriPerdele;

--combines the unique values from nume perdele where the price is > 200 and nume draperii
--where th quantity is >15  or price<100 into a single result set 
SELECT DISTINCT Nume FROM Perdele WHERE Pret > 200
UNION
SELECT DISTINCT Nume FROM Draperii WHERE Cantitate >15 OR Pret < 100;

Select * From Draperii
Select * From Perdele
--b. 2 queries with the intersection operation; use INTERSECT and IN;--
--combines the prices form perdele and draperii where they have the same price 
SELECT Pret FROM Perdele 
INTERSECT
SELECT Pret FROM Draperii 

--Outputs the name price and quantity of perdele if price >=50 and name is Kadda or atria and it orders it by quantity
SELECT Nume,Pret,Cantitate FROM Perdele WHERE Pret >= 50
AND Nume IN ('Kadda','Atria') ORDER BY Cantitate

--c. 2 queries with the difference operation; use EXCEPT and NOT IN;--
--Outputs the color of perdele that are not color of draperii also
SELECT Culoare FROM TipuriPerdele
EXCEPT
SELECT Culoare FROM TipuriDraperii;

--Outputs the draperii name if the name is not amelie
SELECT Nume FROM Draperii WHERE Nume NOT IN ('Amelie');

--d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN (one query per operator); 

--Query using INNER JOIN:
--combines all the stores,cities,name of perdele and name of draperii
SELECT Magazine.Nume,Magazine.Oras, Perdele.Nume, Draperii.Nume
FROM Magazine
INNER JOIN Perdele ON Magazine.MagazineID = Perdele.Pid
INNER JOIN Draperii ON Magazine.MagazineID = Draperii.Did;

--Query using LEFT JOIN with Two Many-to-Many Relationships:
SELECT Magazine.Nume, Perdele.Nume, Draperii.Nume
FROM Magazine
LEFT JOIN MagazinPerdele ON Magazine.MagazineID = MagazinPerdele.MagazineID
LEFT JOIN Perdele ON MagazinPerdele.PerdeleID= Perdele.Pid
LEFT JOIN MagazinDraperii ON Magazine.MagazineID = MagazinDraperii.MagazineID
LEFT JOIN Draperii ON MagazinDraperii.DraperiiID = Draperii.Did;

--Query using RIGHT JOIN:
SELECT Magazine.Nume, Perdele.Nume, TipuriPerdele.Tip
FROM Magazine
RIGHT JOIN Perdele ON Magazine.MagazineID = Perdele.Pid
RIGHT JOIN TipuriPerdele ON Perdele.Pid = TipuriPerdele.TipuriPerdeleID;

--Query using FULL JOIN:
SELECT Perdele.Nume, Draperii.Nume, MagazinPerdele.MagazineID, MagazinDraperii.MagazineID
FROM Perdele
FULL JOIN Draperii ON Perdele.Pid = Draperii.Did
FULL JOIN MagazinPerdele ON Perdele.PerdeleID = MagazinPerdele.PerdeleID
FULL JOIN MagazinDraperii ON Draperii.DraperiiID = MagazinDraperii.DraperiiID;

--e. 2 queries with the IN operator and a subquery in the WHERE clause; 
--in at least one case, the subquery must include a subquery in its own WHERE clause;
--Query with Subquery and IN Operator:

--Find all magazines that have  'Maroon' or 'Albastru Royal' draperii
SELECT M.Nume AS MagazineName
FROM Magazine M
WHERE M.MagazineID IN (
    SELECT MD.MagazineID
    FROM MagazinDraperii MD
    JOIN Draperii D ON MD.DraperiiID = D.DraperiiID
    JOIN TipuriDraperii TD ON D.Did = TD.TipuriDraperiiID
    WHERE TD.Culoare IN ('Maroon', 'Albastru Royal')
);

--Query with Subquery Including Another Subquery:
--Find all magazines that have  draperies with colors that match at least one of the perdele types:
SELECT M.Nume AS MagazineName
FROM Magazine M
WHERE M.MagazineID IN (
    SELECT MD.MagazineID
    FROM MagazinDraperii MD
    JOIN Draperii D ON MD.DraperiiID = D.DraperiiID
    JOIN TipuriDraperii TD ON D.Did = TD.TipuriDraperiiID
    WHERE TD.Culoare IN (
        SELECT DISTINCT Culoare
        FROM TipuriPerdele
    )
);

--f. 2 queries with the EXISTS operator and a subquery in the WHERE clause;
--Query with EXISTS and Subquery:
--find stores that have perdele quantity more than 10
SELECT Nume,Oras
FROM Magazine AS M
WHERE EXISTS (
    SELECT *
    FROM Perdele AS P
    WHERE P.PerdeleID = M.MagazineID
    AND P.Cantitate > 10
);
Select * from MagazinPerdele
Select PerdeleID,Cantitate From Perdele
-- (Managers with More Than 5 Years of Experience):
SELECT Nume,Oras 
FROM Magazine AS M
WHERE EXISTS (
    SELECT *
    FROM Managers AS MG
    WHERE MG.ManagersID = M.MagazineID
    AND MG.Experienta > 5
);
--g. 2 queries with a subquery in the FROM clause:
--List all magazines that have draperies with a specific color 
SELECT DISTINCT M.Nume AS MagazineName
FROM Magazine M
INNER JOIN MagazinDraperii MD ON M.MagazineID = MD.MagazineID
INNER JOIN Draperii D ON MD.DraperiiID = D.DraperiiID
INNER JOIN TipuriDraperii TD ON D.Did = TD.TipuriDraperiiID
WHERE TD.Culoare = 'Maroon';


--List all magazines that have perdele with a specific color 
SELECT DISTINCT M.Nume AS MagazineName
FROM Magazine M
INNER JOIN MagazinPerdele MP ON M.MagazineID = MP.MagazineID
INNER JOIN Perdele P ON MP.PerdeleID = P.PerdeleID
INNER JOIN TipuriPerdele TP ON P.Pid = TP.TipuriPerdeleID
WHERE TP.Culoare = 'Turcoaz';

--h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 
--2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: 
--COUNT, SUM, AVG, MIN, MAX;

--Find the number of products for each type of Perdele:
SELECT TP.Tip AS PerdeleType, COUNT(*) AS ProductCount
FROM TipuriPerdele TP
LEFT JOIN Perdele P ON TP.TipuriPerdeleID = P.Pid
GROUP BY TP.Tip
ORDER BY TP.Tip;

--Find the types of Draperii where the average price is higher than 150.
SELECT TD.Tip AS DraperieType, AVG(D.Pret) AS AvgPrice
FROM TipuriDraperii AS TD
LEFT JOIN Draperii AS D ON TD.TipuriDraperiiID = D.Did
GROUP BY TD.Tip
HAVING AVG(D.Pret) > 150;

--Find the types of Draperii (TipuriDraperii) with the highest total quantity in stock.
SELECT TD.Tip AS DraperieType, SUM(D.Cantitate) AS TotalQuantity
FROM TipuriDraperii AS TD
LEFT JOIN Draperii AS D ON TD.TipuriDraperiiID = D.Did
GROUP BY TD.Tip
HAVING SUM(D.Cantitate) = 
(SELECT MAX(TotalQuantity) FROM 
(SELECT TD.Tip, SUM(D.Cantitate) AS TotalQuantity FROM TipuriDraperii AS TD 
LEFT JOIN Draperii AS D ON TD.TipuriDraperiiID = D.Did GROUP BY TD.Tip) AS Subquery);

--Find the types of Draperii (TipuriDraperii) with the lowest total quantity in stock.
SELECT TD.Tip AS DraperieType, SUM(D.Cantitate) AS TotalQuantity
FROM TipuriDraperii AS TD
LEFT JOIN Draperii AS D ON TD.TipuriDraperiiID = D.Did
GROUP BY TD.Tip
HAVING SUM(D.Cantitate) = 
(SELECT MIN(TotalQuantity) FROM 
(SELECT TD.Tip, SUM(D.Cantitate) AS TotalQuantity FROM TipuriDraperii AS TD 
LEFT JOIN Draperii AS D ON TD.TipuriDraperiiID = D.Did GROUP BY TD.Tip) AS Subquery);

--i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator);

--Find magazines where the total quantity of Perdele in stock is greater than the min quantity of Perdele in all magazines.
SELECT Nume,Oras
FROM Magazine AS M
WHERE (SELECT SUM(P.Cantitate) FROM Perdele AS P WHERE P.Pid = M.MagazineID) >
(SELECT MIN(TotalQuantity) FROM (SELECT Pid, SUM(Cantitate) AS TotalQuantity FROM Perdele GROUP BY Pid) AS Subquery);

--Find magazines where the total quantity of Draperii in stock is greater than or equal to the maximum quantity of Draperii in any magazine.
SELECT Nume,Oras
FROM Magazine AS M
WHERE (SELECT SUM(D.Cantitate) FROM Draperii AS D WHERE D.Did = M.MagazineID) >= ALL 
(SELECT MAX(TotalQuantity) FROM (SELECT Did, SUM(Cantitate) AS TotalQuantity FROM Draperii GROUP BY Did) AS Subquery);

--Find magazines that have at least one manager with 3 years of experience.
SELECT Nume,Oras
FROM Magazine
WHERE MagazineID IN (SELECT ManagersID FROM Managers WHERE Experienta = 3);
--<=>
SELECT Nume,Oras
FROM Magazine
WHERE MagazineID=ANY(SELECT ManagersID FROM Managers WHERE Experienta = 3);

--Find magazines that don't have any manager with less than 5 years of experience.
SELECT Nume,Oras
FROM Magazine
WHERE MagazineID NOT IN (SELECT ManagersID FROM Managers WHERE Experienta < 5);
--<=>
SELECT Nume,Oras
FROM Magazine
WHERE MagazineID<>ALL (SELECT ManagersID FROM Managers WHERE Experienta < 5);