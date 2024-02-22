package PtBoard;

import java.util.Date;

// board_id, title, contents, user_id, post_date
public class BoardDTO {
    private String board_id;
    private String title;
    private String contents;
    private String user_id;
    private Date post_date;
    // board 테이블에는 작성자의 아이디만 저장되므로 목록 출력시 이름은 출력불가
    private String name;
    private String country;
    private String email;

    public String getUser_name() {
        return name;
    }

    public void setUser_Name(String name) {
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

    public String getBoard_id() {
        return board_id;
    }

    public void setBoard_id(String board_id) {
        this.board_id = board_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Date getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }
}
