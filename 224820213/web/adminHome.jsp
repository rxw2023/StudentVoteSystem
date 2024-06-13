<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>管理员主页</title>
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
    <h2>管理员主页</h2>
    <p>管理员账号：<%=session.getAttribute("adminId")%></p>
    <a href="manageStudents.jsp">管理学生信息</a>
    <a href="manageTeachers.jsp">管理教师信息</a>
    <a href="viewVoteStats.jsp">查看投票统计</a>
    <a href="index.jsp?action=logout">退出登录</a>
</div>
</body>
</html>
