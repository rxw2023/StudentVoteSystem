<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>开始登录</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-image: url("img/b.jpg");
      background-repeat: no-repeat;
      background-size: cover;
    }
    .container {
      max-width: 400px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1, h2 {
      color: #333;
      text-align: center;
    }
    form {
      margin-top: 20px;
    }
    label {
      display: block;
      margin-bottom: 5px;
      color: #555;
    }
    input[type="text"], input[type="password"], input[type="submit"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 4px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #45a049;
    }
    a {
      display: block;
      text-align: center;
      margin-top: 10px;
      text-decoration: none;
      color: #333;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>欢迎进入学生投票系统</h1>
  <h2>学生登录</h2>
  <form action="loginAction.jsp" method="post">
    <label for="studentNo">学号：</label>
    <input type="text" id="studentNo" name="studentNo" required>

    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required>

    <label for="captcha">验证码：</label>
    <input type="text" id="captcha" name="captcha" required>
    <img src="captcha.jsp" alt="Captcha Image"><br><br>

    <input type="submit" value="登录">
  </form>
  <a href="register.jsp">学生注册</a>
  <a href="adminLogin.jsp">管理员登录</a>
</div>
</body>
</html>

