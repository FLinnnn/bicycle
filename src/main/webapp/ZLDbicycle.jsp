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

    <title>租赁点管理员自行车调控列表</title>

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
            <a class="navbar-brand" href="#">车辆租赁</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="mainZLD.jsp">主页<span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="#" id="ZLDzulinBicycle_btn">车辆管理</a></li>
                <li><a href="#" id="ZLDjiehuan_btn">订单管理</a></li>
                <li><a href="#" id="ZLDErr_btn">维护管理</a></li>

            </ul>
            <form class="navbar-form navbar-left" method="post" action="${APP_PATH}/chaxunCRUD">
                <div class="form-group">
                    <input type="text" class="form-control" id="sousuoneirong" name="E" placeholder="搜索自行车~">
                </div>
                <button type="button" class="btn btn-default" id="sousuo">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Hi~${sessionScope.zldgly.name}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">打印<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="ZLDEXCELbicycle"><span class="glyphicon glyphicon-user"
                                                                   aria-hidden="true"></span>打印车辆</a></li>
                        <li><a href="#" id="ZLDEXCELErr"><span class="glyphicon glyphicon-wrench"
                                                               aria-hidden="true"></span>打印维护</a></li>
                        <li><a href="#" id="ZLDjiehuanExcelbtn"><span class="glyphicon glyphicon-floppy-save"
                                                                      aria-hidden="true"></span>打印订单</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" id="exitZLD"><span class="glyphicon glyphicon-log-out"
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
            <h1>管理员自行车
                <small>分配管理</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-success" id="bicycle_add_modal_btn"><span class="glyphicon glyphicon-plus"
                                                                             aria-hidden="true"></span>新增
            </button>
            <button class="btn btn-danger" id="bicycle_delect_all_btn"><span class="glyphicon glyphicon-scissors"
                                                                             aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="bicycletables">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>

                    <th>id</th>
                    <th>编号</th>
                    <th>品牌</th>
                    <th>分类</th>
                    <th>日期</th>
                    <th>备注</th>
                    <th>状态</th>
                    <th>图片</th>
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
<!-- 管理员自行车添加的模态框 -->
<div class="modal fade" id="bicycleAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">管理员自行车添加表单</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="${APP_PATH}/bicycletozldCRUD" id="savenewbicycle"
                      enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="bianhao" class="form-control" id="bianhao_add_input"
                                   placeholder=">请输入编号">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">品牌</label>
                        <div class="col-sm-10">
                            <input type="text" name="pinpai" class="form-control" id="pinpai_add_input"
                                   placeholder=">请输入品牌">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="fenlei_add_select" name="cid"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">日期</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="tianjiariqi_add_input" name="tianjiariqi"
                                   placeholder="年/月/日">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="beizhu" class="form-control" id="beizhu_add_input"
                                   placeholder=">请输入备注">
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1_add_input" value="1" checked="checked"> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2_add_input" value="0"> 占用
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片</label>

                        <div class="col-sm-10">
                            <input name="image" id="newimage" type="file" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">租赁点</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="zld_add_select" name="zldid"></select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" id="bicyclesavebtn">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 管理员自行车修改的模态框 -->
<div class="modal fade" id="bicycleUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">管理员自行车修改表单</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="${APP_PATH}/bicycleupdatetozldCRUD" id="updatebicycle"
                      enctype="multipart/form-data" method="post">
                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <input type="text" name="bicycleid" class="form-control" id="bicycleid_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="bianhao" class="form-control" id="bianhao_update_input"
                                   placeholder=">请输入编号">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">品牌</label>
                        <div class="col-sm-10">
                            <input type="text" name="pinpai" class="form-control" id="pinpai_update_input"
                                   placeholder=">请输入品牌">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="fenlei_update_select" name="cid"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">日期</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="tianjiariqi_update_input" name="tianjiariqi"
                                   placeholder="年/月/日">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="beizhu" class="form-control" id="beizhu_update_input"
                                   placeholder=">请输入备注">
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1_update_input" value="1" checked="checked">
                                正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2_update_input" value="0"> 占用
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片</label>

                        <div class="col-sm-10">
                            <input name="image" type="file" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">租赁点</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="zld_update_select" name="zldid"></select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-success" id="bicycle_update_btn">更新</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<a href="zldzixingchexinxibiao.xlsx" download="租赁点自行车信息表.xlsx"  id="zldzixingchexinxibiao" hidden>租赁点自行车信息表</a>
