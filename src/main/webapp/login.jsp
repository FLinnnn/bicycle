<%--
  Created by IntelliJ IDEA.
  User: FLin
  Date: 2020/1/9
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <meta charset="utf-8">
    <title>自行车租赁管理系统登录页面</title>
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
    #apDiv1 {
	position: absolute;
	width: 512px;
	height: 619px;
	z-index: 1;
	left: 1068px;
	top: 1px;
}
    #bg {
	position: absolute;
	width: 1920px;
	height: 1080px;
	z-index: 1;
	background-image: url(images/loginbackground.jpg);
	left: 0px;
	top: 0px;
}
    body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
    #login {
	position: absolute;
	width: 499px;
	height: 472px;
	z-index: 2;
	left: 1113px;
	top: 440px;
}
    #apDiv2 {
	position: absolute;
	width: 495px;
	height: 115px;
	z-index: 3;
	left: 1113px;
	top: 343px;
}
    </style>
<script>
    $(function () {
        $("#ZHUCEANNIU").click(function () {
            location.href="zhuCe.jsp"
        })
        $("#YH").click(function () {
            $.post("yhlogin",$("#loginForm").serialize(),function (data) {
                if(data.code==200){
                    $("#loginForm").attr("class","has-success");
                    location.href="mainYH.jsp"
                }else{
                    $("#ErrorSpan").html("用户名或密码错误！").show();
                    $("#loginForm").attr("class","has-error");
                }
            })

        })
        $("#ZLD").click(function () {
            $.post("zldglylogin",$("#loginForm").serialize(),function (data) {
                if(data.code==200){
                    $("#loginForm").attr("class","has-success");

                    location.href="mainZLD.jsp"
                }else{
                    $("#ErrorSpan").html("用户名或密码错误！").show()
                    $("#loginForm").attr("class","has-error");
                }
            })

        })
        $("#GLY").click(function () {
            $.post("glylogin",$("#loginForm").serialize(),function (data) {
                if(data.code==200){
                    $("#loginForm").attr("class"," has-success");
                    location.href="mainGLY.jsp"
                }else{
                    $("#ErrorSpan").html("用户名或密码错误！").show()
                    $("#loginForm").attr("class","has-error");
                }
            })

        })
    })
</script>
</head>
<body>
<div id="apDiv2" ><h1 align="center" style="color:#FF00FF">西安市自行车租赁与管理系统</h1></div>
<div id="bg"></div>
<div id="login">
    <form id="loginForm" action="" method="post" accept-charset="utf-8">
  <div class="form-group">
    <label for="usernameinput" id="userlabel" class="control-label">账户</label>
    <input  name="username" class="form-control" id="usernameinput"    placeholder=">请输入你的用户名">
  </div>
  <div class="form-group">
    <label for="passwordinput" id="pwdlabel" class="control-label">密码</label>
    <input  name="password" class="form-control" id="passwordinput"  placeholder=">请输入你的密码">
  </div>
        <br>
        <div class="btn-group" role="group" aria-label="..." >
            <button type="button" class="btn btn-info" id="YH">以普通用户登录</button>
            <button type="button" class="btn btn-warning" id="ZLD">以租赁管理登录</button>
            <button type="button" class="btn btn-danger" id="GLY" >以系统管理登录</button>
            <button type="button" class="btn btn-success" id="ZHUCEANNIU" >进行新用户注册</button>
        </div>
        <br>
        <br>

        <div class="alert alert-danger" id="ErrorSpan" role="alert" hidden></div>
</form>
</div>

</body>
</html>