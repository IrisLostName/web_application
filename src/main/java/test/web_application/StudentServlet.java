package test.web_application;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "studentServlet", value = "/students")
public class StudentServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>学生信息表</title>");
        out.println("<style>");
        out.println("table { border-collapse: collapse; width: 80%; margin: 20px auto; }");
        out.println("th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("h1 { text-align: center; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>📚 学生信息表</h1>");

        try {
            // 调用DAO获取数据
            StudentDAO dao = new StudentDAO();
            List<Student> students = dao.getAllStudents();

            // 绘制表格
            out.println("<table>");
            out.println("<tr><th>ID</th><th>姓名</th><th>年龄</th><th>专业</th></tr>");

            if (students != null && !students.isEmpty()) {
                for (Student student : students) {
                    out.println("<tr>");
                    out.println("<td>" + student.getId() + "</td>");
                    out.println("<td>" + student.getName() + "</td>");
                    out.println("<td>" + student.getAge() + "</td>");
                    out.println("<td>" + student.getMajor() + "</td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr><td colspan='4'>暂无数据</td></tr>");
            }

            out.println("</table>");

        } catch (SQLException e) {
            out.println("<p style='color:red;'>❌ 数据库错误: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ 错误: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }

        out.println("</body>");
        out.println("</html>");
    }
}
