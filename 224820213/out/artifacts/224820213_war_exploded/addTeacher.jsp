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
    <h1>欢迎进入教师管理系统</h1>
    <h2>添加教师信息</h2>
    <form action="addTeacherAction.jsp" method="post">
        <label for="teacherNo">教师编号：</label>
        <input type="text" id="teacherNo" name="teacherNo" required><br><br>

        <label for="teacherName">教师姓名：</label>
        <input type="text" id="teacherName" name="teacherName" required><br><br>

        <label for="teacherVote">教师票数：</label>
        <input type="text" id="teacherVote" name="vote" required><br><br>

        <input type="submit" value="添加">
    </form>
    <a href="manageTeachers.jsp">返回教师列表</a>
</div>
</body>
</html>
