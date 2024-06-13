<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>管理学生信息</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
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
    <h2>管理学生信息</h2>
    <table>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>密码</th>
            <th>操作</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = DBUtil.getConnection();
                String sql = "SELECT * FROM t_student";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String studentNo = rs.getString("studentNo");
                    String name = rs.getString("name");
                    String gender = rs.getString("gender");
                    String password = rs.getString("password");
        %>
        <tr>
            <td><%= studentNo %></td>
            <td><%= name %></td>
            <td><%= gender %></td>
            <td><%= password %></td>
            <td>
                <a href="editStudent.jsp?studentNo=<%= studentNo %>">编辑</a>
                <a href="deleteStudent.jsp?studentNo=<%= studentNo %>">删除</a>
            </td>
        </tr>
        <%
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
    </table>
    <a href="addStudent.jsp">添加学生</a>
    <a href="adminHome.jsp">返回管理员主页</a>
</div>
</body>
</html>

