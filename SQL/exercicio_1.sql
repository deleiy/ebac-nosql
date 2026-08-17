-- Exercício 1

-- 1. Lista de filmes e suas categorias correspondentes

SELECT
    t.Name AS Filme,
    g.Name AS Categoria
FROM tracks t
INNER JOIN genres g
    ON t.GenreId = g.GenreId;


-- 2. Lista de atores com a quantidade de filmes em que participaram

SELECT
    ar.Name AS Ator,
    COUNT(al.AlbumId) AS Quantidade_Filmes
FROM artists ar
INNER JOIN albums al
    ON ar.ArtistId = al.ArtistId
GROUP BY ar.ArtistId, ar.Name
ORDER BY Quantidade_Filmes DESC;


-- 3. Atores que participaram de filmes com duração maior que 120 minutos

SELECT
    ar.Name AS Ator,
    COUNT(t.TrackId) AS Quantidade_Filmes
FROM artists ar
INNER JOIN albums al
    ON ar.ArtistId = al.ArtistId
INNER JOIN tracks t
    ON al.AlbumId = t.AlbumId
WHERE t.Milliseconds > 7200000
GROUP BY ar.ArtistId, ar.Name
ORDER BY Quantidade_Filmes DESC;