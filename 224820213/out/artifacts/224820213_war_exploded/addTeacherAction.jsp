<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>添加教师信息</title>
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
    <h2>添加教师信息</h2>
    <%
        String teacherNo = request.getParameter("teacherNo");
        String teacherName = request.getParameter("teacherName");
        String vote = request.getParameter("vote");

        // 插入教师信息到数据库
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO t_vote (teacherNo, teacherName,vote) VALUES (?, ?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, teacherNo);
            ps.setString(2, teacherName);
            ps.setString(3,vote);
            ps.executeUpdate();
            ps.close();
            conn.close();
            out.println("<p>教师信息添加成功。</p>");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>教师信息添加失败。</p>");
        } finally {
            // 关闭连接
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
    %>
    <a href="manageTeachers.jsp">返回教师列表</a>
</div>
</body>
</html>
