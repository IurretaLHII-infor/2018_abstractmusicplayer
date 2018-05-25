//Class used to create user objects

package Objects;

/**
 * Created by abstract on 09-Mar-18.
 */

public class OUser {

    /*Variables*/

    //We won't save the password since we only need it to log in. Once the user ir logged we don't need it, so we won't
    //save it because you can't steal the password if there is no saved password.

    int id = 0;
    String user = "";
    String mail = "";
    String avatar = "";

    /*Minimam Constructor*/

    public OUser(int id, String user){
        this.id = id;
        this.user = user;
    }

    /*Full Constructor*/

    public OUser(int id, String user, String mail, String avatar){
        this.id = id;
        this.user = user;
        this.mail = mail;
        this.avatar = avatar;
    }

    /*Getters & Setters*/

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
