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
    <%--<script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-form.min.js">

    </script>--%>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js">

    </script>

    <title>管理员订单管理页面</title>

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
            <a class="navbar-brand" href="#">管理员订单管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="mainGLY.jsp">主页<span class="sr-only">(current)</span></a></li>
                <li><a href="#" id="GLYbicyclebtn">车辆管理</a></li>
                <li class="active"><a href="#" id="GLYjiehuanbtn">订单管理</a></li>
                <li><a href="#" id="GLYErrbtn">维护管理</a></li>
                <li><a href="#" id="GLYyhListbtn">用户管理</a></li>
                <li><a href="#" id="GLYZLDFENPEIbtn">管理员分配</a></li>
                <li><a href="#" id="GLYADDZLDGLYbtn">添加租赁点</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="GLYFLBIC"><span class="glyphicon glyphicon-leaf" aria-hidden="true" ></span>自行车分类</a></li>
                        <li><a href="#" id="GLYZLDBIC"><span class="glyphicon glyphicon-search" aria-hidden="true" ></span>租赁点分类</a></li>
                    </ul>
                </li>

            </ul>
            <form class="navbar-form navbar-left" method="post" >
                <div class="form-group">
                    <input type="text" class="form-control" id="sousuoneirong" name="E" placeholder="搜索订单信息~">
                </div>
                <button type="button" class="btn btn-default" id="sousuo">搜索</button>
            </form>
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
            <h1>租赁订单管理
                <small>管理员</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-success" id="bicycle_gerenzhongxin_modal_btn"><span class="glyphicon glyphicon-user"
                                                                                       aria-hidden="true"></span>个人中心
            </button>
            <button class="btn btn-danger" id="bicycle_zldguanli_all_btn"><span
                    class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>租赁点管理
            </button>
            <button class="btn btn-danger" id="toExcel_btn"><span
                    class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>打印订单
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="jiehuantables">
                <thead>
                <tr>

                    <th>订单id</th>
                    <th>自行车id</th>
                    <th>租赁点名称</th>
                    <th>租借日期</th>
                    <th>归还日期</th>
                    <th>订单状态</th>
                    <th>用户名称</th>
                    <th>自行车品牌</th>
                    <th>自行车状态</th>
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
<!-- 用户报修自行车的模态框 -->
<div class="modal fade" id="bicycleyhbaoxiuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">报修确认信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="baoxiubicycle" method="post">
                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">bid</label>
                        <div class="col-sm-10">
                            <input type="text" name="bid" class="form-control" id="bicycleid_baoxiu_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <input type="text" name="type" class="form-control" id="type_baoxiu_input"
                                   placeholder=">请输入车辆异常信息">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">日期</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="date_add_input" name="date"
                                   placeholder="年/月/日">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-success" id="bicycle_baoxiu_btn">报修</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 用户归还自行车的模态框 -->
