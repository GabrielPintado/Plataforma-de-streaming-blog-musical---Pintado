-- Disparador que actualiza el contador de comentarios en la tabla Albumes después de insertar un comentario nuevo.

DELIMITER $$
CREATE TRIGGER AfterInsertComentario
AFTER INSERT ON Comentarios
FOR EACH ROW
BEGIN
    DECLARE album_id INT;
    DECLARE total_comentarios INT;

    SET album_id = NEW.AlbumID;

    SELECT COUNT(*) INTO total_comentarios FROM Comentarios WHERE AlbumID = album_id;

    UPDATE Albumes SET NroComentarios = total_comentarios WHERE ID = album_id;
END$$
DELIMITER ;


-- Disparador que evita la eliminación de un artista si tiene álbumes asociados.

DELIMITER $$
CREATE TRIGGER BeforeDeleteArtista
BEFORE DELETE ON Artistas
FOR EACH ROW
BEGIN
    DECLARE total_albumes INT;

    SELECT COUNT(*) INTO total_albumes FROM Albumes WHERE ArtistaID = OLD.ID;

    IF total_albumes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el artista porque tiene álbumes asociados.';
    END IF;
END$$
DELIMITER ;