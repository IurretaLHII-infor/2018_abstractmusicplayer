//Class used to create subgenre objects

package Objects;

import java.util.ArrayList;

/**
 * Created by abstract on 09-Mar-18.
 */

public class OSubgenre {

    /*Variables*/

    int id = 0;
    String name = "";
    OGenre genre = null;
    ArrayList<OAlbum> albumList = null;

    /*Minimal Constructor*/

    public OSubgenre(int id, String name){
        this.id = id;
        this.name = name;
    }

    /*Data Constructor*/

    public OSubgenre(int id, String name, OGenre genre){
        this.id = id;
        this.name = name;
        this.genre = genre;
    }

    /*Full Constructor*/

    public OSubgenre(int id, String name, OGenre genre, ArrayList<OAlbum> albumList){
        this.id = id;
        this.name = name;
        this.genre = genre;
        this.albumList = albumList;
    }

    /*Getters*/

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public OGenre getGenre() {
        return genre;
    }

    public ArrayList<OAlbum> getAlbumList() {
        return albumList;
    }
}