<div class="modal fade" id="bicycleyhguihuanModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">归还确认信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  id="jiebicycle" method="post">
                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">jiehuanid</label>
                        <div class="col-sm-10">
                            <input type="text" name="jiehuanid" class="form-control" id="jiehuanid_huan_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">bicycleid</label>
                        <div class="col-sm-10">
                            <input type="text" name="bid" class="form-control" id="bicycleid_huan_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="yh.uname" class="form-control" disabled id="uname_huan_input"
                                   readonly="readonly">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">品牌</label>
                        <div class="col-sm-10">
                            <input type="text" name="bicycle.pinpai" class="form-control" disabled id="pinpai_huan_input"
                                   readonly="readonly"
                            >
                            <span class="help-block"></span>
                        </div>
                    </div>



                    <div class="form-group">
                    <label class="col-sm-2 control-label">订单状态</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="jiehuanstatus" disabled id="jiehuanstatus1_huan_input" value="1"
                                   checked="checked"> 进行中
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="jiehuanstatus" disabled id="jiehuanstatus2_jie_input" value="0"> 已完成
                        </label>
                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车辆状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="status" disabled id="status1_jie_input" value="1"
                                       checked="checked"> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" disabled id="status2_jie_input" value="0"> 占用
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">租赁点</label>
                        <div class="col-sm-8">
                            <select class="form-control" disabled id="zld_huan_select" name="bzldid"></select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-success" id="bicycle_huan_btn">归还</button>
                    </div>
                </form>
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

    function getcategorylist(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/category",
            type: "GET",
            success: function (result) {
                // $("#bicycleAddModal select").append("")
                $.each(result.extend.categorylist, function () {
                    var optionEle = $("<option></option>").append(this.cname).attr("value", this.categoryid);
                    optionEle.appendTo(ele)
                })
            }
        })
    }

    function build_jiehuan_table(result) {
        $("#jiehuantables tbody").empty();
        var jiehuanCRUD = result.extend.pageInfo.list;
        $.each(jiehuanCRUD, function (index, item) {
            var jiehuanidtd = $("<td></td>").append(item.jiehuanid);
            var bidtd = $("<td></td>").append(item.bid);
            var bzididtd = $("<td></td>").append(item.zld.mingcheng);
            var bdatetd = $("<td></td>").append(item.bdate);
            var todatetd = $("<td></td>").append((item.todate)==undefined?"使用中":item.todate);
            var jiehuanstatustd = $("<td></td>").append((item.jiehuanstatus)=="1"?"进行中":(item.jiehuanstatus)=="0"?"已完成":"订单异常");
            var unametd = $("<td></td>").append(item.yh.uname);
            var pinpaitd = $("<td></td>").append(item.bicycle.pinpai);
            var statustd = $("<td></td>").append((item.bicycle.status)=="1"?"正常":(item.bicycle.status)=="0"?"占用":"维护");

            if ((item.jiehuanstatus)=="0"||(item.jiehuanstatus)=="2") {
                var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").addClass("disabled")
                    .append($("<span></span>").addClass("glyphicon glyphicon-new-window")).append("还车");

                editbtn.attr("edit-id", item.jiehuanid);

            }else{

                var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-new-window")).append("还车");

                editbtn.attr("edit-id", item.jiehuanid);

            }
            var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-wrench")).append("报修");
            delbtn.attr("delete-id", item.bid);
            var btntd = $("<td></td>").append(editbtn).append(delbtn);
            $("<tr></tr>").append(jiehuanidtd).append(bidtd)
                .append(bzididtd).append(bdatetd)
                .append(todatetd).append(jiehuanstatustd)
                .append(unametd).append(pinpaitd)
                .append(statustd).append(btntd).appendTo("#jiehuantables tbody")
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
            url: "${APP_PATH}/jiehuandingdanCRUD",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_jiehuan_table(result);
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

    $(document).on("click", ".edit_btn", function () {
        if (($(this).parents("tr").find("td:eq(8)").text()) == "正常") {
            alert("该自行车暂时未被使用！")
            return
        }
        if (($(this).parents("tr").find("td:eq(8)").text()) == "维护") {
            alert("该自行车暂时无法使用！")
            return
        }
        getzldlist("#zld_huan_select");
        getcategorylist("#fenlei_huan_select");
        getjiehuanxinxi($(this).attr("edit-id"));
        $("#bicycle_huan_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#bicycleyhguihuanModal").modal({
            backdrop: "static"
        })
    })

    function getjiehuanxinxi(id) {
        $.ajax({
            url: "${APP_PATH}/jiehuanCRUD/" + id,
            type: "GET",
            success: function (result) {
                var jiehuandata = result.extend.jiehuanxinxi;
                $("#jiehuanid_huan_input").val(jiehuandata.jiehuanid);
                $("#bicycleid_huan_input").val(jiehuandata.bid);
                $("#zld_huan_select").val([jiehuandata.bzldid]);
                $("#bicycleyhguihuanModal input[name=jiehuanstatus][type=radio]").val([jiehuandata.jiehuanstatus]);
                $("#uname_huan_input").val(jiehuandata.yh.uname);
                $("#pinpai_huan_input").val(jiehuandata.bicycle.pinpai);
                $("#bicycleyhguihuanModal input[name=status][type=radio]").val([jiehuandata.bicycle.status]);
            }
        })
    }
    $("#toExcel_btn").click(function () {
        $.ajax({
            url: "${APP_PATH}/jiehuandingdanExcelCRUD",
            type: "GET",
            success: function (result) {

            }
        })
    });
    $("#bicycle_huan_btn").click(function () {
        $("#zld_huan_select").removeAttr("disabled");
        $.ajax({
            url: "${APP_PATH}/jiehuanguihuanCRUD",
            type: "POST",
            data: $("#bicycleyhguihuanModal form").serialize(),
            success: function (result) {
                to_page(currentPage);
                $("#bicycleyhguihuanModal").modal("hide");
                alert("归还成功！");
            }
        })
    });
    $(document).on("click", ".delete_btn", function () {
        reset_from("#bicycleyhbaoxiuModal form")
        $("#bicycleid_baoxiu_input").val($(this).attr("delete-id"));
        var bianhao = $(this).parents("tr").find("td:eq(1)").text();
        if (confirm("确认报修该>" + bianhao + "<自行车吗?")) {
            $("#bicycleyhbaoxiuModal").modal({
                backdrop: "static"
            })

        }
    })
    $("#bicycle_baoxiu_btn").click(function () {
        $.ajax({
            url: "${APP_PATH}/errCRUD",
            type: "POST",
            data: $("#bicycleyhbaoxiuModal form").serialize(),
            success: function (result) {
                alert("报修成功，感谢你的帮助！")
            }
        })
        var errid = $("#bicycleid_baoxiu_input").val()
        $.ajax({
            url: "${APP_PATH}/bicyclebaoxiuCRUD/" + errid,
            type: "GET",
            success: function (result) {
                $("#bicycleyhbaoxiuModal").modal("hide");
                to_page(currentPage);

            }
        })
    })
    $("#bicycle_zldguanli_all_btn").click(function () {
        location.href = "GLYzldglyList.jsp"
    })
    $("#bicycle_gerenzhongxin_modal_btn").click(function () {
        location.href = "mainGLY.jsp"
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
    $("#sousuo").click(function () {
        to_pagesousuo(1, $("#sousuoneirong").val())

    })
    function to_pagesousuo(pn,E) {
        $.ajax({
            url: "${APP_PATH}/chaxunjiehuanCRUD",
            data: {"pn": pn,"E":E},
            type: "POST",
            success: function (result) {
                build_jiehuan_table(result);
                build_page_info(result);
                build_page_nav(result)
            }
        })
    }
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