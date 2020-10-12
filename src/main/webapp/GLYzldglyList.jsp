<%--
  Created by IntelliJ IDEA.
  User: FLin
  Date: 2020/1/16
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js">

    </script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js">

    </script>

    <title>租赁点管理员调控列表</title>

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
            <a class="navbar-brand" href="#">管理员分配</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="mainGLY.jsp">主页<span class="sr-only">(current)</span></a></li>
                <li ><a href="#" id="GLYbicyclebtn">车辆管理</a></li>
                <li><a href="#" id="GLYjiehuanbtn">订单管理</a></li>
                <li><a href="#" id="GLYErrbtn">维护管理</a></li>
                <li><a href="#" id="GLYyhListbtn">用户管理</a></li>
                <li class="active"><a href="#" id="GLYZLDFENPEIbtn">管理员分配</a></li>
                <li><a href="#" id="GLYADDZLDGLYbtn">添加租赁点</a></li>
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
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>租赁点管理员
                <small>分配管理</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-success" id="zldgly_add_modal_btn"><span class="glyphicon glyphicon-plus"
                                                                            aria-hidden="true"></span>新增
            </button>
            <button class="btn btn-danger" id="zldgly_delect_all_btn"><span class="glyphicon glyphicon-scissors" aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="zldglytables">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>昵称</th>
                    <th>生日</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>邮箱</th>
                    <th>租赁点</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
<!-- 租赁点管理员添加的模态框 -->
<div class="modal fade" id="zldglyAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">租赁点管理员添加表单</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="savenewzldgly">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="username_add_input"
                                   placeholder=">请输入用户名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="password" class="form-control" id="password_add_input"
                                   placeholder=">请输入密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name_add_input"
                                   placeholder=">请输入昵称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="birthday_add_input" name="birthday"
                                   placeholder="年/月/日">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="gender1_add_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="gender2_add_input" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="telephone" class="form-control" id="telephone_add_input"
                                   placeholder=">请输入电话号码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder=">请输入电子邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">租赁点</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="zid"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="zldglysavebtn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 租赁点管理员修改的模态框 -->
<div class="modal fade" id="zldglyUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">租赁点管理员修改表单</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updatezldgly">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="username_update_input"
                                   placeholder=">请输入用户名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="password" class="form-control" id="password_update_input"
                                   placeholder=">请输入密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name_update_input"
                                   placeholder=">请输入昵称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="birthday_update_input" name="birthday"
                                   placeholder="年/月/日">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="gender1_update_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="gender2_update_input" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="telephone" class="form-control" id="telephone_update_input"
                                   placeholder=">请输入电话号码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder=">请输入电子邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">租赁点</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="zid"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" id="zldgly_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<a href="zixingchexinxibiao.xlsx" download="自行车信息表.xlsx"  id="zixingchexinxibiao" hidden>自行车信息表</a>
