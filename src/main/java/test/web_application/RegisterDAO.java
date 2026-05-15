package test.web_application;

import my.bean.Register;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * RegisterDAO - 用户注册数据访问层
 * 表结构(若不存在请先在 PostgreSQL 中执行):
 *   CREATE TABLE IF NOT EXISTS register (
 *       id          SERIAL PRIMARY KEY,
 *       logname     VARCHAR(50)  NOT NULL UNIQUE,
 *       password    VARCHAR(100) NOT NULL,
 *       phone       VARCHAR(20),
 *       address     VARCHAR(200),
 *       realname    VARCHAR(50),
 *       create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 *   );
 */
public class RegisterDAO {

    /**
     * 首次访问时自动建表，避免手动执行 DDL
     */
    public void ensureTable() throws SQLException {
        String ddl = "CREATE TABLE IF NOT EXISTS register (" +
                "id SERIAL PRIMARY KEY, " +
                "logname VARCHAR(50) NOT NULL UNIQUE, " +
                "password VARCHAR(100) NOT NULL, " +
                "phone VARCHAR(20), " +
                "address VARCHAR(200), " +
                "realname VARCHAR(50), " +
                "create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
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

    /**
     * 插入注册记录
     */
    public boolean insert(Register register) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO register (logname, password, phone, address, realname) " +
                    "VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, register.getLogname());
            stmt.setString(2, register.getPassword());
            stmt.setString(3, register.getPhone());
            stmt.setString(4, register.getAddress());
            stmt.setString(5, register.getRealname());
            return stmt.executeUpdate() > 0;
        } finally {
            DatabaseUtil.closeResources(null, stmt, conn);
        }
    }

    /**
     * 检查用户名是否已存在
     */
    public boolean existsByLogname(String logname) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement("SELECT 1 FROM register WHERE logname = ?");
            stmt.setString(1, logname);
            rs = stmt.executeQuery();
            return rs.next();
        } finally {
            DatabaseUtil.closeResources(rs, stmt, conn);
        }
    }

    /**
     * 查询所有注册用户(按注册时间倒序)
     */
    public List<Register> findAll() throws SQLException {
        List<Register> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT id, logname, password, phone, address, realname, create_time " +
                    "FROM register ORDER BY create_time DESC");
            while (rs.next()) {
                Register r = new Register();
                r.setId(rs.getInt("id"));
                r.setLogname(rs.getString("logname"));
                r.setPassword(rs.getString("password"));
                r.setPhone(rs.getString("phone"));
                r.setAddress(rs.getString("address"));
                r.setRealname(rs.getString("realname"));
                r.setCreateTime(rs.getTimestamp("create_time"));
                list.add(r);
            }
        } finally {
            DatabaseUtil.closeResources(rs, stmt, conn);
        }
        return list;
    }
}
