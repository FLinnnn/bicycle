<%--
  Created by IntelliJ IDEA.
  User: FLin
  Date: 2020/1/10
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册</title>
    <style type="text/css">
        #apDiv1 {
            position: absolute;
            width: 550px;
            height: 650px;
            z-index: 1;
            left: 764px;
            top: 72px;
        }
    </style>
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body background="images/zhuCebg.png">
<div id="apDiv1">
    <form id="registerform" action="" method="post" accept-charset="utf-8">
        <table width="550" height="651" border="0" cellpadding="0" cellspacing="0">
            <caption>
                <h2 align="left" style="color:#0FF">新用户注册</h2>
            </caption>
        </table>
        <div align="left"></div>
        <table width="550" height="651" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th scope="col">&nbsp;</th>
                <th scope="col">
                    <div align="right">
                        <h6>
                            <button type="button" id="gologin" class="btn btn-link">已拥有账号？点击登录</button>
                        </h6>
                    </div>
                </th>
            </tr>
            <tr>
                <td width="313">
                    <div id="usernameclass" class="form-group">
                        <label for="usernameinput">用户名</label>
                        <input type="text" class="form-control" id="usernameinput" name="username"
                               placeholder=">请输入用户名">
                        <span class="help-block"></span>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<div hidden id="usernamedivc"><span class="glyphicon glyphicon-remove"
                                                                                aria-hidden="true"
                                                                                style="color: red"></span></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="passwordclass" class="form-group">
                        <label for="passwordinput">密&nbsp;&nbsp;&nbsp;码</label>
                        <input type="text" class="form-control" name="password" id="passwordinput" placeholder=">请输入密码">
                        <span class="help-block"></span>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<div hidden id="passworddivc"><span class="glyphicon glyphicon-remove"
                                                                                aria-hidden="true"
                                                                                style="color: red"></span></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="nameclass" class="form-group">
                        <label for="nameinput">昵&nbsp;&nbsp;&nbsp;称</label>
                        <input type="text" class="form-control" name="uname" id="nameinput" placeholder=">请输入昵称">
                        <span class="help-block"></span>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<div hidden id="namedivc"><span class="glyphicon glyphicon-remove"
                                                                            aria-hidden="true"
                                                                            style="color: red"></span></div>
                </td>

            </tr>
            <tr>
                <td>
                    <div id="birthdayclass" class="form-group">
                        <label for="birthdayinput">生&nbsp;&nbsp;&nbsp;日</label><br>
                        <input type="date" id="birthdayinput" name="birthday" placeholder="年/月/日">
                        <span class="help-block"></span>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<span hidden id="birthdaydivc"><span class="glyphicon glyphicon-remove"
                                                                                 aria-hidden="true"
                                                                                 style="color: red"></span></span></td>
            </tr>
            <tr>
                <td>
                    <div>
                        <label for="sexinput" class="form-group">性&nbsp;&nbsp;&nbsp;别</label><br>
                        <input type="radio" id="sexinput" name="sex" value="1" class="radio-inline" checked> 男
                        <input type="radio" name="sex" class="radio-inline" value="0"> 女
                    </div>
                    <br></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<div hidden><span class="glyphicon glyphicon-remove" aria-hidden="true"
                                                              style="color: red"></span></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="telephoneclass" class="form-group">
                        <label for="telephoneinput">电&nbsp;&nbsp;&nbsp;话</label>
                        <input type="text" class="form-control" name="telephone" id="telephoneinput"
                               placeholder=">请输入电话号码">
                        <span class="help-block"></span>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<div hidden id="telephonedivc"><span class="glyphicon glyphicon-remove"
                                                                                 aria-hidden="true"
                                                                                 style="color: red"></span></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="emailclass" class="form-group">
                        <label for="emailinput">邮&nbsp;&nbsp;&nbsp;箱</label>
                        <input type="text" class="form-control" name="email" id="emailinput" placeholder=">请输入电子邮箱">
                        <span class="help-block"></span>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<div hidden id="emaildivc"><span class="glyphicon glyphicon-remove"
                                                                             aria-hidden="true"
                                                                             style="color: red"></span></div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <button type="button" class="btn btn-info btn-lg" id="submitbtn" >注册</button>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><br>
                    <div class="alert alert-danger" role="alert" hidden id="errorspan">

                    </div>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <div id="welc" class="alert alert-success" role="alert" hidden>信息填写正确<span
                            class="glyphicon glyphicon-ok" style="color: green" aria-hidden="true"></span></div>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</div>