<a href="fenleixinxibiao.xlsx" download="分类信息表.xlsx"  id="fenleixinxibiao" hidden>分类信息表</a>
<a href="weihuxinxibiao.xlsx" download="维护信息表.xlsx"  id="weihuxinxibiao" hidden>维护信息表</a>
<a href="dingdanbiao.xlsx" download="订单表.xlsx"  id="dingdanbiao" hidden>订单表</a>
<a href="yhbiao.xlsx" download="用户表.xlsx"  id="yhbiao" hidden>用户表</a>
<a href="zldbiao.xlsx" download="租赁点表.xlsx"  id="zldbiao" hidden>租赁点表</a>
<a href="zldglybiao.xlsx" download="租赁点管理员表.xlsx"  id="zldglybiao" hidden>租赁点管理员表</a>
</body>
<script>
    var totalRecord;
    var currentPage;
    $(function () {
        to_page(1);
    });

    function getzldlist(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/zld",
            type: "GET",
            success: function (result) {
                // $("#zldglyAddModal select").append("")
                $.each(result.extend.zldlist, function () {
                    var optionEle = $("<option></option>").append(this.mingcheng).attr("value", this.zldid);
                    optionEle.appendTo(ele)
                })
            }
        })
    }

    function build_zldgly_table(result) {
        $("#zldglytables tbody").empty();
        var zldglyCRUD = result.extend.pageInfo.list;
        $.each(zldglyCRUD, function (index, item) {
            var checkboxtd = $("<td><input type='checkbox' class='check_item'></td>");
            var zldglyidtd = $("<td></td>").append(item.zldglyid);
            var usernametd = $("<td></td>").append(item.username);
            var passwordtd = $("<td></td>").append(item.password);
            var nametd = $("<td></td>").append(item.name);
            var birthdaytd = $("<td></td>").append(item.birthday);
            var sextd = $("<td></td>").append(item.sex);
            var telephonetd = $("<td></td>").append(item.telephone);
            var emailtd = $("<td></td>").append(item.email);
            var zldmingchengtd = $("<td></td>").append(item.zld.mingcheng);

            var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editbtn.attr("edit-id", item.zldglyid);
            var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delbtn.attr("delete-id", item.zldglyid);
            var btntd = $("<td></td>").append(editbtn).append(delbtn);
            $("<tr></tr>").append(checkboxtd).append(zldglyidtd).append(usernametd)
                .append(passwordtd).append(nametd)
                .append(birthdaytd).append(sextd)
                .append(telephonetd).append(emailtd)
                .append(zldmingchengtd).append(btntd).appendTo("#zldglytables tbody")
        })
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 " + result.extend.pageInfo.pageNum + "页,总" + result.extend.pageInfo.pages + "页," +
            "总" + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum
    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled")
            prePageLi.addClass("disabled")
        } else {
            firstPageLi.click(function () {
                to_page(1)
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)
            })
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"))
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"))
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1)
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages)
            })
        }


        ul.append(firstPageLi).append(prePageLi)
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item))
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active")
            }
            numLi.click(function () {
                to_page(item)
            });
            ul.append(numLi)
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEla = $("<nav></nav>").append(ul);
        navEla.appendTo("#page_nav_area")
    }

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/zldglyCRUD",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_zldgly_table(result);
                build_page_info(result);
                build_page_nav(result)
            }
        })
    }

    function reset_from(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#zldgly_add_modal_btn").click(function () {
        reset_from("#zldglyAddModal form");
        // $("#zldglyAddModal form")[0].reset();
        getzldlist("#zldglyAddModal select");
        $("#zldglyAddModal").modal({
            backdrop: "static"
        })
    });

    function checkusername() {
        var username = $("#username_add_input").val();
        var reg_username = /^\w{3,20}$/;
        var flag = reg_username.test(username);
        $("#username_add_input").parent().removeClass("has-success has-error");
        $("#username_add_input").next("span").text("");
        if (flag) {

            $("#username_add_input").parent().addClass(" has-success ");
            $("#username_add_input").next("span").text("");
        } else {
            $("#username_add_input").parent().addClass("has-error");
            $("#username_add_input").next("span").text("用户名可以是2-5位的中文或是3-16位数字英文组合");

        }
        return flag;
    }

    function checkpassword() {
        var password = $("#password_add_input").val();
        var reg_password = /^\w{4,20}$/;
        var flag = reg_password.test(password);
        $("#password_add_input").parent().removeClass("has-success has-error");
        $("#password_add_input").next("span").text("");
        if (flag) {
            $("#password_add_input").parent().addClass(" has-success ");
            $("#password_add_input").next("span").text("");
        } else {
            $("#password_add_input").parent().addClass("has-error");
            $("#password_add_input").next("span").text("密码可以是4-20位数字英文组合");

        }
        return flag;
    }

    function checkname() {
        var name = $("#name_add_input").val();
        $("#name_add_input").parent().removeClass("has-success has-error");
        $("#name_add_input").next("span").text("");
        if (name) {
            $("#name_add_input").parent().addClass(" has-success ");
            $("#name_add_input").next("span").text("");
            return true;
        } else {
            $("#name_add_input").parent().addClass("has-error");
            $("#name_add_input").next("span").text("请输入昵称");
            return false;
        }
    }

    function checkbirthday() {
        var birthday = $("#birthday_add_input").val();
        $("#birthday_add_input").parent().removeClass("has-success has-error");
        $("#birthday_add_input").next("span").text("");
        if (birthday) {
            $("#birthday_add_input").parent().addClass(" has-success ");
            $("#birthday_add_input").next("span").text("");
            return true;
        } else {
            $("#birthday_add_input").parent().addClass("has-error");
            $("#birthday_add_input").next("span").text("请输入生日");
            return false;
        }
    }

    function checktelephone() {
        var telephone = $("#telephone_add_input").val();
        var reg_telephone = /^\w{11}$/;
        var flag = reg_telephone.test(telephone);
        $("#telephone_add_input").parent().removeClass("has-success has-error");
        $("#telephone_add_input").next("span").text("");
        if (flag) {
            $("#telephone_add_input").parent().addClass(" has-success ");
            $("#telephone_add_input").next("span").text("");
        } else {
            $("#telephone_add_input").parent().addClass("has-error");
            $("#telephone_add_input").next("span").text("请输入11位长度的手机号码");
        }
        return flag;
    }

    function checkemail() {
        var email = $("#email_add_input").val();
        var reg_email = /^\w+@\w+\.\w+$/;
        var flag = reg_email.test(email);
        $("#email_add_input").parent().removeClass("has-success has-error");
        $("#email_add_input").next("span").text("");
        if (flag) {
            $("#email_add_input").parent().addClass(" has-success ");
            $("#email_add_input").next("span").text("");
        } else {
            $("#email_add_input").parent().addClass("has-error");
            $("#email_add_input").next("span").text("请输入正确格式的电子邮箱");
        }
        return flag;
    }

    $("#username_add_input").change(function () {
        var username = $("#username_add_input").val();
        var reg_username = /^\w{3,20}$/;
        var flag = reg_username.test(username);
        if (!flag) {
            $("#username_add_input").parent().removeClass("has-success has-error");
            $("#username_add_input").next("span").text("");
            $("#username_add_input").parent().addClass("has-error");
            $("#username_add_input").next("span").text("用户名格式错误");
            $("#zldglysavebtn").attr("ajax-username", "error");
        }
        $.ajax({
            url: "${APP_PATH}/checknewusername",
            data: "username=" + username,
            type: "POST",
            success: function (result) {
                if (result.code == 200) {
                    $("#username_add_input").parent().removeClass("has-success has-error");
                    $("#username_add_input").next("span").text("");
                    $("#username_add_input").parent().addClass(" has-success ");
                    $("#username_add_input").next("span").text("用户名可用");
                    $("#zldglysavebtn").attr("ajax-username", "success");
                } else {
                    $("#username_add_input").parent().removeClass("has-success has-error");
                    $("#username_add_input").next("span").text("");
                    $("#username_add_input").parent().addClass("has-error");
                    $("#username_add_input").next("span").text("用户名重复");
                    $("#zldglysavebtn").attr("ajax-username", "error");
                }
            }
        })
    });

    function jiaoyanaddform() {

        return (checkusername() && checkpassword() && checkname() && checkbirthday() && checktelephone() && checkemail())
    }

    $("#zldglysavebtn").click(function () {
        if (!jiaoyanaddform()) {
            return false
        }
        if ($(this).attr("ajax-username") == "error") {
            return
        }
        $.ajax({
            url: "${APP_PATH}/zldglyCRUD",
            type: "POST",
            data: $("#savenewzldgly").serialize(),
            success: function (result) {
                if (result.code == 200) {
                    $("#zldglyAddModal").modal("hide");
                    to_page(totalRecord);
                } else {
                    if (undefined != result.extend.err.username) {
                        $("#username_add_input").parent().addClass("has-error");
                        $("#username_add_input").next("span").text("用户名可以是2-5位的中文或是3-16位数字英文组合");
                    }
                }
            }
        })
    })
    $(function () {
        $("#username_add_input").blur(checkusername);
        $("#password_add_input").blur(checkpassword);
        $("#name_add_input").blur(checkname);
        $("#birthday_add_input").blur(checkbirthday);
        $("#telephone_add_input").blur(checktelephone);
        $("#email_add_input").blur(checkemail);
        $("#username_update_input").blur(checkupdateusername);
        $("#password_update_input").blur(checkupdatepassword);
        $("#name_update_input").blur(checkupdatename);
        $("#birthday_update_input").blur(checkupdatebirthday);
        $("#telephone_update_input").blur(checkupdatetelephone);
        $("#email_update_input").blur(checkupdateemail);

    })
    $(document).on("click", ".edit_btn", function () {
        getzldlist("#zldglyUpdateModal select");
        getzldglyxinxi($(this).attr("edit-id"));
        $("#zldgly_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#zldglyUpdateModal").modal({
            backdrop: "static"
        })
    });

    function getzldglyxinxi(id) {
        $.ajax({
            url: "${APP_PATH}/zldglyCRUD/" + id,
            type: "GET",
            success: function (result) {
                var zldglydata = result.extend.zldglyxinxi;
                $("#username_update_input").val(zldglydata.username);
                $("#password_update_input").val(zldglydata.password);
                $("#name_update_input").val(zldglydata.name);
                $("#telephone_update_input").val(zldglydata.telephone);
                $("#email_update_input").val(zldglydata.email);
                $("#birthday_update_input").val(zldglydata.birthday);
                $("#zldglyUpdateModal input[type=radio]").val([zldglydata.sex]);
                $("#zldglyUpdateModal select").val([zldglydata.zid]);
            }
        })
    }

    function checkupdateusername() {
        var username = $("#username_update_input").val();
        var reg_username = /^\w{3,20}$/;
        var flag = reg_username.test(username);
        $("#username_update_input").parent().removeClass("has-success has-error");
        $("#username_update_input").next("span").text("");
        if (flag) {

            $("#username_update_input").parent().addClass(" has-success ");
            $("#username_update_input").next("span").text("");
        } else {
            $("#username_update_input").parent().addClass("has-error");
            $("#username_update_input").next("span").text("用户名可以是2-5位的中文或是3-16位数字英文组合");

        }
        return flag;
    }

    function checkupdatepassword() {
        var password = $("#password_update_input").val();
        var reg_password = /^\w{4,20}$/;
        var flag = reg_password.test(password);
        $("#password_update_input").parent().removeClass("has-success has-error");
        $("#password_update_input").next("span").text("");
        if (flag) {
            $("#password_update_input").parent().addClass(" has-success ");
            $("#password_update_input").next("span").text("");
        } else {
            $("#password_update_input").parent().addClass("has-error");
            $("#password_update_input").next("span").text("密码可以是4-20位数字英文组合");

        }
        return flag;
    }

    function checkupdatename() {
        var name = $("#name_update_input").val();
        $("#name_update_input").parent().removeClass("has-success has-error");
        $("#name_update_input").next("span").text("");
        if (name) {
            $("#name_update_input").parent().addClass(" has-success ");
            $("#name_update_input").next("span").text("");
            return true
        } else {
            $("#name_update_input").parent().addClass("has-error");
            $("#name_update_input").next("span").text("请输入昵称");
            return false
        }
    }

    function checkupdatebirthday() {
        var birthday = $("#birthday_update_input").val();
        $("#birthday_update_input").parent().removeClass("has-success has-error");
        $("#birthday_update_input").next("span").text("");
        if (birthday) {
            $("#birthday_update_input").parent().addClass(" has-success ");
            $("#birthday_update_input").next("span").text("");
            return true;
        } else {
            $("#birthday_update_input").parent().addClass("has-error");
            $("#birthday_update_input").next("span").text("请输入生日");
            return false;
        }
    }

    function checkupdatetelephone() {
        var telephone = $("#telephone_update_input").val();
        var reg_telephone = /^\w{11}$/;
        var flag = reg_telephone.test(telephone);
        $("#telephone_update_input").parent().removeClass("has-success has-error");
        $("#telephone_update_input").next("span").text("");
        if (flag) {
            $("#telephone_update_input").parent().addClass(" has-success ");
            $("#telephone_update_input").next("span").text("");
        } else {
            $("#telephone_update_input").parent().addClass("has-error");
            $("#telephone_update_input").next("span").text("请输入11位长度的手机号码");
        }
        return flag;
    }

    function checkupdateemail() {
        var email = $("#email_update_input").val();
        var reg_email = /^\w+@\w+\.\w+$/;
        var flag = reg_email.test(email);
        $("#email_update_input").parent().removeClass("has-success has-error");
        $("#email_update_input").next("span").text("");
        if (flag) {
            $("#email_update_input").parent().addClass(" has-success ");
            $("#email_update_input").next("span").text("");
        } else {
            $("#email_update_input").parent().addClass("has-error");
            $("#email_update_input").next("span").text("请输入正确格式的电子邮箱");
        }
        return flag;
    }

    function jiaoyanupdateform() {

        return (checkupdateusername() && checkupdatepassword() && checkupdatename() && checkupdatebirthday() && checkupdatetelephone() && checkupdateemail())
    }

    $("#zldgly_update_btn").click(function () {

        if (!jiaoyanupdateform()) {
            return false;
        }
        /*$.ajax({
            url:"/zldglyCRUD/"+$(this).attr("edit-id"),
            type:"POST",
            data:$("#zldglyUpdateModal form").serialize()+"&_method=PUT",
            success:function (result) {
                alert(result)
            }
        })
        PUT不能直接封装成map，所以要用过滤器将post转成put
        或者在加个过滤器将put也可以直接发*/

        $.ajax({
            url: "${APP_PATH}/zldglyCRUD/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#zldglyUpdateModal form").serialize(),
            success: function (result) {
                $("#zldglyUpdateModal").modal("hide");
                to_page(currentPage);
            }
        })
    })

    $(document).on("click", ".delete_btn", function () {
        var username = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("delete-id");
        if (confirm("确认删除>" + username + "<?")) {
            $.ajax({
                url: "${APP_PATH}/zldglyCRUD/" + id,
                type: "DELETE",
                success: function (result) {
                    to_page(currentPage);
                }

            })
        }
    });
    $("#check_all").click(function () {

        $(".check_item").prop("checked", $("#check_all").prop("checked"))

    });
    $(document).on("click", ".check_item", function () {
            var flag = $(".check_item:checked").length == $(".check_item").length
            $("#check_all").prop("checked", flag);
    });
    $("#zldgly_delect_all_btn").click(function(){
            var zldglynames="";
            var strids="";
            $.each($(".check_item:checked"),function () {
                zldglynames +=$(this).parents("tr").find("td:eq(2)").text()+",";
                strids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            zldglynames.substring(0,zldglynames.length-1);
            strids= strids.substring(0, strids.length-1)
            if(confirm("确认删除>" + zldglynames + "<?")){
                $.ajax({
                    url: "${APP_PATH}/zldglyCRUD/" + strids,
                    type: "DELETE",
                    success: function (result) {
                        to_page(currentPage);
                    }

                })
            }
    });

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