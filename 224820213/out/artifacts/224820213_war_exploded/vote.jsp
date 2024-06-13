<%@ page language="java" import="java.sql.*, Dao.DBUtil" pageEncoding="UTF-8"%>
<html>
<head>
  <title>投票</title>
</head>
<body>
<%
  String teacherno = request.getParameter("teacherno");
  Connection conn = null;
  PreparedStatement ps = null;

  try {
    conn = DBUtil.getConnection();
    String sql = "UPDATE t_vote SET vote = vote + 1 WHERE teacherno = ?";
    ps = conn.prepareStatement(sql);
    ps.setString(1, teacherno);
    ps.executeUpdate();
  } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
  } finally {
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
<jsp:forward page="display.jsp"></jsp:forward>
</body>
</html>
