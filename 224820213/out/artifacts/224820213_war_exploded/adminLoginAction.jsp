<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>管理员登录失败</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1, h2 {
            color: #333;
        }
        .error {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>欢迎进入学生投票系统</h1>
    <h2>管理员登录</h2>
    <form action="adminLoginAction.jsp" method="post">
        <label for="adminId">管理员账号：</label>
        <input type="text" id="adminId" name="adminId" required><br><br>

        <label for="password">密码：</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="登录">
    </form>
    <a href="index.jsp">学生登录</a>
    <%
        String adminId = request.getParameter("adminId");
        String password = request.getParameter("password");

        if (adminId != null && password != null) {
            // 验证管理员账号和密码
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = DBUtil.getConnection();
                String sql = "SELECT * FROM t_admin WHERE adminId = ? AND password = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, adminId);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    // 登录成功
                    session.setAttribute("adminId", adminId);
                    response.sendRedirect("adminHome.jsp");
                } else {
                    // 登录失败
                    out.println("<div class='error'>管理员账号或密码错误，请重试</div>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                // 关闭连接
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    %>
</div>
</body>
</html>
