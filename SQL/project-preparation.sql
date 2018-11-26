-- Use a tabela Invoice (Fatura) para determinar quais países possuem mais faturas. 
-- Forneça as tabelas de BillingCountry (país de cobrança) e Invoices (faturas) ordenadas pelo número de faturas para cada país. 
-- O país com mais faturas deve aparecer primeiro.

SELECT BillingCountry, Count(*) as Invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY 2 DESC

-- Gostaríamos de lançar um festival de música promocional na cidade que nos gerou mais dinheiro. 
-- Escreva uma consulta que retorna a cidade que possui a maior soma dos totais de fatura. 
-- Retorne tanto o nome da cidade quanto a soma de todos os totais de fatura.

SELECT BillingCity, SUM(Total) as Total
FROM INVOICE
GROUP BY BillingCity
ORDER BY 2 DESC
LIMIT 1


-- O cliente que gastou mais dinheiro será declarado o melhor cliente. 
-- Crie uma consulta que retorna a pessoa que mais gastou dinheiro. 
-- Eu encontrei essa informação ao linkar três tabelas: Invoice (fatura), InvoiceLine (linha de faturamento), e Customer (cliente). 
-- Você provavelmente consegue achar a solução com menos tabelas!

SELECT c.CustomerId, SUM(i.total) as Total
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY 2 DESC
LIMIT 1

-- Use sua consulta para retornar o e-mail, nome, sobrenome e gênero de todos os ouvintes de Rock. 
-- Retorne sua lista ordenada alfabeticamente por endereço de e-mail, começando por A. 
-- Você consegue encontrar um jeito de lidar com e-mails duplicados para que ninguém receba vários e-mails?

SELECT Email, FirstName, LastName, g.Name AS GenreName
FROM Customer c
JOIN Invoice i
ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
JOIN Track t
on t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE g.Name = 'Rock'
GROUP BY 1
ORDER BY 1 

--Escreva uma consulta que retorna o nome do Artist (artista) e a contagem total de músicas das dez melhores bandas de rock.
SELECT a.Name, Count(*) AS Songs
FROM Artist a
JOIN Album al
ON a.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE g.Name = 'Rock'
GROUP BY a.Name
ORDER BY 2 desc
LIMIT 10


--Primeiro, descubra qual artista ganhou mais de acordo com InvoiceLines (linhas de faturamento).

SELECT  a.ArtistId,  SUM(il.Quantity * il.UnitPrice) AS Total
FROM Artist a
JOIN Album al
ON a.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
GROUP BY  a.ArtistId
ORDER BY 2 desc
LIMIT 1

-- A consulta acima retornou ID = 90
--Agora encontre qual cliente gastou mais com o artista que você encontrou acima.

SELECT c.CustomerId, SUM(il.Quantity * il.UnitPrice) as Total
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Album al
ON al.AlbumId = t.AlbumId
WHERE al.ArtistId = 90
GROUP BY c.CustomerId
ORDER BY 2 DESC
LIMIT 1


-- Queremos descobrir o gênero musical mais popular em cada país. 
-- Determinamos o gênero mais popular como o gênero com o maior número de compras. 
-- Escreva uma consulta que retorna cada país juntamente a seu gênero mais vendido. 
-- Para países onde o número máximo de compras é compartilhado retorne todos os gêneros.
WITH popular_genre AS (
	SELECT BillingCountry,  MAX(Quantity) AS MaxQtd
	FROM (
		SELECT BillingCountry, Count(*) As Quantity
		FROM Invoice i
		JOIN InvoiceLine il
		ON il.InvoiceId = i.InvoiceId
		JOIN Track t
		ON t.TrackId = il.TrackId
		JOIN Genre g
		ON g.GenreId = t.GenreId
		GROUP BY BillingCountry, g.Name)
	GROUP BY BillingCountry)
	
	
SELECT i.BillingCountry, g.Name, Count(*) AS Quantity
FROM Invoice i
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN popular_genre pg
ON pg.BillingCountry = i.BillingCountry
GROUP BY i.BillingCountry, g.Name
HAVING Count(*) = pg.MaxQtd



-- Retorne todos os nomes de músicas que possuem um comprimento de canção maior que o comprimento médio de canção. 
SELECT Name
FROM Track
WHERE Milliseconds > (
	SELECT AVG(Milliseconds)
	FROM Track ) 

-- Escreva uma consulta que determina qual cliente gastou mais em músicas por país. 
-- Escreva uma consulta que retorna o país junto ao principal cliente e quanto ele gastou. 
-- Para países que compartilham a quantia total gasta, forneça todos os clientes que gastaram essa quantia.
WITH max_spent AS (
	SELECT BillingCountry, MAX(Total) AS MaxCountry
	FROM (
		SELECT BillingCountry, SUM(Total) AS Total
		FROM Invoice i
		JOIN Customer c
		ON c.CustomerId = i.CustomerId
		GROUP BY BillingCountry, c.CustomerId		
	)
	GROUP BY BillingCountry
)

SELECT c.CustomerId, FirstName, LastName, i.BillingCountry, SUM(Total) AS Total
FROM Customer c
JOIN Invoice i
ON i.CustomerId = c.CustomerId
JOIN max_spent m
ON m.BillingCountry = i.BillingCountry
GROUP BY c.CustomerId, i.BillingCountry
HAVING SUM(Total) = m.MaxCountry
ORDER BY 4 