<a href="zldweihuxinxibiao.xlsx" download="租赁点维护信息表.xlsx"  id="zldweihuxinxibiao" hidden>租赁点维护信息表</a>
<a href="zlddingdanbiao.xlsx" download="租赁点订单表.xlsx"  id="zlddingdanbiao" hidden>租赁点订单表</a>
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

    function build_bicycle_table(result) {
        $("#bicycletables tbody").empty();
        var bicycleCRUD = result.extend.pageInfo.list;
        $.each(bicycleCRUD, function (index, item) {
            var checkboxtd = $("<td><input type='checkbox' class='check_item'></td>");
            var bicycleidtd = $("<td></td>").append(item.bicycleid);
            var bianhaotd = $("<td></td>").append(item.bianhao);
            var pinpaitd = $("<td></td>").append(item.pinpai);
            var fenleitd = $("<td></td>").append(item.category.cname);
            var tianjiariqitd = $("<td></td>").append(item.tianjiariqi);
            var beizhutd = $("<td></td>").append(item.beizhu);
            var statustd = $("<td></td>").append((item.status) == "1" ? "正常" : (item.status) == "0" ? "占用" : "维护");
            var imagetd = $("<img  width='200' height='128'></img>").prop("src", "images/" + item.bicycleimage.image);
            var zldmingchengtd = $("<td></td>").append(item.zld.mingcheng);

            var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editbtn.attr("edit-id", item.bicycleid);
            var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delbtn.attr("delete-id", item.bicycleid);
            var btntd = $("<td></td>").append(editbtn).append(delbtn);
            $("<tr></tr>").append(checkboxtd).append(bicycleidtd).append(bianhaotd)
                .append(pinpaitd).append(fenleitd)
                .append(tianjiariqitd).append(beizhutd)
                .append(statustd).append(imagetd)
                .append(zldmingchengtd).append(btntd).appendTo("#bicycletables tbody")
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
            url: "${APP_PATH}/bicycleZLDCRUD",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_bicycle_table(result);
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

    $("#bicycle_add_modal_btn").click(function () {
        reset_from("#bicycleAddModal form");
        // $("#bicycleAddModal form")[0].reset();
        getzldlist("#zld_add_select");
        getcategorylist("#fenlei_add_select");
        $("#bicycleAddModal").modal({
            backdrop: "static"
        })
    });

    function checkbianhao() {
        var bianhao = $("#bianhao_add_input").val();
        var reg_bianhao = /^\w{1,20}$/;
        var flag = reg_bianhao.test(bianhao);
        $("#bianhao_add_input").parent().removeClass("has-success has-error");
        $("#bianhao_add_input").next("span").text("");
        if (flag) {

            $("#bianhao_add_input").parent().addClass(" has-success ");
            $("#bianhao_add_input").next("span").text("");
        } else {
            $("#bianhao_add_input").parent().addClass("has-error");
            $("#bianhao_add_input").next("span").text("请输入车辆的具体编号");

        }
        return flag;
    }


    $("#bianhao_add_input").change(function () {
        var bianhao = $("#bianhao_add_input").val();
        var reg_bianhao = /^\w{1,20}$/;
        var flag = reg_bianhao.test(bianhao);
        if (!flag) {
            $("#bianhao_add_input").parent().removeClass("has-success has-error");
            $("#bianhao_add_input").next("span").text("");
            $("#bianhao_add_input").parent().addClass("has-error");
            $("#bianhao_add_input").next("span").text("编号格式错误");
            $("#bicyclesavebtn").attr("ajax-bianhao", "error");
        }
        $.ajax({
            url: "${APP_PATH}/checknewbianhao",
            data: "bianhao=" + bianhao,
            type: "POST",
            success: function (result) {
                if (result.code == 200) {
                    $("#bianhao_add_input").parent().removeClass("has-success has-error");
                    $("#bianhao_add_input").next("span").text("");
                    $("#bianhao_add_input").parent().addClass(" has-success ");
                    $("#bianhao_add_input").next("span").text("编号可用");
                    $("#bicyclesavebtn").attr("ajax-bianhao", "success");
                } else {
                    $("#bianhao_add_input").parent().removeClass("has-success has-error");
                    $("#bianhao_add_input").next("span").text("");
                    $("#bianhao_add_input").parent().addClass("has-error");
                    $("#bianhao_add_input").next("span").text("编号重复");
                    $("#bicyclesavebtn").attr("ajax-bianhao", "error");
                }
            }
        })
    });

    function jiaoyanaddform() {

        return (checkbianhao())
    }


    $(function () {
        $("#bianhao_add_input").blur(checkbianhao);
        $("#bianhao_update_input").blur(checkupdatebianhao);
    })
    $(document).on("click", ".edit_btn", function () {
        getzldlist("#zld_update_select");
        getcategorylist("#fenlei_update_select");
        getbicyclexinxi($(this).attr("edit-id"));
        $("#bicycle_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#bicycleUpdateModal").modal({
            backdrop: "static"
        })
    })

    function getbicyclexinxi(id) {
        $.ajax({
            url: "${APP_PATH}/bicycleCRUD/" + id,
            type: "GET",
            success: function (result) {
                var bicycledata = result.extend.bicyclexinxi;
                $("#bicycleid_update_input").val(bicycledata.bicycleid);
                $("#bianhao_updaate_input").val(bicycledata.bianhao);
                $("#pinpai_update_input").val(bicycledata.pinpai);
                $("#tianjiariqi_update_input").val(bicycledata.tianjiariqi);
                $("#fenlei_update_select").val([bicycledata.cid]);
                $("#beizhu_update_input").val(bicycledata.beizhu);
                $("#bicycleUpdateModal input[type=radio]").val([bicycledata.status]);
                $("#zld_update_select").val([bicycledata.zld.zldid]);
            }
        })
    }

    function checkupdatebianhao() {
        var bianhao = $("#bianhao_update_input").val();
        var reg_bianhao = /^\w{1,20}$/;
        var flag = reg_bianhao.test(bianhao);
        $("#bianhao_update_input").parent().removeClass("has-success has-error");
        $("#bianhao_update_input").next("span").text("");
        if (flag) {

            $("#bianhao_update_input").parent().addClass(" has-success ");
            $("#bianhao_update_input").next("span").text("");
        } else {
            $("#bianhao_update_input").parent().addClass("has-error");
            $("#bianhao_update_input").next("span").text("请正确输入自行车编号");

        }
        return flag;
    }

    function jiaoyanupdateform() {

        return (checkupdatebianhao())
    }


    $(document).on("click", ".delete_btn", function () {
        var bianhao = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("delete-id");
        if (confirm("确认删除>" + bianhao + "<?")) {
            $.ajax({
                url: "${APP_PATH}/bicycleCRUD/" + id,
                type: "DELETE",
                success: function (result) {
                    to_page(currentPage);
                }

            })
        }
    })
    $("#check_all").click(function () {

        $(".check_item").prop("checked", $("#check_all").prop("checked"))

    })
    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length
        $("#check_all").prop("checked", flag);
    })
    $("#bicycle_delect_all_btn").click(function () {
        var bicyclebianhaos = "";
        var strids = "";
        $.each($(".check_item:checked"), function () {
            bicyclebianhaos += $(this).parents("tr").find("td:eq(2)").text() + ",";
            strids += $(this).parents("tr").find("td:eq(1)").text() + "-";
        })
        bicyclebianhaos.substring(0, bicyclebianhaos.length - 1);
        strids = strids.substring(0, strids.length - 1)
        if (confirm("确认删除>" + bicyclebianhaos + "<?")) {
            $.ajax({
                url: "${APP_PATH}/bicycleCRUD/" + strids,
                type: "DELETE",
                success: function (result) {
                    to_page(currentPage);
                }

            })
        }
    })
    $("#ZLDzulinBicycle_btn").click(function () {
        location.href = "ZLDbicycle.jsp"
    })
    $("#ZLDErr_btn").click(function () {
        location.href = "ZLDErr.jsp"
    })
    $("#ZLDjiehuan_btn").click(function () {
        location.href = "ZLDjiehuan.jsp"
    })


    $("#sousuo").click(function () {
        to_pagesousuo(1, $("#sousuoneirong").val())

    })

    function to_pagesousuo(pn, E) {
        $.ajax({
            url: "${APP_PATH}/chaxunzldidCRUD",
            data: {"pn": pn, "E": E},
            type: "POST",
            success: function (result) {
                build_bicycle_table(result);
                build_page_info(result);
                build_page_nav(result)
            }
        })
    }

    $("#ZLDEXCELbicycle").click(function () {
        $.ajax({
            url: "${APP_PATH}/bicycleExcelzldCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("zldzixingchexinxibiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#ZLDEXCELErr").click(function () {
        $.ajax({
            url: "${APP_PATH}/errExcelzldCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("zldweihuxinxibiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#ZLDjiehuanExcelbtn").click(function () {
        $.ajax({
            url: "${APP_PATH}/jiehuandingdanExcelCRUDzld",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("zlddingdanbiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#exitZLD").click(function () {
            exitZLD()
        }
    )

    function exitZLD() {
        $.ajax({
            url: "${APP_PATH}/exitZLDGLY",
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