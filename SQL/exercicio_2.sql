-- Exercício 2

-- 1. Quantidade de filmes e categorias

SELECT COUNT(*) AS Total_Registros
FROM (
    SELECT
        t.Name,
        g.Name
    FROM tracks t
    INNER JOIN genres g
        ON t.GenreId = g.GenreId
);


-- 2. Quantidade de atores encontrados

SELECT COUNT(*) AS Total_Atores
FROM (
    SELECT
        ar.Name,
        COUNT(al.AlbumId)
    FROM artists ar
    INNER JOIN albums al
        ON ar.ArtistId = al.ArtistId
    GROUP BY ar.ArtistId, ar.Name
);


-- 3. Quantidade de atores com filmes acima de 120 minutos

SELECT COUNT(*) AS Total_Atores
FROM (
    SELECT
        ar.Name,
        COUNT(t.TrackId)
    FROM artists ar
    INNER JOIN albums al
        ON ar.ArtistId = al.ArtistId
    INNER JOIN tracks t
        ON al.AlbumId = t.AlbumId
    WHERE t.Milliseconds > 7200000
    GROUP BY ar.ArtistId, ar.Name
);