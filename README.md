# 学生投票管理系统

## 相关配置

1.使用的JDK版本：JDK1.8.0_152

2.使用的本地服务器版本：TOMCAT8.5.98

3.使用的java编译器：IDEA2021.3.3

4.使用的数据库管理系统：Navicat

5.使用的数据库版本：MySQL5.7

## 实现目标

1、制作一个投票系统，让学生给自己喜爱的老师投票。该系统由投票界面组成，系统运行后出现投票界面，标题为“欢迎给老师投票”。在界面上有一个表格，显示了各位老师的编号、姓名、得票数；其中，得票数显示为一个红色的进度条，并显示得票的数值，增加一个投票表t_vote(老师编号、老师姓名、老师票数)。

2、限定学生给教师投票，学生只有注册后，再登录,才能给相关的教师投票。因此要增加一个注册、登陆模块，增加一个学生表t_student（学号、姓名、性别、密码)。

3、增加管理员功能，管理员在后台对学生进行管理（增、删、改、查）和教师进行管理（增、删、改、查等）操作，增加一张管理员表t_admin（管理员账号、密码）。

4、管理员可以查看统计所有教师的票数。

5、登录中有验证码功能。
