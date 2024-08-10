INSERT INTO Artistas (Nombre, Genero, Pais, Edad, AlbumesTotal, CancionesTotal, Reproducciones)
VALUES 
    ('Shakira', 'Pop', 'Colombia', 44, 10, 50, 1000000),
    ('Coldplay', 'Rock', 'Reino Unido', 45, 8, 60, 1200000),
    ('Taylor Swift', 'Pop', 'Estados Unidos', 32, 9, 55, 1500000),
    ('Juanes', 'Pop Rock', 'Colombia', 49, 7, 40, 800000),
    ('Metallica', 'Heavy Metal', 'Estados Unidos', 60, 12, 85, 2000000),
    ('Beyoncé', 'R&B', 'Estados Unidos', 39, 6, 30, 900000),
    ('Ed Sheeran', 'Pop', 'Reino Unido', 31, 4, 25, 700000),
    ('Adele', 'Soul', 'Reino Unido', 33, 3, 20, 600000),
    ('Bruno Mars', 'Pop', 'Estados Unidos', 36, 5, 35, 850000),
    ('Eminem', 'Hip Hop', 'Estados Unidos', 48, 8, 55, 1100000),
    ('Rihanna', 'R&B', 'Barbados', 34, 7, 45, 1000000),
    ('The Weeknd', 'R&B', 'Canadá', 31, 5, 30, 750000),
    ('Justin Bieber', 'Pop', 'Canadá', 27, 6, 40, 900000),
    ('Ariana Grande', 'Pop', 'Estados Unidos', 28, 5, 35, 800000),
    ('Drake', 'Hip Hop', 'Canadá', 35, 7, 50, 1200000);


INSERT INTO Albumes (Titulo, Publicacion, Genero, Duracion, NroCanciones, ArtistaID, Reproducciones)
VALUES 
    ('El Dorado', 2017, 'Pop', 45, 13, 1, 500000),
    ('Parachutes', 2000, 'Rock', 50, 10, 2, 600000),
    ('1989', 2014, 'Pop', 48, 15, 3, 700000),
    ('Mis planes son amarte', 2017, 'Pop Rock', 55, 12, 4, 400000),
    ('Metallica', 1991, 'Heavy Metal', 63, 12, 5, 800000),
    ('Lemonade', 2016, 'R&B', 55, 14, 6, 450000),
    ('÷', 2017, 'Pop', 50, 16, 7, 400000),
    ('21', 2011, 'Soul', 47, 11, 8, 350000),
    ('Doo-Wops & Hooligans', 2010, 'Pop', 42, 10, 9, 300000),
    ('Recovery', 2010, 'Hip Hop', 47, 14, 10, 550000),
    ('Loud', 2010, 'R&B', 48, 12, 11, 500000),
    ('After Hours', 2020, 'R&B', 56, 14, 12, 400000),
    ('Purpose', 2015, 'Pop', 54, 13, 13, 450000),
    ('Positions', 2020, 'Pop', 45, 14, 14, 400000),
    ('Take Care', 2011, 'Hip Hop', 65, 18, 15, 600000);


INSERT INTO Canciones (Titulo, Duracion, Genero, AlbumID, ArtistaID, Compositores, Letra)
VALUES 
    ('Chantaje', 3, 'Pop', 1, 1, 'Shakira, Maluma', 'Letra de Chantaje...'),
    ('Yellow', 4, 'Rock', 2, 2, 'Coldplay', 'Letra de Yellow...'),
    ('Shake It Off', 3, 'Pop', 3, 3, 'Taylor Swift', 'Letra de Shake It Off...'),
    ('Fuego', 4, 'Pop Rock', 4, 4, 'Juanes', 'Letra de Fuego...'),
    ('Enter Sandman', 5, 'Heavy Metal', 5, 5, 'Hetfield, Ulrich, Hammett', 'Letra de Enter Sandman...'),
    ('Halo', 4, 'R&B', 6, 6, 'Beyoncé, Tedder, Bogart', 'Letra de Halo...'),
    ('Shape of You', 3, 'Pop', 7, 7, 'Ed Sheeran, McDaid', 'Letra de Shape of You...'),
    ('Rolling in the Deep', 4, 'Soul', 8, 8, 'Adele, Epworth', 'Letra de Rolling in the Deep...'),
    ('Just the Way You Are', 3, 'Pop', 9, 9, 'Bruno Mars, Lawrence, Levine', 'Letra de Just the Way You Are...'),
    ('Love the Way You Lie', 4, 'Hip Hop', 10, 10, 'Eminem, Rihanna, Hafferman', 'Letra de Love the Way You Lie...'),
    ('Diamonds', 3, 'R&B', 11, 11, 'Sia, Furler, Braide', 'Letra de Diamonds...'),
    ('Blinding Lights', 4, 'R&B', 12, 12, 'The Weeknd, Balshe', 'Letra de Blinding Lights...'),
    ('Sorry', 3, 'Pop', 13, 13, 'Justin Bieber, Tranter, Michaels', 'Letra de Sorry...'),
    ('positions', 3, 'Pop', 14, 14, 'Ariana Grande, Victoria Monét', 'Letra de positions...'),
    ('Hotline Bling', 4, 'Hip Hop', 15, 15, 'Drake, Shebib', 'Letra de Hotline Bling...');


