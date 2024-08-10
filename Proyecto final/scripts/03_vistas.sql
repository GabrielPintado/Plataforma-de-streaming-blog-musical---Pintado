-- Vista UsuariosConLista:
-- Esta vista combina información de usuarios y listas de reproducción, mostrando el nombre de los usuarios junto con el nombre de sus listas 
-- de reproducción utilizando las tablas Usuarios y Playlists, y se basa en la relación de ID de usuario con UsuarioID en las listas de reproducción.

CREATE VIEW UsuariosConListas AS
SELECT Usuarios.Nombre, Playlists.Nombre AS ListaReproduccion
FROM Usuarios
JOIN Playlists ON Usuarios.ID = Playlists.UsuarioID;

-- Vista ComentariosUsuarios:
-- Descripción: Esta vista muestra los comentarios realizados por usuarios, incluyendo el nombre del usuario, el contenido del comentario 
-- y la fecha de publicación, se basa en las tablas Usuarios y Comentarios, relacionadas por los campos ID de usuario y UsuarioID.

CREATE VIEW ComentariosUsuarios AS
SELECT Usuarios.Nombre AS Usuario, Comentarios.Contenido AS Comentario, Comentarios.FechaPublicacion
FROM Usuarios
JOIN Comentarios ON Usuarios.ID = Comentarios.UsuarioID;

-- Vista ArtistasAlbumes:
-- Descripción: Esta vista combina información de artistas y álbumes, mostrando el nombre del artista, el título del álbum, 
-- el año de publicación, el género del álbum y el número de reproducciones del álbum. Utiliza las tablas Artistas y Albumes, 
-- y se basa en la relación del ID del artista con ArtistaID en los álbumes.

CREATE VIEW ArtistasAlbumes AS 
SELECT Artistas.Nombre AS Artista, Albumes.Titulo AS Album, Albumes.Publicacion, Albumes.Genero, Albumes.Reproducciones
FROM Artistas
JOIN Albumes ON Artistas.ID = Albumes.ArtistaID;

-- Vista CancionesAlbumes:
-- Descripción: Esta vista combina información de canciones y álbumes, mostrando el título de la canción, el título del álbum, 
-- la duración de la canción y el género de la canción. Utiliza las tablas Canciones y Albumes, y se basa en la relación del ID del álbum con 
-- AlbumID en las canciones.

CREATE VIEW CancionesAlbumes AS 
SELECT Canciones.Titulo AS Cancion, Albumes.Titulo AS Album, Canciones.Duracion, Canciones.Genero
FROM Canciones
JOIN Albumes ON Canciones.AlbumID = Albumes.ID;

-- Vista EventosArtistas:
-- Descripción: Esta vista muestra los eventos y los artistas participantes, incluyendo el nombre del evento, la ubicación, 
-- la fecha y los artistas participantes. Utiliza la tabla Eventos.

CREATE VIEW EventosArtistas AS
SELECT Eventos.Nombre AS Evento, Eventos.Ubicacion, Eventos.Fecha, Eventos.ArtistaID
FROM Eventos;

-- Vista FandomUsuarios:
-- Descripción: Esta vista muestra las interacciones del fandom entre usuarios y artistas, incluyendo el nombre del usuario, el nombre del artista, 
-- el título del fandom, el contenido del fandom y la fecha de publicación. Utiliza las tablas Fandom, Usuarios y Artistas, 
-- y se basa en la relación de UsuarioID con ID en la tabla Usuarios y ArtistaID con ID en la tabla Artistas.

CREATE VIEW FandomUsuarios AS
SELECT Usuarios.Nombre AS Usuario, Artistas.Nombre AS Artista, Fandom.Titulo, Fandom.Contenido, Fandom.FechaPublicacion
FROM Fandom
JOIN Usuarios ON Fandom.UsuarioID = Usuarios.ID
JOIN Artistas ON Fandom.ArtistaID = Artistas.ID;