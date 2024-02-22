package PtUser;

//CREATE TABLE USERS (
//USER_ID VARCHAR2(20) PRIMARY KEY,
//PASSWORD VARCHAR2(20) NOT NULL,
//NAME VARCHAR2(50),
//COUNTRY VARCHAR2(50),
//EMAIL VARCHAR2(100)
//);
public class UserDTO {
    private String user_id;
    private String password;
    private String name;
    private String country;
    private String email;

    public UserDTO() {

    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}