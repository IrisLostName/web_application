package test.web_application;

import java.sql.*;
import java.util.*;

/**
 * StudentDAO - 学生数据访问层
 * 负责与students表的所有数据库交互
 */
public class StudentDAO {

    /**
     * 获取所有学生信息
     */
    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM students");

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setMajor(rs.getString("major"));
                students.add(student);
            }
        } finally {
            DatabaseUtil.closeResources(rs, stmt, conn);
        }

        return students;
    }

    /**
     * 根据ID获取学生信息
     */
    public Student getStudentById(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM students WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setMajor(rs.getString("major"));
                return student;
            }
        } finally {
            DatabaseUtil.closeResources(rs, stmt, conn);
        }

        return null;
    }

    /**
     * 新增学生
     */
    public boolean addStudent(Student student) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO students (name, age, major) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setInt(2, student.getAge());
            stmt.setString(3, student.getMajor());

            int result = stmt.executeUpdate();
            return result > 0;
        } finally {
            DatabaseUtil.closeResources(null, stmt, conn);
        }
    }

    /**
     * 更新学生信息
     */
    public boolean updateStudent(Student student) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "UPDATE students SET name = ?, age = ?, major = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setInt(2, student.getAge());
            stmt.setString(3, student.getMajor());
            stmt.setInt(4, student.getId());

            int result = stmt.executeUpdate();
            return result > 0;
        } finally {
            DatabaseUtil.closeResources(null, stmt, conn);
        }
    }

    /**
     * 删除学生
     */
    public boolean deleteStudent(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "DELETE FROM students WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            int result = stmt.executeUpdate();
            return result > 0;
        } finally {
            DatabaseUtil.closeResources(null, stmt, conn);
        }
    }
}
