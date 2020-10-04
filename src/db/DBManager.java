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
}
