<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<%
    String studentNo = request.getParameter("studentNo");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String password = request.getParameter("password");
    // 插入注册信息到数据库
    Connection conn = null;
    PreparedStatement ps = null;
    try {
        conn = DBUtil.getConnection();
        String sql = "INSERT INTO t_student (studentNo, name, gender, password) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, studentNo);
        ps.setString(2, name);
        ps.setString(3, gender);
        ps.setString(4, password);
        ps.executeUpdate();

        // 输出注册成功提示
%>
<div class="success-container">
    <h1>注册成功！</h1>
    <a href="index.jsp">返回登录</a>
</div>
<%
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        // 关闭连接
    }
%>

<style>
    .success-container {
        text-align: center;
        margin-top: 20px;
    }

    .success-container h1 {
        color: #4CAF50;
    }

    .success-container a {
        color: #333;
        text-decoration: none;
    }
</style>


