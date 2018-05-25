//Class used to create song objects

package Objects;

import java.io.Serializable;

/**
 * Created by abstract on 09-Mar-18.
 */

public class OSong implements Serializable{

    /*Variables*/

    int id = 0;
    String name = "";
    String path = "";
    OAlbum album = null;
    OArtist artist = null;
    OSubgenre subgenre = null;
    OGenre genre = null;

    /*Minimal Constructor*/

    public OSong(int id, String name){
        this.id = id;
        this.name = name;
    }

    /*Data Constructor*/

    public OSong(int id, String name, String path, OGenre genre, OSubgenre subgenre){
        this.id = id;
        this.name = name;
        this.path = path;
        this.genre = genre;
        this.subgenre = subgenre;
    }

    /*Full Constructor*/

    public OSong(int id, String name, String path, OAlbum album, OArtist artist, OGenre genre, OSubgenre subgenre){
        this.id = id;
        this.name = name;
        this.path = path;
        this.genre = genre;
        this.subgenre = subgenre;
        this.album = album;
        this.artist = artist;
    }

    /*Getters*/

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPath() {
        return path;
    }

    public OAlbum getAlbum() {
        return album;
    }

    public OArtist getArtist() {
        return artist;
    }
}
