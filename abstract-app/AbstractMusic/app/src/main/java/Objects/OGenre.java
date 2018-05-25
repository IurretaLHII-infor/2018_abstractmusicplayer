//Class used to create Genre objects

package Objects;

import java.util.ArrayList;

/**
 * Created by abstract on 09-Mar-18.
 */

public class OGenre {

    /*Variables*/

    int id = 0;
    String name = "";
    ArrayList<OSubgenre> subgenreList = null;

    /*
    *Data and minimal constructors are the same in
    */

    /*Data Constructor*/

    public OGenre(int id, String name){
        this.id = id;
        this.name = name;
    }

    /*Full Constructor*/

    public OGenre(int id, String name, ArrayList<OSubgenre> subgenreList){
        this.id = id;
        this.name = name;
        this.subgenreList = subgenreList;
    }

    /*Getters*/

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public ArrayList<OSubgenre> getSubgenreList() {
        return subgenreList;
    }
}
