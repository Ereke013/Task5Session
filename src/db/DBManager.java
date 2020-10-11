package db;

import java.sql.*;
import java.util.ArrayList;


public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/aralasu?useUnicode=true&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean addUser(Users user) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users (id, email, password, full_name, birth_date, picture_url) VALUES (null,?,?,?,?,?)");
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
//            java.util.Date utilStartDate = user.getBirthdate();
//            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
            statement.setDate(4, (Date) user.getBirthdate());
            statement.setString(5, user.getPicture_url());

            rows = statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }



    public static ArrayList<Users> getAllUsers() {
        ArrayList<Users> userList = new ArrayList<Users>();
        try {
            PreparedStatement stat = connection.prepareStatement(" SELECT id, email, password, full_name, birth_date, picture_url FROM users");
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                userList.add(new Users(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        (java.sql.Date )rs.getDate(5),
                        rs.getString(6)
                ));
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return userList;
    }

    public static boolean deleteUser(Long id) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM users WHERE id = ?");

            statement.setLong(1, id);

            rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static Users getUser(Long id) {
        Users user = null;

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from users where id = ?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new Users(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        (java.sql.Date )rs.getDate(5),
                        rs.getString(6)
                        );
            }
        } catch (Exception e) {
        }

        return user;
    }


    public static boolean saveUser(Users user){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET email = ?, password = ?, full_name=?, birth_date=?, picture_url=? WHERE id = ? ");
            statement.setString(1,user.getEmail());
            statement.setString(2,user.getPassword());
            statement.setString(3,user.getFullName());
            java.util.Date utilStartDate = user.getBirthdate();
            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
            statement.setDate(4, (Date) user.getBirthdate());
            statement.setString(5,user.getPicture_url());
            statement.setLong(6,user.getId());

            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static Users getUserbyemail(String email) {
        Users user = null;

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * from users where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new Users(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        (java.sql.Date )rs.getDate(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
        }

        return user;
    }

//    public static boolean getAge(Date birthdate){
//        int userAge = 0;
//
//        try {
//            PreparedStatement ps = connection.prepareStatement("SELECT birth_date, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age FROM users where birth_date = ?");
//            ps.setDate(1, birthdate);
//            ResultSet rs = ps.executeQuery();
//
//            rs.getDate(1);
//            userAge = ps.executeUpdate();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return userAge > 0;
//    }

    public static int getAge(Long id) {
        int userAge = 0;

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT birth_date, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age FROM users where id = "+id);
//            ps.setDate(1, (Date) birthdate);
            ResultSet rs = ps.executeQuery();
            System.out.println("age:+"+rs);
            if(rs.next()) {
                userAge = rs.getInt(2);
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userAge;
    }

    public static ArrayList<Posts> getAllPosts(){
        ArrayList<Posts> postList = new ArrayList<>();
        try {
            PreparedStatement stat = connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "  from posts p " +
                    "  inner join users u on p.author_id = u.id " +
                    " order by post_date desc ");
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                postList.add(new Posts(
                        rs.getLong("id"),
                        new Users(
                                rs.getLong("id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getDate("birth_date"),
                                rs.getString("picture_url")
                        ),
                        rs.getString("title"),
                        rs.getString("short_content"),
                        rs.getString("content"),
                        rs.getTimestamp("post_date")
                ));
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return postList;
    }



    public static boolean addPost(Posts post) {
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO posts (id, author_id, title, short_content, content, post_date) VALUES (null,?,?,?,?,NOW()) ");
            statement.setLong(1, post.getAuthor().getId());
            statement.setString(2, post.getTitle());
            statement.setString(3, post.getShort_content());
            statement.setString(4, post.getContent());

            rows = statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static Posts getPostById(Long id){
        Posts p=null;

        try {
            PreparedStatement statement=connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "   from posts p " +
                    "  inner join users u on p.author_id = u.id " +
                    " where p.id=? ");
            statement.setLong(1,id);

            ResultSet set=statement.executeQuery();

            if(set.next()){
                p=new Posts(
                        set.getLong("id"),
                        new Users(
                                set.getLong("id"),
                                set.getString("email"),
                                set.getString("password"),
                                set.getString("full_name"),
                                set.getDate("birth_date"),
                                set.getString("picture_url")
                        ),
                        set.getString("title"),
                        set.getString("short_content"),
                        set.getString("content"),
                        set.getTimestamp("post_date")
                );
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  p;
    }

    public static ArrayList<Posts> getPostByUserId(Long id){
        ArrayList<Posts> posts=new ArrayList<>();

        try {
            PreparedStatement statement=connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "   from posts p " +
                    "  inner join users u on p.author_id = u.id " +
                    " where u.id=? ");
            statement.setLong(1,id);

            ResultSet set=statement.executeQuery();

            while (set.next()){
                posts.add(new Posts(
                        set.getLong("id"),
                        new Users(
                                set.getLong("id"),
                                set.getString("email"),
                                set.getString("password"),
                                set.getString("full_name"),
                                set.getDate("birth_date"),
                                set.getString("picture_url")
                        ),
                        set.getString("title"),
                        set.getString("short_content"),
                        set.getString("content"),
                        set.getTimestamp("post_date")
                ));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  posts;
    }

    public static boolean savePost(Posts post){
        int rows = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE posts SET author_id = ?, title = ?, short_content=?, content=?, post_date=? WHERE id = ? ");
            statement.setString(1,post.getTitle());
//            statement.setString(2,post.getPassword());
//            statement.setString(3,user.getFullName());
//            java.util.Date utilStartDate = user.getBirthdate();
//            java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
//            statement.setDate(4, (Date) user.getBirthdate());
//            statement.setString(5,user.getPicture_url());
//            statement.setLong(6,user.getId());

            rows = statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static Posts getFriendsById(Long id){
        Posts p=null;

        try {
            PreparedStatement statement=connection.prepareStatement(" SELECT p.id,p.author_id,p.title,p.short_content,p.content,p.post_date ,u.id,u.email,u.password,u.full_name,u.picture_url,u.birth_date " +
                    "   from posts p " +
                    "  inner join users u on p.author_id = u.id " +
                    " where p.id=? ");
            statement.setLong(1,id);

            ResultSet set=statement.executeQuery();

            if(set.next()){
                p=new Posts(
                        set.getLong("id"),
                        new Users(
                                set.getLong("id"),
                                set.getString("email"),
                                set.getString("password"),
                                set.getString("full_name"),
                                set.getDate("birth_date"),
                                set.getString("picture_url")
                        ),
                        set.getString("title"),
                        set.getString("short_content"),
                        set.getString("content"),
                        set.getTimestamp("post_date")
                );
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  p;
    }

    public static ArrayList<Users> getAllFriends(Long id){
        ArrayList<Users> friendsList = new ArrayList<>();
        try {
            PreparedStatement stat = connection.prepareStatement(" SELECT us.id, us.email, us.password, us.full_name, us.birth_date, us.picture_url " +
                    "  from users u " +
                    "  inner join friends f on u.id = f.friend_id " +
                    " inner join users us on us.id = f.user_id " +
                    " where u.id = ? ");
            stat.setLong(1, id);
            ResultSet rs = stat.executeQuery();
            while (rs.next()) {
                friendsList.add(new Users(
                                rs.getLong("id"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("full_name"),
                                rs.getDate("birth_date"),
                                rs.getString("picture_url")
                        )
                );
            }
            stat.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        return friendsList;
    }
}
