create database abstract;

use abstract;



/*albums*/

create table albums(id int primary key auto_increment, name varchar(150),year year, cover mediumblob);

/*users*/

create table users (id int primary key auto_increment, user varchar(25),mail varchar(100), password varchar(100), avatar varchar(50) default "avatars/default.png");

/*artists*/

create table artists (id int primary key auto_increment, name varchar(75), description text, photo mediumblob);

/*songs*/
/* Futuras opciones:
- musica en ftp
- musica en base de datos
- musica en la nube
- musica en servidor*/

create table songs (id int primary key auto_increment, name varchar(100), path varchar(100));

/*bans*/

create table bans (id int primary key auto_increment, ban_count int, banned boolean);

/*genres*/

create table genres (id int primary key auto_increment, name varchar(20));

/*subgenres*/

create table subgenres (id int primary key auto_increment, name varchar(50));

/*playlists*/

create table playlists (id int primary key auto_increment, name varchar(255), photo mediumblob);


/*users_bans*/

create table users_bans (user_id int, ban_id int, foreign key (user_id) references users(id), foreign key (ban_id) references bans(id), primary key (user_id, ban_id));


/*users_artists*/

create table users_artists (user_id int, artist_id int, foreign key(user_id) references users(id), foreign key(artist_id) references artists(id), primary key(user_id, artist_id));

/*users_playlists*/

create table users_playlists(user_id int, playlist_id int, foreign key(user_id) references users(id), foreign key(playlist_id) references playlists(id),primary key(user_id, playlist_id));

/*genres_artists*/

create table genres_artists(genre_id int, artist_id int, foreign key(genre_id) references genres(id), foreign key(artist_id) references artists(id), primary key(genre_id, artist_id));

/*users_songs*/

create table users_songs(user_id int, song_id int, foreign key(user_id) references users(id), foreign key (song_id) references songs(id), primary key(user_id, song_id));

/*users_albums*/

create table users_albums(user_id int, album_id int, foreign key(user_id) references users(id), foreign key(album_id) references albums(id), primary key(user_id, album_id));

/*albums_artists*/

create table albums_artists(album_id int, artist_id int, foreign key(album_id) references albums(id), foreign key(artist_id) references artists(id), primary key(album_id, artist_id));


/*genres_subgenres*/

create table genres_subgenres(genre_id int, subgenre_id int, foreign key(genre_id) references genres(id), foreign key(subgenre_id) references subgenres(id), primary key(genre_id, subgenre_id));

/*playlists_songs*/

create table playlists_songs(playlist_id int, song_id int, foreign key(playlist_id) references playlists(id), foreign key (song_id) references songs(id), primary key(playlist_id, song_id));

/*subgenres_albums*/

create table subgenres_albums(subgenre_id int, album_id int, foreign key(subgenre_id) references subgenres(id), foreign key(album_id) references albums(id), primary key(subgenre_id, album_id));

/*albums_songs*/

create table albums_songs(album_id int, song_id int, foreign key(album_id) references albums(id), foreign key(song_id) references songs(id), primary key(album_id, song_id));



/*ARTISTAS INDEPENDIENTES*/

/*independent_albums*/

create table independent_albums(id int primary key auto_increment, name varchar(150),year year, cover mediumblob);

/*independent_artists*/

create table independent_artists (id int primary key auto_increment, name varchar(75), description text, photo mediumblob);

/*independent_songs*/
/* Futuras opciones:
- musica en ftp
- musica en base de datos
- musica en la nube
- musica en servidor*/

create table independent_songs (id int primary key auto_increment, name varchar(100), path text /*corregir*/);


/*users_independent_artists*/

create table users_independent_artists (user_id int, artist_id int, foreign key(user_id) references users(id), foreign key(artist_id) references independent_artists(id), primary key(user_id, artist_id));


/*genres_independent_artists*/

create table genres_independent_artists(genre_id int, artist_id int, foreign key(genre_id) references genres(id), foreign key(artist_id) references independent_artists(id), primary key(genre_id, artist_id));

/*users_independent_songs*/

create table users_independent_songs(user_id int, song_id int, foreign key(user_id) references users(id), foreign key (song_id) references independent_songs(id), primary key(user_id, song_id));

/*users_independent_albums*/

create table users_independent_albums(user_id int, album_id int, foreign key(user_id) references users(id), foreign key(album_id) references independent_albums(id), primary key(user_id, album_id));

/*albums_independent_artists*/

create table independent_albums_independent_artists(album_id int, artist_id int, foreign key(album_id) references independent_albums(id), foreign key(artist_id) references independent_artists(id), primary key(album_id, artist_id));

/*playlists_independent_songs*/

create table playlists_independent_songs(playlist_id int, song_id int, foreign key(playlist_id) references playlists(id), foreign key (song_id) references independent_songs(id), primary key(playlist_id, song_id));

/*subgenres_independent_albums*/

create table subgenres_independent_albums(subgenre_id int, album_id int, foreign key(subgenre_id) references subgenres(id), foreign key(album_id) references independent_albums(id), primary key(subgenre_id, album_id));

/*independent_albums_independent_songs*/

create table independent_albums_independent_songs(album_id int, song_id int, foreign key(album_id) references independent_albums(id), foreign key(song_id) references independent_songs(id), primary key(album_id, song_id));

/*reproductions*/

create table reproductions (id int primary key, weekly int, monthly int, total bigint, foreign key(id) references songs(id), foreign key(id) references independent_songs(id));

/*bug report*/

create table bugs (id int primary key auto_increment, user varchar(25), bug varchar(255));