INSERT INTO Usuarios (Nombre, CorreoElectronico, PreferenciasMusicales, FechaRegistro, FechaNacimiento, Pais)
VALUES 
    ('Maria González', 'maria@example.com', 'Pop, Rock', '2023-01-15', '1995-03-10', 'España'),
    ('John Smith', 'john@example.com', 'Pop, Hip Hop', '2023-02-20', '1990-05-25', 'Estados Unidos'),
    ('Laura Martínez', 'laura@example.com', 'Pop, R&B', '2023-03-05', '1988-08-15', 'México'),
    ('David Johnson', 'david@example.com', 'Rock, Metal', '2023-04-10', '1985-11-20', 'Reino Unido'),
    ('Ana Pérez', 'ana@example.com', 'R&B, Soul', '2023-05-15', '1998-02-12', 'Colombia'),
    ('Michael Brown', 'michael@example.com', 'Pop, Hip Hop', '2023-06-20', '1993-07-05', 'Canadá'),
    ('Sophia Rodriguez', 'sophia@example.com', 'Pop, R&B', '2023-07-25', '1997-09-30', 'Argentina'),
    ('Daniel Lee', 'daniel@example.com', 'Rock, Indie', '2023-08-30', '1987-12-03', 'Australia'),
    ('Emma White', 'emma@example.com', 'Pop, Indie', '2023-09-05', '1994-01-18', 'Francia'),
    ('Alexis Taylor', 'alexis@example.com', 'Hip Hop, R&B', '2023-10-10', '1991-04-22', 'Alemania'),
    ('Luis Hernández', 'luis@example.com', 'Pop, Reggaetón', '2023-11-15', '1989-06-07', 'España'),
    ('Julia Kim', 'julia@example.com', 'Pop, Jazz', '2023-12-20', '1996-10-12', 'Corea del Sur'),
    ('Gabriel Garcia', 'gabriel@example.com', 'Rock, Metal', '2024-01-25', '1992-11-28', 'México'),
    ('Isabella Rossi', 'isabella@example.com', 'Pop, Electrónica', '2024-02-28', '1990-01-03', 'Italia'),
    ('Lucas Silva', 'lucas@example.com', 'Hip Hop, Funk', '2024-03-05', '1986-04-15', 'Brasil');


INSERT INTO Playlists (Nombre, Descripcion, UsuarioID, Fecha, Privacidad)
VALUES 
    ('Favoritas', 'Mis canciones favoritas de todos los tiempos', 1, '2023-01-20', 'Privada'),
    ('Rock Classics', 'Clásicos del rock de todas las décadas', 4, '2023-02-25', 'Pública'),
    ('Pop Hits', 'Éxitos pop actuales y clásicos', 7, '2023-03-10', 'Pública'),
    ('Hip Hop Vibes', 'Las mejores pistas de hip hop para fiestas', 10, '2023-04-15', 'Privada'),
    ('Chill R&B', 'Música R&B relajante para escuchar en cualquier momento', 13, '2023-05-20', 'Pública'),
    ('Metal Mayhem', 'La esencia del metal en una lista de reproducción', 2, '2023-06-25', 'Pública'),
    ('Indie Soundscapes', 'Sonidos únicos del mundo del indie', 5, '2023-07-30', 'Pública'),
    ('Electro Beats', 'Ritmos electrónicos para tus sesiones de ejercicio', 8, '2023-08-05', 'Privada'),
    ('Latin Vibes', 'La música latina más caliente del momento', 11, '2023-09-10', 'Pública'),
    ('Jazz Lounge', 'Ambiente de jazz para una noche relajante', 14, '2023-10-15', 'Pública'),
    ('Reggaetón Party', 'Los mejores éxitos de reggaetón para una fiesta inolvidable', 3, '2023-11-20', 'Privada'),
    ('K-pop Hits', 'Éxitos del K-pop para los fanáticos del género', 6, '2023-12-25', 'Pública'),
    ('Funk Grooves', 'Grooves funky para mover el esqueleto', 9, '2024-01-30', 'Pública'),
    ('Country Roads', 'Canciones country para el alma', 12, '2024-02-15', 'Pública'),
    ('Blues Session', 'Sesión de blues para los amantes del género', 15, '2024-03-20', 'Pública');


