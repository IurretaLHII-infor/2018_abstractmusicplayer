create database abstract;

use abstract;

/*albums*/

create table albums(id int primary key auto_increment, name varchar(150),year year, cover varchar(255));

/*users*/

create table users (id int primary key auto_increment, user varchar(25),mail varchar(100), password longblob, last_login datetime,  avatar varchar(50) default "avatars/default.png");

/*artists*/

create table artists (id int primary key auto_increment, name varchar(75), description text, photo mediumblob);

/*songs*/

create table songs (id int primary key auto_increment, name varchar(100), path varchar(100));

/*bans*/

create table bans (id int primary key auto_increment, ban_count int, banned boolean);

/*genres*/

create table genres (id int primary key auto_increment, name varchar(20));

/*subgenres*/

create table subgenres (id int primary key auto_increment, name varchar(50));

/*playlists*/

create table playlists (id int primary key auto_increment, name varchar(255), photo varchar(255));


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

create table independent_albums(id int primary key auto_increment, name varchar(150),year year, cover varchar(255));

/*independent_artists*/

create table independent_artists (id int primary key auto_increment, name varchar(75), description text, photo varchar(255));

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

create table reproductions (id int primary key auto_increment, weekly int, monthly int, total bigint);

/*reproductions_songs*/

create table reproductions_songs(reproduction_id int, song_id int, foreign key(reproduction_id) references reproductions(id), foreign key(song_id) references songs(id));

/*reproductions_independent_songs*/

create table reproductions_independent_songs(reproduction_id int, independent_song_id int, foreign key(reproduction_id) references reproductions(id), foreign key(independent_song_id) references independent_songs(id));

/*bug report*/

create table bugs (id int primary key auto_increment, bug varchar(255));

/*bugs_users*/

create table bugs_users(bug_id int, user_id int, foreign key(bug_id) references bugs(id), foreign key(user_id) references users(id));

#Triggers

/*bansUpdate*/

drop procedure if exists bansUpdate;

DELIMITER //
CREATE PROCEDURE bansUpdate()
BEGIN
    DECLARE lastBan int DEFAULT 1;
    DECLARE curRow int DEFAULT 1;
    DECLARE curBanDays int DEFAULT 0;
    select id from bans ORDER BY id DESC LIMIT 1 INTO lastBan;
	 WHILE curRow<=lastBan DO
		SELECT ban_count FROM bans WHERE id = curRow INTO curBanDays;
                IF curBanDays > 0 THEN
			SET curBanDays = curBanDays -1;
                        UPDATE bans SET ban_count = curBanDays WHERE id = curRow;
                        IF curBanDays = 0 THEN
			    UPDATE bans SET banned = 0 WHERE id = curRow;
                        END IF;
                END IF;
            SET curRow = curRow + 1;
	END WHILE;
END//
DELIMITER ;

/*reproUpdate*/

drop procedure if exists reproUpdate;

DELIMITER //
CREATE PROCEDURE reproUpdate()
BEGIN
    DECLARE lastRepro int DEFAULT 1;
    DECLARE curRow int DEFAULT 1;
    SELECT id  from reproductions ORDER BY id DESC LIMIT 1 INTO lastRepro;
    IF(select DAY(adddate(now(), INTERVAL 6-weekday(now()) DAY)) = DAY(NOW())) THEN
        SET curRow = 1;
        WHILE(curRow <= reproCount) DO
    	    UPDATE reproductions set monthly = monthly + weekly where id = curRow;
	    UPDATE reproductions SET weekly = 0 WHERE id = curRow;
	    SET curRow = curRow + 1;
        END WHILE;
    END IF;
    IF(SELECT DAY(LAST_DAY(NOW())) = DAY(NOW())) THEN
	IF(reproCount > 0) THEN
	    SET curRow = 1;
            WHILE(curRow <= reproCount) DO
		UPDATE reproductions set total = total + monthly where id = curRow;
		UPDATE reproductions SET monthly = 0 WHERE id = curRow;
		SET curRow = curRow + 1;
	    END WHILE;
	END IF;
    END IF;
END//
DELIMITER ;

/*pathUpdate*/

DROP TRIGGER IF EXISTS pathUpdate;

DELIMITER //

CREATE TRIGGER pathUpdate AFTER INSERT ON albums_songs
FOR EACH ROW 
BEGIN

    DECLARE artistAlbum int DEFAULT 0;
    
    DECLARE artistID int;
    DECLARE albumID int;
    DECLARE songID int;
    DECLARE newPath varchar(100);
    
    SELECT COUNT(*) FROM albums_artists WHERE album_id = NEW.album_id INTO artistAlbum;
    
    IF(artistAlbum > 0) THEN
		
        SELECT artist_id FROM albums_artists WHERE album_id = NEW.album_id INTO artistID;
        SELECT NEW.album_id INTO albumID;
        SELECT NEW.song_id INTO songID;
        
        SELECT CONCAT('/', artistID, '/', albumID, '/', songID, '.mp3') INTO newPath;
        
        UPDATE songs SET path = newPath WHERE id = NEW.song_id;
        
    END IF;

END//

DELIMITER ;
