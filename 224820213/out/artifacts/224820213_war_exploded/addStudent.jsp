<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>添加学生信息</title>
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
    <h2>添加学生信息</h2>
    <form action="addStudentAction.jsp" method="post">
        <label for="studentNo">学号：</label>
        <input type="text" id="studentNo" name="studentNo" required><br><br>

        <label for="name">姓名：</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="gender">性别：</label>
        <input type="text" id="gender" name="gender" required><br><br>

        <label for="password">密码：</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="添加">
    </form>
    <a href="manageStudents.jsp">返回学生列表</a>
</div>
</body>
</html>

