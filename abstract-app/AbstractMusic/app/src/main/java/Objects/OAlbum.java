//Class used to create Album objects

package Objects;

import java.util.ArrayList;

/**
 * Created by Abstract on 09-Mar-18.
 */

public class OAlbum {

    /*Variables*/

    int id = 0;
    String name = "";
    int year = 0;
    String cover = "";
    OSubgenre subgenre = null;
    OArtist artist = null;
    ArrayList<OSong> songList = null;

    /*Minimal Constructor*/

    public OAlbum(int id, String name){
        this.id = id;
        this.name = name;
        this.year = 0;
    }

    /*Data Constructor*/

    public OAlbum(int id, String name, int year, String cover, OSubgenre subgenre){
        this.id = id;
        this.name = name;
        this.year = year;
        this.cover = cover;
        this.subgenre = subgenre;

    }

    /*Full Constructor*/

    public OAlbum(int id, String name, int year, String cover, OArtist artist, OSubgenre subgenre, ArrayList<OSong> songList){
        this.id = id;
        this.name = name;
        this.year = year;
        this.cover = cover;
        this.artist = artist;
        this.subgenre = subgenre;
        this.songList = songList;
    }

    /*Getters*/

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getYear() {
        return year;
    }

    public String getCover() {
        return cover;
    }

    public OArtist getArtist() {
        return artist;
    }

    public ArrayList<OSong> getSongList() {
        return songList;
    }

    public OSubgenre getSubgenre() {
        return subgenre;
    }
}
