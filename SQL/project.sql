-- Quais os 10 artistas mais populares?
SELECT a.Name AS ArtistName, SUM(Quantity) AS Qtd
FROM Track t
JOIN Album al
ON al.AlbumId = t.AlbumId
JOIN Artist a
ON a.ArtistId = al.ArtistId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
GROUP BY a.Name
ORDER BY 2 DESC
LIMIT 10


-- Quais os 10 artistas que mais faturaram?
SELECT a.Name AS ArtistName, SUM(Quantity * il.UnitPrice) AS Qtd
FROM Track t
JOIN Album al
ON al.AlbumId = t.AlbumId
JOIN Artist a
ON a.ArtistId = al.ArtistId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
GROUP BY a.Name
ORDER BY 2 DESC
LIMIT 10

-- Quais 5 países que mais compram músicas de Rock?
SELECT BillingCountry, Count(Quantity) 
FROM Invoice I
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId AND g.Name = 'Rock'
GROUP BY BillingCountry
ORDER BY 2 DESC
LIMIT 5

-- Quais gênero preferido dos 3 melhore Cliente dos USA?
WITH best_clients AS (
SELECT c.CustomerId, SUM (il.Quantity * il.UnitPrice) AS TotalSpent 
FROM Customer c
JOIN Invoice i 
ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
GROUP BY c.CustomerId
ORDER BY TotalSpent desc
LIMIT 3
)

SELECT c.CustomerId, c.FirstName, c.LastName, g.Name, MAX (TotalSpent) AS Total
FROM Customer c
JOIN Invoice i 
ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN best_clients bc
ON bc.CustomerId = c.CustomerId
GROUP BY c.CustomerId



