<%--
  Created by IntelliJ IDEA.
  User: FLin
  Date: 2020/1/20
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>添加租赁点</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">添加租赁点</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="mainGLY.jsp">主页<span class="sr-only">(current)</span></a></li>
                <li ><a href="#" id="GLYbicyclebtn">车辆管理</a></li>
                <li><a href="#" id="GLYjiehuanbtn">订单管理</a></li>
                <li><a href="#" id="GLYErrbtn">维护管理</a></li>
                <li><a href="#" id="GLYyhListbtn">用户管理</a></li>
                <li ><a href="#" id="GLYZLDFENPEIbtn">管理员分配</a></li>
                <li class="active"><a href="#" id="GLYADDZLDGLYbtn">添加租赁点</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="GLYFLBIC"><span class="glyphicon glyphicon-leaf" aria-hidden="true" ></span>自行车分类</a></li>
                        <li><a href="#" id="GLYZLDBIC"><span class="glyphicon glyphicon-search" aria-hidden="true" ></span>租赁点分类</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Hi~${sessionScope.gly.adminusername}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">打印<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="GLYEXCELbicycle"><span class="glyphicon glyphicon-user"
                                                                   aria-hidden="true"></span>打印车辆</a></li>
                        <li><a href="#" id="GLYEXCELcategory"><span class="glyphicon glyphicon-user"
                                                                    aria-hidden="true"></span>打印分类</a></li>
                        <li><a href="#" id="GLYEXCELErr"><span class="glyphicon glyphicon-wrench"
                                                               aria-hidden="true"></span>打印维护</a></li>
                        <li><a href="#" id="GLYjiehuanExcelbtn"><span class="glyphicon glyphicon-floppy-save"
                                                                      aria-hidden="true"></span>打印订单</a></li>
                        <li><a href="#" id="GLYEXCELYH"><span class="glyphicon glyphicon-wrench"
                                                              aria-hidden="true"></span>打印用户</a></li>
                        <li><a href="#" id="GLYEXCELZLD"><span class="glyphicon glyphicon-wrench"
                                                               aria-hidden="true"></span>打印租赁点</a></li>
                        <li><a href="#" id="GLYEXCELZLDGLY"><span class="glyphicon glyphicon-wrench"
                                                                  aria-hidden="true"></span>打印租赁点管理员</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" id="exitGLY"><span class="glyphicon glyphicon-log-out"
                                                           aria-hidden="true"></span>退出登陆</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form action="${APP_PATH}/zldupload"  enctype="multipart/form-data" method="post">
    编号：<input type="text" name="bianhao" ><br>
    名称：<input type="text" name="mingcheng"><br>
    地点：<input type="text" name="didian"><br>
    租赁点图片:<input name="zldimage" type="file"><br>
    <button type="submit">提交</button>
</form>
<a href="zixingchexinxibiao.xlsx" download="自行车信息表.xlsx"  id="zixingchexinxibiao" hidden>自行车信息表</a>
<a href="fenleixinxibiao.xlsx" download="分类信息表.xlsx"  id="fenleixinxibiao" hidden>分类信息表</a>
<a href="weihuxinxibiao.xlsx" download="维护信息表.xlsx"  id="weihuxinxibiao" hidden>维护信息表</a>
<a href="dingdanbiao.xlsx" download="订单表.xlsx"  id="dingdanbiao" hidden>订单表</a>
<a href="yhbiao.xlsx" download="用户表.xlsx"  id="yhbiao" hidden>用户表</a>
<a href="zldbiao.xlsx" download="租赁点表.xlsx"  id="zldbiao" hidden>租赁点表</a>
<a href="zldglybiao.xlsx" download="租赁点管理员表.xlsx"  id="zldglybiao" hidden>租赁点管理员表</a>
</body>
<script>

    $("#GLYbicyclebtn").click(function () {
        location.href = "GLYbicycle.jsp"
    })
    $("#GLYjiehuanbtn").click(function () {
        location.href = "GLYjiehuan.jsp"
    })
    $("#GLYErrbtn").click(function () {
        location.href = "GLYErr.jsp"
    })
    $("#GLYyhListbtn").click(function () {
        location.href = "GLYyhList.jsp"
    })
    $("#GLYZLDFENPEIbtn").click(function () {
        location.href = "GLYzldglyList.jsp"
    })
    $("#GLYADDZLDGLYbtn").click(function () {
        location.href = "GLYaddzld.jsp"
    })
    $("#GLYFLBIC").click(function () {
        location.href = "GLYFLbicycle.jsp"
    })
    $("#GLYZLDBIC").click(function () {
        location.href = "GLYZLDbicycle.jsp"
    })

    $("#GLYEXCELbicycle").click(function () {
        $.ajax({
            url: "${APP_PATH}/bicycleExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("zixingchexinxibiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#GLYEXCELcategory").click(function () {
        $.ajax({
            url: "${APP_PATH}/categoryExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("fenleixinxibiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#GLYEXCELErr").click(function () {
        $.ajax({
            url: "${APP_PATH}/errExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("weihuxinxibiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })

    $("#GLYEXCELYH").click(function () {
        $.ajax({
            url: "${APP_PATH}/yhExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("yhbiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#GLYEXCELZLD").click(function () {
        $.ajax({
            url: "${APP_PATH}/zldExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("zldbiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#GLYEXCELZLDGLY").click(function () {
        $.ajax({
            url: "${APP_PATH}/zldglyExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("zldglybiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#GLYjiehuanExcelbtn").click(function () {
        $.ajax({
            url: "${APP_PATH}/jiehuandingdanExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("dingdanbiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#exitGLY").click(function () {
            exitGLY()
        }
    )

    function exitGLY() {
        $.ajax({
            url: "${APP_PATH}/exitGLY",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("欢迎下次使用");
                    location.href = "login.jsp"
                }
            }
        })
    }
</script>
</html>