INSERT INTO Comentarios (Contenido, FechaPublicacion, UsuarioID, AlbumID, Likes)
VALUES 
    ('Gran álbum, muchas gracias por la música!', '2023-01-25', 1, 1, 15),
    ('Una obra maestra, no puedo dejar de escucharla', '2023-02-28', 2, 2, 10),
    ('Sus canciones son adictivas, me encantan!', '2023-03-10', 3, 3, 20),
    ('Una excelente producción, cada canción es especial', '2023-04-15', 4, 4, 12),
    ('Un clásico del metal, imprescindible en mi lista', '2023-05-20', 5, 5, 18),
    ('Me llega al corazón, increíble voz y letras', '2023-06-25', 6, 6, 25),
    ('Perfecto para bailar y disfrutar en cualquier momento', '2023-07-30', 7, 7, 30),
    ('Cada canción cuenta una historia fascinante', '2023-08-05', 8, 8, 14),
    ('Sencillamente genial, no puedo dejar de escucharlo', '2023-09-10', 9, 9, 22),
    ('Impactante, su letra me ha dejado sin palabras', '2023-10-15', 10, 10, 16),
    ('Su voz es increíble, una joya del R&B moderno', '2023-11-20', 11, 11, 28),
    ('No hay álbum que supere a este en mi colección', '2023-12-25', 12, 12, 32),
    ('Cada canción es un viaje musical único', '2024-01-30', 13, 13, 19),
    ('Una mezcla perfecta de ritmo y letras emotivas', '2024-02-15', 14, 14, 24),
    ('Su música me transporta a otro lugar', '2024-03-20', 15, 15, 27);


INSERT INTO Eventos (Nombre, Ubicacion, Fecha, ArtistaID, Duracion, Tipo)
VALUES 
    ('Global Music Festival', 'Londres', '2023-07-15', 1 , 360, 'Festival'),
    ('Rock Legends Tour', 'Los Angeles', '2023-08-20', 2, 300, 'Concierto'),
    ('Pop Extravaganza', 'Nueva York', '2023-09-25', 3, 240, 'Concierto'),
    ('Hip Hop Nation', 'Chicago', '2023-10-30', 4, 270, 'Festival'),
    ('R&B Showcase', 'Atlanta', '2023-11-15', 5, 240, 'Concierto'),
    ('Indie Fest', 'Portland', '2023-12-20', 6, 300, 'Festival'),
    ('Electro City', 'Berlín', '2024-01-25', 7, 240, 'Concierto'),
    ('Latin Heat', 'Miami', '2024-02-28', 8, 270, 'Festival'),
    ('Jazz Night', 'Nueva Orleans', '2024-03-15', 9, 180, 'Concierto'),
    ('Reggae Roots', 'Kingston', '2024-04-20', 10, 210, 'Festival'),
    ('K-pop Explosion', 'Seúl', '2024-05-25', 11, 240, 'Concierto'),
    ('Funk Groove Party', 'São Paulo', '2024-06-30', 12, 180, 'Festival'),
    ('Country Roads Fest', 'Nashville', '2024-07-15', 13, 240, 'Concierto'),
    ('Blues Revival', 'Chicago', '2024-08-20', 13, 210, 'Festival'),
    ('Electronic Odyssey', 'Amsterdam', '2024-09-25', 14, 270, 'Concierto');

