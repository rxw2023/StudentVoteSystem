<%@ page language="java" contentType="image/jpeg" %>
<%@ page import="java.awt.*,java.awt.image.*,javax.imageio.*,java.util.*,java.io.*" %>
<%
    int width = 150;
    int height = 50;
    BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

    Graphics2D g2d = bufferedImage.createGraphics();
    g2d.setColor(Color.WHITE);
    g2d.fillRect(0, 0, width, height);

    g2d.setFont(new Font("Arial", Font.BOLD, 24));
    String captcha = UUID.randomUUID().toString().substring(0, 6);
    request.getSession().setAttribute("captcha", captcha);

    g2d.setColor(Color.BLACK);
    g2d.drawString(captcha, 20, 35);

    g2d.dispose();

    response.setContentType("image/jpeg");
    OutputStream os = response.getOutputStream();
    ImageIO.write(bufferedImage, "jpeg", os);
    os.close();
%>
