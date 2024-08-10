-- Procedimiento ObtenerCancionesPorArtista:
-- Este procedimiento devuelve la lista de canciones de un artista específico según el artista_id proporcionado llamando a la función
-- ListaCancionesArtista para obtener la lista de canciones del artista.

DELIMITER $$
CREATE PROCEDURE ObtenerCancionesPorArtista (IN artista_id INT)
BEGIN
    SELECT ListaCancionesArtista(artista_id) AS Lista_Canciones;
END$$
DELIMITER ;

-- Procedimiento InsertarUsuario:
-- Este procedimiento inserta un nuevo usuario en la tabla Usuarios.

DELIMITER $$
CREATE PROCEDURE InsertarUsuario (
    IN nombre VARCHAR(50),
    IN correo_electronico VARCHAR(100),
    IN preferencias_musicales VARCHAR(100),
    IN fecha_registro DATE,
    IN fecha_nacimiento DATE,
    IN pais VARCHAR(50)
)
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, PreferenciasMusicales, FechaRegistro, FechaNacimiento, Pais)
    VALUES (nombre, correo_electronico, preferencias_musicales, fecha_registro, fecha_nacimiento, pais);
END$$
DELIMITER ;