</body>
<script>

    function checkusername() {
        var username = $("#usernameinput").val();
        var reg_username = /^\w{4,20}$/;
        var flag = reg_username.test(username);
        if (flag) {
            $("#usernameclass").attr("class", " has-success ");
            $("#usernamedivc").prop("hidden", true);
        } else {
            $("#usernameclass").attr("class", "has-error");
            $("#usernamedivc").prop("hidden", false);
        }
        return flag;
    }

    function checkpassword() {
        var password = $("#passwordinput").val();
        var reg_password = /^\w{4,20}$/;
        var flag = reg_password.test(password);
        if (flag) {
            $("#passwordclass").attr("class", " has-success ");
            $("#passworddivc").prop("hidden", true);
        } else {
            $("#passwordclass").attr("class", "has-error ");
            $("#passworddivc").prop("hidden", false);
        }
        return flag;
    }

    function checkname() {
        var name = $("#nameinput").val();
        if (name) {
            $("#nameclass").attr("class", " has-success ");
            $("#namedivc").prop("hidden", true);
            return true
        } else {
            $("#nameclass").attr("class", "has-error ");
            $("#namedivc").prop("hidden", false);
            return false
        }
    }

    function checkbirthday() {
        var birthday = $("#birthdayinput").val();

        if (birthday) {
            $("#birthdayclass").attr("class", " has-success");
            $("#birthdaydivc").prop("hidden", true);
            return true
        } else {
            $("#birthdayclass").attr("class", "has-error");
            $("#birthdaydivc").prop("hidden", false);
            return false
        }
    }

    function checktelephone() {
        var telephone = $("#telephoneinput").val();
        var reg_telephone = /^\w{11}$/;
        var flag = reg_telephone.test(telephone);
        if (flag) {
            $("#telephoneclass").attr("class", "has-success");
            $("#telephonedivc").prop("hidden", true);
        } else {
            $("#telephoneclass").attr("class", "has-error");
            $("#telephonedivc").prop("hidden", false);
        }
        return flag;
    }

    function checkemail() {
        var email = $("#emailinput").val();
        var reg_email = /^\w+@\w+\.\w+$/;
        var flag = reg_email.test(email);
        if (flag) {
            $("#emailclass").attr("class", "has-success");
            $("#emaildivc").prop("hidden", true);
        } else {
            $("#emailclass").attr("class", "has-error");
            $("#emaildivc").prop("hidden", false);
        }
        return flag;
    }
    function allok() {
        if (checkusername() && checkpassword() && checkname() && checkbirthday() && checktelephone() && checkemail()) {
            $("#welc").prop("hidden", false);
            $("#submitbtn").attr("disabled", false);
        }
    }
    $("#usernameinput").blur(checkusername)
    $("#passwordinput").blur(checkpassword)
    $("#nameinput").blur(checkname)
    $("#birthdayinput").blur(checkbirthday)
    $("#telephoneinput").blur(checktelephone)
    $("#emailinput").blur(checkemail)
    $("#usernameinput").change(function () {
        var username = $("#usernameinput").val();
        var reg_username = /^\w{4,20}$/;
        var flag = reg_username.test(username);
        if (!flag) {
            $("#usernameinput").parent().removeClass("has-success has-error");
            $("#usernameinput").next("span").text("");
            $("#usernameinput").parent().addClass("has-error");
            $("#usernameinput").next("span").text("用户名格式错误");
            $("#submitbtn").attr("ajax-username", "error");
            return
        }
        $.ajax({
            url: "${APP_PATH}/checknewyhusername",
            data: "username=" + username,
            type: "POST",
            success: function (result) {
                if (result.code == 200) {
                    $("#usernameinput").parent().removeClass("has-success has-error");
                    $("#usernameinput").next("span").text("");
                    $("#usernameinput").parent().addClass(" has-success ");
                    $("#usernameinput").next("span").text("用户名可用");
                    $("#submitbtn").attr("ajax-username", "success");
                } else {
                    $("#usernameinput").parent().removeClass("has-success has-error");
                    $("#usernameinput").next("span").text("");
                    $("#usernameinput").parent().addClass("has-error");
                    $("#usernameinput").next("span").text("用户名重复");
                    $("#submitbtn").attr("ajax-username", "error");
                }
            }
        })
    });
    $("#submitbtn").click(function () {
        allok();
        if ($(this).attr("ajax-username") == "error") {
            return
        }
        $.post("yh", $("#registerform").serialize(), function (data) {
            if (data.code == 200) {
                location.href = "mainYH.jsp"
            } else {
                $("#errorspan").html(data.msg).show();
                $("#usernameclass").attr("class", "has-error");
                $("#usernamedivc").prop("hidden", false);
            }
        })

    })
    $("#gologin").click(function () {
        location.href = "login.jsp"
    })





</script>
</html>
