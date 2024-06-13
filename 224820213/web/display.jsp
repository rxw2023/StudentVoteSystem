<%@ page language="java" import="java.sql.*, Dao.DBUtil" pageEncoding="UTF-8"%>
<html>
<head>
    <title>教师票数统计</title>
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
            background-image: url("img/b1.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        table {
            width: 60%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        caption {
            font-size: 1.5em;
            margin: 10px 0;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f8f8f8;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:nth-child(odd) {
            background-color: #ececec;
        }
        .vote-bar {
            height: 15px;
            background-color: #FF0000;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .exit-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<table>
    <caption>欢迎给老师投票</caption>
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>得票数</th>
        <th>投票</th>
    </tr>
    <%
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            stat = conn.createStatement();
            String sql = "SELECT * FROM t_vote";
            rs = stat.executeQuery(sql);
            while (rs.next()) {
                String teacherno = rs.getString("teacherno");
                String teachername = rs.getString("teachername");
                int vote = rs.getInt("vote");
    %>
    <tr>
        <td><%= teacherno %></td>
        <td><%= teachername %></td>
        <td>
            <div class="vote-bar" style="width:<%= vote %>px"></div>
            <%= vote %>
        </td>
        <td><a href="vote.jsp?teacherno=<%= teacherno %>">投票</a></td>
    </tr>
    <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stat != null) {
                try {
                    stat.close();
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
    <tr>
        <td colspan="4">
            <div class="exit-link">
                <a href="index.jsp">退出投票</a>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
