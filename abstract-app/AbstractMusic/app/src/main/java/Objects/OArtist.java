//Class used to create Artists objects

package Objects;

import java.util.ArrayList;

/**
 * Created by Abstract on 09-Mar-18.
 */

public class OArtist {

    /*Variables*/

    int id = 0;
    String name = "";
    String description = "";
    String photo = "";
    OGenre genre = null;
    ArrayList<OAlbum> albumList = null;

    /*Minimal Constructor*/

    public OArtist(int id, String name){
        this.id = id;
        this.name = name;
    }

    /*Data Constructor*/

    public OArtist(int id, String name, String description, String photo, OGenre genre){
        this.id = id;
        this.name = name;
        this.description = description;
        this.photo = photo;
        this.genre = genre;
    }

    /*Full Constructor*/

    public OArtist(int id, String name, String description, String photo, ArrayList<OAlbum> albumList){
        this.id = id;
        this.name = name;
        this.description = description;
        this.photo = photo;
        this.albumList = albumList;
    }

    /*Getters*/

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getPhoto() {
        return photo;
    }

    public ArrayList<OAlbum> getAlbumList() {
        return albumList;
    }

    public OGenre getGenre() {
        return genre;
    }
}
