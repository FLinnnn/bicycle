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

    <title>用户自行车租赁页面</title>

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">租赁点分类</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="mainYH.jsp">主页<span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="#" id="YHzulinBicycle_btn">车辆租赁</a></li>
                <li><a href="#" id="YHjiehuan_btn">订单管理</a></li>
                <li><a href="#" id="YHxiugai_btn">修改信息</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="YHFLbtn"><span class="glyphicon glyphicon-leaf" aria-hidden="true" ></span>自行车分类</a></li>
                        <li><a href="#" id="YHZLDbtn"><span class="glyphicon glyphicon-search" aria-hidden="true" ></span>租赁点分类</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Hi~~${sessionScope.yh.uname}</a></li>
                        <li><a href="#" id="exitYH0"><span class="glyphicon glyphicon-log-out" aria-hidden="true" ></span>退出登陆</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left"  method="post" action="${APP_PATH}/chaxunCRUD">
                <div class="form-group">
                    <input type="text" class="form-control" id="sousuoneirong" name="E" placeholder="搜索自行车~">
                </div>
                <button type="button" class="btn btn-default" id="sousuo">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Hi~${sessionScope.yh.uname}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="mainYH.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>用户中心</a></li>
                        <li><a href="#" id="YHxiugai_btn1"><span class="glyphicon glyphicon-wrench" aria-hidden="true" ></span>修改信息</a></li>
                        <li><a href="#" id="YHjiehuanExcelbtn"><span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>打印订单</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" id="exitYH1"><span class="glyphicon glyphicon-log-out" aria-hidden="true" ></span>退出登陆</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>用户自行车
                <small>租赁</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-success" id="bicycle_gerenzhongxin_modal_btn"><span class="glyphicon glyphicon-user"
                                                                                       aria-hidden="true"></span>个人中心
            </button>
            <button class="btn btn-danger" id="bicycle_dingdanguanli_all_btn"><span
                    class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>订单管理
            </button>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-12 ">

            <button class="btn btn-primary" id="btncid1">莲湖租赁点
            </button>
            <button class="btn btn-success" id="btncid2">碑林租赁点
            </button>
            <button class="btn btn-info" id="btncid3">未央租赁点
            </button>
            <button class="btn btn-warning" id="btncid4">新城租赁点
            </button>
            <button class="btn btn-danger" id="btncid5">雁塔租赁点
            </button>
            <button class="btn btn-primary" id="btncid6">灞桥租赁点
            </button>
            <button class="btn btn-success" id="btncid7">高陵租赁点
            </button>
            <button class="btn btn-info" id="btncid8">长安租赁点
            </button>
            <button class="btn btn-warning" id="btncid9">临潼租赁点
            </button>
            <button class="btn btn-danger" id="btncid10">鄠邑租赁点
            </button>
            <button class="btn btn-primary" id="btncid11">全部自行车
            </button>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="bicycletables">
                <thead>
                <tr>

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
<!-- 用户修改个人信息的模态框 -->
<div class="modal fade" id="YHxiugaigerenxinxiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateYH">
                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">uid</label>
                        <div class="col-sm-10">
                            <input type="text" name="uid" class="form-control" id="uid_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
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
                            <input type="text" name="uname" class="form-control" id="uname_update_input"
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
                                <input type="radio" name="sex" id="sex1_update_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex2_update_input" value="0"> 女
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" id="YH_update_btn">更新</button>
            </div>
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
<!-- 用户租用自行车的模态框 -->
<div class="modal fade" id="bicycleyhzujieModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">租借确认信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  id="jiebicycle" method="post">
                    <div class="form-group" hidden>
                        <label class="col-sm-2 control-label">id</label>
                        <div class="col-sm-10">
                            <input type="text" name="bid" class="form-control" id="bicycleid_jie_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="bianhao" class="form-control" disabled id="bianhao_jie_input"
                                   readonly="readonly">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">品牌</label>
                        <div class="col-sm-10">
                            <input type="text" name="pinpai" class="form-control" disabled id="pinpai_jie_input"
                                   readonly="readonly"
                            >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类</label>
                        <div class="col-sm-8">
                            <select class="form-control" disabled id="fenlei_jie_select" name="cid"></select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="beizhu" disabled class="form-control" id="beizhu_jie_input"
                                   readonly="readonly"
                            >
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
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
                        <label class="col-sm-2 control-label">图片</label>

                        <div class="col-sm-10" disabled id="jieimage">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">租赁点</label>
                        <div class="col-sm-8">
                            <select class="form-control" disabled id="zld_jie_select" name="bzldid"></select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-success" id="bicycle_jie_btn">租借</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<a href="yonghudingdanbiao.xlsx" download="用户订单表.xlsx"  id="yonghudingdanbiao" hidden>用户订单表</a>
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
            var bicycleidtd = $("<td></td>").append(item.bicycleid);
            var bianhaotd = $("<td></td>").append(item.bianhao);
            var pinpaitd = $("<td></td>").append(item.pinpai);
            var fenleitd = $("<td></td>").append(item.category.cname);
            var tianjiariqitd = $("<td></td>").append(item.tianjiariqi);
            var beizhutd = $("<td></td>").append(item.beizhu);
            var statustd = $("<td></td>").append((item.status)=="1"?"正常":(item.status)=="0"?"占用":"维护");
            var imagetd = $("<img  width='200' height='128'></img>").prop("src", "images/" + item.bicycleimage.image);
            var zldmingchengtd = $("<td></td>").append(item.zld.mingcheng);
            if ((item.status)=="0"||(item.status)=="2") {
                var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").addClass("disabled")
                    .append($("<span></span>").addClass("glyphicon glyphicon-new-window")).append("借车");

                editbtn.attr("edit-id", item.bicycleid);

            }else{

                var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-new-window")).append("借车");

                editbtn.attr("edit-id", item.bicycleid);

            }
            var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-wrench")).append("报修");
            delbtn.attr("delete-id", item.bicycleid);
            var btntd = $("<td></td>").append(editbtn).append(delbtn);
            $("<tr></tr>").append(bicycleidtd).append(bianhaotd)
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
            url: "${APP_PATH}/bicycleCRUD",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_bicycle_table(result);
                build_page_info(result);
                build_page_nav(result)
            }
        })
    }
    function to_pagewithzldid(pn,zldid) {
        $.ajax({
            url: "${APP_PATH}/bicyclewithzldidCRUD",
            data: "pn=" + pn+"&zldid=" + zldid,
            type: "GET",
            success: function (result) {
                build_bicycle_table(result);
                build_page_info(result);
                build_page_nav(result)
            }
        })
    }
    $("#btncid1").click(function () {
        to_pagewithzldid(1,1)
    })
    $("#btncid2").click(function () {
        to_pagewithzldid(1,2)
    })
    $("#btncid3").click(function () {
        to_pagewithzldid(1,3)
    })
    $("#btncid4").click(function () {
        to_pagewithzldid(1,4)
    })
    $("#btncid5").click(function () {
        to_pagewithzldid(1,5)
    })
    $("#btncid6").click(function () {
        to_pagewithzldid(1,6)
    })
    $("#btncid7").click(function () {
        to_pagewithzldid(1,7)
    })
    $("#btncid8").click(function () {
        to_pagewithzldid(1,8)
    })
    $("#btncid9").click(function () {
        to_pagewithzldid(1,9)
    })
    $("#btncid10").click(function () {
        to_pagewithzldid(1,10)
    })

    $("#btncid11").click(function () {
        to_page(1)
    })
    function reset_from(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    $("#YHjiehuanExcelbtn").click(function () {
        $.ajax({
            url: "${APP_PATH}/YHjiehuandingdanExcelCRUD",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("打印成功");
                    document.getElementById("yonghudingdanbiao").click();
                } else {
                    alert("打印失败");
                }
            }
        })

    })
    $("#exitYH0").click(function(){
            exitYH()
        }
    )
    $("#exitYH1").click(function(){
            exitYH()
        }
    )
    function exitYH() {
        $.ajax({
            url: "${APP_PATH}/exitYH",
            type: "GET",
            success: function (result) {
                if (result.code == 200) {
                    alert("欢迎下次使用");
                    location.href="login.jsp"
                }
            }
        })
    }
    $(document).on("click", ".edit_btn", function () {
        if (($(this).parents("tr").find("td:eq(6)").text()) == "占用") {
            alert("该自行车暂时无法使用！")
            return
        }
        if (($(this).parents("tr").find("td:eq(6)").text()) == "维护") {
            alert("该自行车暂时无法使用！")
            return
        }
        getzldlist("#zld_jie_select");
        getcategorylist("#fenlei_jie_select");
        getbicyclexinxi($(this).attr("edit-id"));
        $("#bicycle_jie_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#bicycleyhzujieModal").modal({
            backdrop: "static"
        })
    })

    function getbicyclexinxi(id) {
        $.ajax({
            url: "${APP_PATH}/bicycleCRUD/" + id,
            type: "GET",
            success: function (result) {
                var bicycledata = result.extend.bicyclexinxi;
                $("#bicycleid_jie_input").val(bicycledata.bicycleid);
                $("#bianhao_jie_input").val(bicycledata.bianhao);
                $("#pinpai_jie_input").val(bicycledata.pinpai);
                $("#fenlei_jie_select").val([bicycledata.cid]);
                $("#beizhu_jie_input").val(bicycledata.beizhu);
                var imagetd = $("<img  width='200' height='128'></img>").prop("src", "images/" + bicycledata.bicycleimage.image);
                imagetd.appendTo("#jieimage");
                $("#bicycleyhzujieModal input[type=radio]").val([bicycledata.status]);
                $("#zld_jie_select").val([bicycledata.zld.zldid]);
            }
        })
    }

    $("#bicycle_jie_btn").click(function () {
        $("#zld_jie_select").removeAttr("disabled");
        $.ajax({
            url: "${APP_PATH}/jiehuanCRUD",
            type: "POST",
            data: $("#bicycleyhzujieModal form").serialize(),
            success: function (result) {
                $("#bicycleyhzujieModal").modal("hide");
                alert("租借成功！");
                to_page(currentPage);
            }
        })
    })
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
    $("#bicycle_dingdanguanli_all_btn").click(function () {
        location.href = "YHjiehuan.jsp"
    })
    $("#bicycle_gerenzhongxin_modal_btn").click(function () {
        location.href = "mainYH.jsp"
    });
    $(function () {
        $("#YHxiugai_btn").attr("uid",${sessionScope.yh.uid});
        $("#YHxiugai_btn1").attr("uid",${sessionScope.yh.uid})
    });
    $("#YHzulinBicycle_btn").click(function () {
        location.href = "YHbicycle.jsp"
    })
    $("#YHjiehuan_btn").click(function () {
        location.href = "YHjiehuan.jsp"
    });
    $("#YHFLbtn").click(function () {
        location.href="YHFLbicycle.jsp"
    });
    $("#YHZLDbtn").click(function () {
        location.href="YHZLDbicycle.jsp"
    });
    function getYHxinxi(uid){
        $.ajax({
            url: "${APP_PATH}/YHCRUD/" + uid,
            type: "GET",
            success: function (result) {
                var YHdata = result.extend.YHxinxi;
                $("#uid_update_input").val(YHdata.uid);
                $("#username_update_input").val(YHdata.username);
                $("#password_update_input").val(YHdata.password);
                $("#uname_update_input").val(YHdata.uname);
                $("#birthday_update_input").val(YHdata.birthday);
                $("#YHxiugaigerenxinxiModal input[type=radio]").val([YHdata.sex]);
                $("#telephone_update_input").val(YHdata.telephone);
                $("#email_update_input").val(YHdata.email);
            }
        })
    }
    $("#YHxiugai_btn").click(function () {
        reset_from("#YHxiugaigerenxinxiModal form")
        getYHxinxi($(this).attr("uid"));
        $("#YHxiugaigerenxinxiModal").modal({
            backdrop: "static"
        })
    })
    $("#YHxiugai_btn1").click(function () {
        reset_from("#YHxiugaigerenxinxiModal form")
        getYHxinxi($(this).attr("uid"));
        $("#YHxiugaigerenxinxiModal").modal({
            backdrop: "static"
        })
    })
    function checkusername() {
        var username = $("#username_update_input").val();
        var reg_username = /^\w{1,20}$/;
        var flag = reg_username.test(username);
        $("#username_update_input").parent().removeClass("has-success has-error");
        $("#username_update_input").next("span").text("");
        if (flag) {

            $("#username_update_input").parent().addClass(" has-success ");
            $("#username_update_input").next("span").text("");
        } else {
            $("#username_update_input").parent().addClass("has-error");
            $("#username_update_input").next("span").text("用户名可以是1-5位的中文或是3-16位数字英文组合");

        }
        return flag;
    }

    function checkpassword() {
        var password = $("#password_update_input").val();
        var reg_password = /^\w{1,20}$/;
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

    function checkname() {
        var name = $("#name_update_input").val();
        $("#name_update_input").parent().removeClass("has-success has-error");
        $("#name_update_input").next("span").text("");
        if (name) {
            $("#name_update_input").parent().addClass(" has-success ");
            $("#name_update_input").next("span").text("");
            return true;
        } else {
            $("#name_update_input").parent().addClass("has-error");
            $("#name_update_input").next("span").text("请输入昵称");
            return false;
        }
    }


    function checktelephone() {
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

    function checkemail() {
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

    $("#username_update_input").change(function () {
        var username = $("#username_update_input").val();
        var reg_username = /^\w{1,20}$/;
        var flag = reg_username.test(username);
        if (!flag) {
            $("#username_update_input").parent().removeClass("has-success has-error");
            $("#username_update_input").next("span").text("");
            $("#username_update_input").parent().addClass("has-error");
            $("#username_update_input").next("span").text("用户名格式错误");
            $("#YH_update_btn").attr("ajax-username", "error");
        }
        $.ajax({
            url: "${APP_PATH}/checknewyhusername",
            data: "username=" + username,
            type: "POST",
            success: function (result) {
                if (result.code == 200) {
                    $("#username_update_input").parent().removeClass("has-success has-error");
                    $("#username_update_input").next("span").text("");
                    $("#username_update_input").parent().addClass(" has-success ");
                    $("#username_update_input").next("span").text("用户名可用");
                    $("#YH_update_btn").attr("ajax-username", "success");
                } else {
                    $("#username_update_input").parent().removeClass("has-success has-error");
                    $("#username_update_input").next("span").text("");
                    $("#username_update_input").parent().addClass("has-error");
                    $("#username_update_input").next("span").text("用户名重复");
                    $("#YH_update_btn").attr("ajax-username", "error");
                }
            }
        })
    });
    $("#YH_update_btn").click(function () {
        if ($(this).attr("ajax-username") == "error") {
            return
        }
        $.ajax({
            url: "${APP_PATH}/updateYHCRUD",
            type: "POST",
            data: $("#updateYH").serialize(),
            success: function (result) {
                if (result.code == 200) {
                    $("#YHxiugaigerenxinxiModal").modal("hide");
                    alert("修改成功")
                } else {
                    $("#username_add_input").parent().addClass("has-error");
                    $("#username_add_input").next("span").text("用户名可以是1-5位的中文或是3-16位数字英文组合");
                }
            }
        })
    })
    $(function () {
        $("#password_update_input").blur(checkpassword);
        $("#uname_update_input").blur(checkname);
        $("#telephone_update_input").blur(checktelephone);
        $("#email_update_input").blur(checkemail);
    })
    $("#sousuo").click(function () {
        to_pagesousuo(1,$("#sousuoneirong").val())

    })
</script>
</html>