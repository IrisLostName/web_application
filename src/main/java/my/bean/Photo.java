package my.bean;

import test.web_application.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Photo - 图片 JavaBean
 * 表结构:
 *   CREATE TABLE IF NOT EXISTS photo (
 *       id   SERIAL PRIMARY KEY,
 *       name VARCHAR(100),
 *       data TEXT   -- base64 编码后的图片
 *   );
 */
public class Photo {
    private int id;
    private String name = "";
    private String data = "";

    public Photo() {
    }

    public Photo(String name, String data) {
        this.name = name;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    /** 首次访问时自动建表 */
    public static void ensureTable() throws SQLException {
        String ddl = "CREATE TABLE IF NOT EXISTS photo (" +
                "id SERIAL PRIMARY KEY, " +
                "name VARCHAR(100), " +
                "data TEXT" +
                ")";
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.createStatement();
            stmt.executeUpdate(ddl);
        } finally {
            DatabaseUtil.closeResources(null, stmt, conn);
        }
    }

    /** 插入一条图片记录 */
    public static boolean insert(Photo photo) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement("INSERT INTO photo (name, data) VALUES (?, ?)");
            stmt.setString(1, photo.getName());
            stmt.setString(2, photo.getData());
            return stmt.executeUpdate() > 0;
        } finally {
            DatabaseUtil.closeResources(null, stmt, conn);
        }
    }

    /** 查询全部图片(按 id 升序) */
    public static List<Photo> findAll() throws SQLException {
        List<Photo> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT id, name, data FROM photo ORDER BY id ASC");
            while (rs.next()) {
                Photo p = new Photo();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setData(rs.getString("data"));
                list.add(p);
            }
        } finally {
            DatabaseUtil.closeResources(rs, stmt, conn);
        }
        return list;
    }
}