INSERT INTO Fandom (Titulo, Contenido, FechaPublicacion, UsuarioID, ArtistaID)
VALUES 
    ('Shakira Fans Club', 'Comunidad de fans de Shakira alrededor del mundo.', '2023-01-15', 1, 1),
    ('Coldplay Enthusiasts', 'Fans de Coldplay compartiendo noticias y conciertos.', '2023-02-20', 2, 2),
    ('Swifties United', 'Dedicado a los fans de Taylor Swift con eventos y discusiones.', '2023-03-05', 3, 3),
    ('Juanes Admirers', 'Seguidores de Juanes disfrutando de su música y conciertos.', '2023-04-10', 4, 4),
    ('Metallica Nation', 'Comunidad de fanáticos de Metallica en todo el mundo.', '2023-05-15', 5, 5),
    ('Beyhive Community', 'Fans de Beyoncé discutiendo su música y actuaciones.', '2023-06-20', 6, 6),
    ('Sheerios Gathering', 'Seguidores de Ed Sheeran compartiendo experiencias y covers.', '2023-07-25', 7, 7),
    ('Daydreamers Lounge', 'Comunidad dedicada a los fans de Adele con noticias y contenido.', '2023-08-30', 8, 8),
    ('Hooligans Hangout', 'Punto de encuentro para los fans de Bruno Mars.', '2023-09-05', 9, 9),
    ('Eminem Stans', 'Seguidores de Eminem discutiendo sus letras y colaboraciones.', '2023-10-10', 10, 10),
    ('Rihanna Navy', 'Comunidad global de fans de Rihanna compartiendo amor por su música.', '2023-11-15', 11, 11),
    ('Weeknd Warriors', 'Fans de The Weeknd conectando sobre su música y espectáculos.', '2023-12-20', 12, 12),
    ('Beliebers Hub', 'Dedicado a los fanáticos de Justin Bieber con noticias y videos.', '2024-01-25', 13, 13),
    ('Arianators Zone', 'Espacio para los seguidores de Ariana Grande discutir su música.', '2024-02-28', 14, 14),
    ('Drake Community', 'Comunidad de fans de Drake compartiendo remixes y opiniones.', '2024-03-05', 15, 15);
    
    
    INSERT INTO Fandom (Titulo, Contenido, FechaPublicacion, UsuarioID, ArtistaID)
VALUES 
    ('Top 10 Canciones de Shakira', 'Descubre cuáles son las mejores canciones de Shakira según nuestros fanáticos.', '2023-06-10', 1, 1),
    ('Coldplay: La Evolución de su Estilo', 'Exploramos cómo ha evolucionado el estilo musical de Coldplay a lo largo de los años.', '2023-07-15', 2, 2),
    ('Taylor Swift: La Reina del Pop', 'Un análisis detallado del impacto de Taylor Swift en la industria musical actual.', '2023-08-20', 3, 3),
    ('Juanes: Icono de la Música Latina', 'Descubre la trayectoria musical y el impacto de Juanes en la música latina.', '2023-09-25', 4, 4),
    ('Metallica: Leyendas del Heavy Metal', 'Exploramos la historia y el legado de Metallica en la escena del heavy metal.', '2023-10-30', 5, 5),
    ('El Legado de Beyoncé en el R&B', 'Analizamos la influencia de Beyoncé en el género del R&B y su impacto en la cultura popular.', '2023-11-05', 6, 6),
    ('Ed Sheeran: El Cantautor Británico', 'Un vistazo a la carrera musical y las canciones más destacadas de Ed Sheeran.', '2023-12-10', 7, 7),
    ('Adele: La Voz de la Emoción', 'Recorremos la emotiva música de Adele y su impacto en la industria musical.', '2024-01-15', 8, 8),
    ('Bruno Mars: El Rey de la Fusión Musical', 'Descubre cómo Bruno Mars combina diferentes estilos musicales en su obra.', '2024-02-20', 9, 9),
    ('Eminem: El Maestro del Rap', 'Exploramos la carrera de Eminem y su influencia en la escena del rap internacional.', '2024-03-25', 10, 10),
    ('Rihanna: Icono de la Moda y la Música', 'Un repaso por la carrera musical y el impacto de Rihanna en la industria del entretenimiento.', '2024-04-30', 11, 11),
    ('The Weeknd: El Talento Canadiense', 'Analizamos la música única y el estilo de The Weeknd en la escena musical actual.', '2024-05-05', 12, 12),
    ('Justin Bieber: Evolución de una Estrella', 'Exploramos el crecimiento artístico y personal de Justin Bieber a lo largo de los años.', '2024-06-10', 13, 13),
    ('Ariana Grande: La Voz Angelical', 'Un recorrido por las canciones más emblemáticas y la voz única de Ariana Grande.', '2024-07-15', 14, 14),
    ('Drake: El Fenómeno del Hip Hop', 'Descubre cómo Drake ha dominado la escena del hip hop con su música innovadora.', '2024-08-20', 15, 15);