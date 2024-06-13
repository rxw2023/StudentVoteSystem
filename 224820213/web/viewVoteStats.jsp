<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Dao.DBUtil" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>查看投票统计</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        a {
            display: block;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>欢迎进入学生投票系统</h1>
    <h2>投票统计</h2>
    <%!
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
    %>
    <%-- 获取数据库连接 --%>
    <%
        conn = DBUtil.getConnection();
    %>
    <%-- 查询教师的票数统计信息 --%>
    <%
        String sql = "SELECT teacherName, SUM(vote) as voteCount FROM t_vote GROUP BY teacherName";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
    %>
    <%-- 保存教师的票数统计信息 --%>
    <%
        List<String[]> voteCountList = new ArrayList<>();
        while (rs.next()) {
            String teacherName = rs.getString("teacherName");
            int voteCount = rs.getInt("voteCount");
            String[] voteCountInfo = {teacherName, String.valueOf(voteCount)};
            voteCountList.add(voteCountInfo);
        }
    %>
    <%-- 显示教师的票数统计信息 --%>
    <table>
        <tr>
            <th>教师姓名</th>
            <th>票数</th>
        </tr>
        <%
            for (String[] voteCountInfo : voteCountList) {
                String teacherName = voteCountInfo[0];
                String voteCount = voteCountInfo[1];
        %>
        <tr>
            <td><%= teacherName %></td>
            <td><%= voteCount %></td>
        </tr>
        <% } %>
    </table>
    <%-- 关闭数据库连接和释放资源 --%>
    <%
        rs.close();
        stmt.close();
        conn.close();
    %>
    <a href="adminHome.jsp">返回管理员主页</a>
</div>
</body>
</html>
