package test.web_application;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import my.bean.Register;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(name = "registerServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    private static final Pattern LOGNAME_PATTERN = Pattern.compile("^[A-Za-z0-9_]{3,20}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\d{7,15}$");

    private final RegisterDAO dao = new RegisterDAO();

    @Override
    public void init() {
        try {
            dao.ensureTable();
        } catch (SQLException e) {
            log("初始化 register 表失败", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            handleDelete(request, response);
            return;
        }
        loadAndForward(request, response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idParam = request.getParameter("id");
        try {
            int id = Integer.parseInt(idParam);
            boolean ok = dao.deleteById(id);
            String flash = ok ? "deleted" : "notfound";
            response.sendRedirect(request.getContextPath() + "/register?msg=" + flash);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/register?msg=badid");
        } catch (SQLException e) {
            log("删除注册记录失败", e);
            response.sendRedirect(request.getContextPath() + "/register?msg=dberr");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Register register = new Register();
        register.setLogname(trim(request.getParameter("logname")));
        register.setPassword(trim(request.getParameter("password")));
        register.setPhone(trim(request.getParameter("phone")));
        register.setAddress(trim(request.getParameter("address")));
        register.setRealname(trim(request.getParameter("realname")));

        String againPassword = trim(request.getParameter("again_password"));
        List<String> errors = validate(register, againPassword);

        if (errors.isEmpty()) {
            try {
                if (dao.existsByLogname(register.getLogname())) {
                    errors.add("用户名 \"" + register.getLogname() + "\" 已被占用，请更换。");
                } else {
                    dao.insert(register);
                    request.setAttribute("successMsg", "注册成功！欢迎 " + register.getLogname());
                    // 成功后清空回显
                    register = new Register();
                }
            } catch (SQLException e) {
                errors.add("数据库错误: " + e.getMessage());
            }
        }

        request.setAttribute("register", register);
        request.setAttribute("errors", errors);
        loadListAndForward(request, response);
    }

    private void loadAndForward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("register") == null) {
            request.setAttribute("register", new Register());
        }
        applyFlashMessage(request);
        loadListAndForward(request, response);
    }

    private void applyFlashMessage(HttpServletRequest request) {
        String msg = request.getParameter("msg");
        if (msg == null) return;
        switch (msg) {
            case "deleted":
                request.setAttribute("successMsg", "已删除该注册记录。");
                break;
            case "notfound":
                addError(request, "记录不存在或已被删除。");
                break;
            case "badid":
                addError(request, "无效的记录 ID。");
                break;
            case "dberr":
                addError(request, "删除失败：数据库错误。");
                break;
            default:
                break;
        }
    }

    private void addError(HttpServletRequest request, String msg) {
        @SuppressWarnings("unchecked")
        List<String> errors = (List<String>) request.getAttribute("errors");
        if (errors == null) {
            errors = new ArrayList<>();
            request.setAttribute("errors", errors);
        }
        errors.add(msg);
    }

    private void loadListAndForward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("registerList", dao.findAll());
        } catch (SQLException e) {
            request.setAttribute("registerList", List.of());
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors == null) {
                errors = new ArrayList<>();
                request.setAttribute("errors", errors);
            }
            errors.add("读取注册列表失败: " + e.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
        dispatcher.forward(request, response);
    }

    private List<String> validate(Register r, String againPassword) {
        List<String> errors = new ArrayList<>();
        if (r.getLogname().isEmpty()) {
            errors.add("用户名不能为空。");
        } else if (!LOGNAME_PATTERN.matcher(r.getLogname()).matches()) {
            errors.add("用户名必须由 3-20 位字母、数字或下划线组成。");
        }
        if (r.getPassword().isEmpty()) {
            errors.add("密码不能为空。");
        } else if (r.getPassword().length() < 6) {
            errors.add("密码长度至少 6 位。");
        }
        if (!r.getPassword().equals(againPassword)) {
            errors.add("两次输入的密码不一致。");
        }
        if (!r.getPhone().isEmpty() && !PHONE_PATTERN.matcher(r.getPhone()).matches()) {
            errors.add("联系电话格式不正确(7-15 位数字)。");
        }
        return errors;
    }

    private static String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
