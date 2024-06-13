<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>编辑教师信息</title>
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
    <h1>欢迎进入教师管理系统</h1>
    <h2>编辑教师信息</h2>
    <%
        String teacherNo = request.getParameter("teacherNo");
        String teacherName = "";

        // 从数据库获取教师信息
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM t_vote WHERE teacherNo = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, teacherNo);
            rs = ps.executeQuery();
            if (rs.next()) {
                teacherName = rs.getString("teacherName");
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
    %>
    <form action="editTeacherAction.jsp" method="post">
        <input type="hidden" name="teacherNo" value="<%= teacherNo %>">
        <label for="teacherName">教师姓名：</label>
        <input type="text" id="teacherName" name="teacherName" value="<%= teacherName %>" required><br><br>

        <input type="submit" value="保存">
    </form>
    <a href="manageTeachers.jsp">返回教师列表</a>
</div>
</body>
</html>
