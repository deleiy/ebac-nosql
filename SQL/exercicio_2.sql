-- 2. Quantidade de filmes cadastrados

SELECT COUNT(*) AS Total_Filmes
FROM (
    SELECT
        t.Name,
        g.Name
    FROM tracks t
    INNER JOIN genres g
        ON t.GenreId = g.GenreId
);