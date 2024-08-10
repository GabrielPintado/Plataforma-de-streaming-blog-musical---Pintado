-- Funcion DuracionAlbum:
-- Descripción: Esta función calcula la duración total de un álbum en base al album_id proporcionado iterando sobre las canciones pertenecientes 
-- al álbum especificado, sumando sus duraciones para obtener el total y devolviendo la duración total del álbum en minutos.

DELIMITER //
CREATE FUNCTION DuracionAlbum(album_id INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_duracion INT;
    SELECT SUM(Duracion) INTO total_duracion FROM Canciones WHERE AlbumID = album_id;
    RETURN total_duracion;
END //
DELIMITER ;

-- ListaCancionesArtista:
-- Esta función calcula y retorna la duración total de todas las canciones pertenecientes a un álbum específico sumando la duración de todas
-- las canciones del álbum identificado por album_id.

DELIMITER //
CREATE FUNCTION ListaCancionesArtista(artista_id INT) RETURNS TEXT
READS SQL DATA
BEGIN
    DECLARE lista_canciones TEXT;
    SELECT GROUP_CONCAT(Titulo SEPARATOR ', ') INTO lista_canciones FROM Canciones WHERE ArtistaID = artista_id;
    RETURN lista_canciones;
END //
DELIMITER ;
