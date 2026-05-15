package test.web_application;

import java.io.*;
import java.sql.*;
import java.util.Properties;

/**
 * 数据库工具类 - 负责数据库连接和配置管理
 */
public class DatabaseUtil {

    private static String db_url;
    private static String db_user;
    private static String db_password;
    private static String db_driver;

    // 静态块：在类加载时读取配置文件
    static {
        loadConfig();
    }

    /**
     * 从db.properties文件加载数据库配置
     */
    private static void loadConfig() {
        Properties props = new Properties();
        try (InputStream input = DatabaseUtil.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new RuntimeException("db.properties 文件未找到");
            }
            props.load(input);

            db_url = props.getProperty("db.url");
            db_user = props.getProperty("db.user");
            db_password = props.getProperty("db.password");
            db_driver = props.getProperty("db.driver");

            // 加载JDBC驱动
            Class.forName(db_driver);
        } catch (Exception e) {
            throw new RuntimeException("加载数据库配置失败: " + e.getMessage(), e);
        }
    }

    /**
     * 获取数据库连接
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(db_url, db_user, db_password);
    }

    /**
     * 关闭资源
     */
    public static void closeResources(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
