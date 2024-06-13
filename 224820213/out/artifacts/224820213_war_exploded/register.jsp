<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生注册</title>
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
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box; /* Ensure padding and border do not affect element width */
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            cursor: pointer; /* Indicate that the element can be clicked */
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>学生注册</h2>
    <form action="registerAction.jsp" method="post">
        <label for="studentNo">学号：</label>
        <input type="text" id="studentNo" name="studentNo" required>

        <label for="name">姓名：</label>
        <input type="text" id="name" name="name" required>

        <label for="gender">性别：</label>
        <select id="gender" name="gender">
            <option value="male">男</option>
            <option value="female">女</option>
        </select>

        <label for="password">密码：</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="注册">
    </form>
</div>
</body>
</html>
