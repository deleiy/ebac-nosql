-- 1. Quantidade de artistas que possuem músicas com duração maior que 120000 ms

SELECT COUNT(*) AS Total_Artistas
FROM (
    SELECT
        ar.Name AS Artista,
        COUNT(t.TrackId) AS Musicas_Mais_120000ms
    FROM artists ar
    INNER JOIN albums al
        ON ar.ArtistId = al.ArtistId
    INNER JOIN tracks t
        ON al.AlbumId = t.AlbumId
    WHERE t.Milliseconds > 120000
    GROUP BY ar.ArtistId, ar.Name
);