<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<html>
<head>
    <title>删除教师信息</title>
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
    <h2>删除教师信息</h2>
    <p>确定要删除教师编号为 <%= request.getParameter("teacherNo") %> 的教师信息吗？</p>
    <form action="deleteTeacherAction.jsp" method="post">
        <input type="hidden" name="teacherNo" value="<%= request.getParameter("teacherNo") %>">
        <input type="submit" value="删除">
    </form>
    <a href="manageTeachers.jsp">返回教师列表</a>
</div>
</body>
</html>
