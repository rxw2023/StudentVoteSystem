<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>管理教师信息</title>
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
            max-width: 800px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>欢迎进入学生投票系统</h1>
    <h2>管理教师信息</h2>
    <%
        // 查询教师信息
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM t_vote";
            rs = stmt.executeQuery(sql);

            // 显示教师信息表格
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>教师编号</th>");
            out.println("<th>教师姓名</th>");
            out.println("<th>操作</th>");
            out.println("</tr>");
            while (rs.next()) {
                String teacherNo = rs.getString("teacherno");
                String teacherName = rs.getString("teachername");
                out.println("<tr>");
                out.println("<td>" + teacherNo + "</td>");
                out.println("<td>" + teacherName + "</td>");
                out.println("<td>");
                out.println("<a href='editTeacher.jsp?teacherNo=" + teacherNo + "'>编辑</a> ");
                out.println("<a href='deleteTeacher.jsp?teacherNo=" + teacherNo + "'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");
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
            if (stmt != null) {
                try {
                    stmt.close();
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

    <br>
    <a href="addTeacher.jsp">添加教师</a>
    <br>
    <a href="adminHome.jsp">返回管理员主页</a>
</div>
</body>
</html>
