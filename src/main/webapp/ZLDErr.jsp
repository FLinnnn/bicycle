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

    <title>租赁点自行车维护列表</title>

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
            <a class="navbar-brand" href="#">维护管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="mainZLD.jsp">主页<span class="sr-only">(current)</span></a></li>
                <li><a href="#" id="ZLDzulinBicycle_btn">车辆管理</a></li>
                <li><a href="#" id="ZLDjiehuan_btn">订单管理</a></li>
                <li class="active"><a href="#" id="ZLDErr_btn">维护管理</a></li>

            </ul>

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
            <h1>租赁点自行车
                <small>维护管理</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-success" id="err_add_modal_btn"><span class="glyphicon glyphicon-plus"
                                                                         aria-hidden="true"></span>新增报修
            </button>
            <button class="btn btn-danger" id="err_delect_all_btn"><span class="glyphicon glyphicon-scissors" aria-hidden="true"></span>删除记录
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="errtables">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>errid</th>
                    <th>bid</th>
                    <th>维护信息</th>
                    <th>维护时间</th>
                    <th>编号</th>
                    <th>品牌</th>
                    <th>分类</th>
                    <th>自行车添加日期</th>
                    <th>自行车备注</th>
                    <th>预览图片</th>
                    <th>租赁点名称</th>
                    <th>租赁点地点</th>
                    <th>租赁点图片</th>
                    <th>管理员名称</th>
                    <th>管理员电话</th>
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
<!-- 管理员错误添加的模态框 -->
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
                    <div class="form-group" >
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
                $.each(result.extend.categorylist, function () {
                    var optionEle = $("<option></option>").append(this.cname).attr("value", this.categoryid);
                    optionEle.appendTo(ele)
                })
            }
        })
    }

    function build_bicycle_table(result) {
        $("#errtables tbody").empty();
        var errCRUD = result.extend.pageInfo.list;
        $.each(errCRUD, function (index, item) {
            var checkboxtd = $("<td><input type='checkbox' class='check_item'></td>");
            var erridtd = $("<td></td>").append(item.errid);
            var bidtd = $("<td></td>").append(item.bid);
            var typetd = $("<td></td>").append(item.type);
            var datetd = $("<td></td>").append(item.date);
            var bianhaotd = $("<td></td>").append(item.bicycle.bianhao);
            var pinpaitd = $("<td></td>").append(item.bicycle.pinpai);
            var cnametd = $("<td></td>").append(item.category.cname);
            var tianjiariqitd = $("<td></td>").append(item.bicycle.tianjiariqi);
            var beizhutd = $("<td></td>").append(item.bicycle.beizhu);
            var imagetd = $("<img  width='200' height='128'></img>").prop("src","images/"+item.bicycleimage.image);
            var zldmingchengtd = $("<td></td>").append(item.zld.mingcheng);
            var zlddidiantd = $("<td></td>").append(item.zld.didian);
            var imagezldtd = $("<img  width='200' height='128'></img>").prop("src","images/"+item.zld.zldimage);
            var glymingchengtd = $("<td></td>").append(item.zldgly.name);
            var glydianhuatd = $("<td></td>").append(item.zldgly.telephone);

            var editbtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修复");
            editbtn.attr("edit-id", item.errid);
            var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delbtn.attr("delete-id", item.errid);
            var btntd = $("<td></td>").append(editbtn).append(delbtn);
            $("<tr></tr>").append(checkboxtd).append(erridtd).append(bidtd)
                .append(typetd).append(datetd)
                .append(bianhaotd).append(pinpaitd)
                .append(cnametd).append(tianjiariqitd)
                .append(beizhutd).append(imagetd).append(zldmingchengtd).append(zlddidiantd)
                .append(imagezldtd).append(glymingchengtd).append(glydianhuatd).append(btntd).appendTo("#errtables tbody")
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
            url: "${APP_PATH}/errzldCRUD",
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

    $("#err_add_modal_btn").click(function () {
        reset_from("#bicycleyhbaoxiuModal form")
        $("#bicycleyhbaoxiuModal").modal({
            backdrop: "static"
        })
    });

    function checkbicycleid() {
        var bicycleid = $("#bicycleid_baoxiu_input").val();
        var reg_bicycleid = /^\w{1,20}$/;
        var flag = reg_bicycleid.test(bicycleid);
        $("#bicycleid_baoxiu_input").parent().removeClass("has-success has-error");
        $("#bicycleid_baoxiu_input").next("span").text("");
        if (flag) {

            $("#bicycleid_baoxiu_input").parent().addClass(" has-success ");
            $("#bicycleid_baoxiu_input").next("span").text("");
        } else {
            $("#bicycleid_baoxiu_input").parent().addClass("has-error");
            $("#bicycleid_baoxiu_input").next("span").text("请输入车辆的正确编号");
        }
        return flag;
    }



    $("#bicycleid_baoxiu_input").change(function () {
        var bicycleid = $("#bicycleid_baoxiu_input").val();
        var reg_bicycleid = /^\w{1,20}$/;
        var flag = reg_bicycleid.test(bicycleid);
        if (!flag) {
            $("#bicycleid_baoxiu_input").parent().removeClass("has-success has-error");
            $("#bicycleid_baoxiu_input").next("span").text("");
            $("#bicycleid_baoxiu_input").parent().addClass("has-error");
            $("#bicycleid_baoxiu_input").next("span").text("编号格式错误");
            $("#bicycle_baoxiu_btn").attr("ajax-bianhao", "error");
        }
        $.ajax({
            url: "${APP_PATH}/checkbicycleid",
            data: "bicycleid=" + bicycleid,
            type: "POST",
            success: function (result) {
                if (result.code == 200) {
                    $("#bicycleid_baoxiu_input").parent().removeClass("has-success has-error");
                    $("#bicycleid_baoxiu_input").next("span").text("");
                    $("#bicycleid_baoxiu_input").parent().addClass(" has-success ");
                    $("#bicycleid_baoxiu_input").next("span").text("编号可用");
                    $("#bicycle_baoxiu_btn").attr("ajax-bianhao", "success");
                } else {
                    $("#bicycleid_baoxiu_input").parent().removeClass("has-success has-error");
                    $("#bicycleid_baoxiu_input").next("span").text("");
                    $("#bicycleid_baoxiu_input").parent().addClass("has-error");
                    $("#bicycleid_baoxiu_input").next("span").text("编号不存在");
                    $("#bicycle_baoxiu_btn").attr("ajax-bianhao", "error");
                }
            }
        })
    });

    function jiaoyanaddform() {

        return (checkbicycleid())
    }

    $("#bicycle_baoxiu_btn").click(function () {
        if (!jiaoyanaddform()) {
            return
        }
        if ($(this).attr("ajax-bianhao") == "error") {
            return
        }
        $.ajax({
            url: "${APP_PATH}/errCRUD",
            type: "POST",
            data:$("#bicycleyhbaoxiuModal form").serialize(),

            success: function (result) {
                if (result.code == 200) {
                    $("#bicycleyhbaoxiuModal").modal("hide");
                    to_page(totalRecord);
                } else {
                    if (undefined != result.extend.err.bianhao) {
                        $("#bicycleid_baoxiu_input").parent().addClass("has-error");
                        $("#bicycleid_baoxiu_input").next("span").text("自行车编号不存在");
                    }
                }
            }
        })
    })
    $(function () {
        $("#bicycleid_baoxiu_input").blur(checkbicycleid);
    })
    $(document).on("click", ".edit_btn", function () {
        var bid=$(this).parents("tr").find("td:eq(2)").text();
        var eid=$(this).parents("tr").find("td:eq(1)").text();
        $.ajax({
            url: "${APP_PATH}/bicyclezhengchangCRUD/" + bid,
            type: "GET",
            success: function (result) {
                alert("修复成功");
            }

        })
        $.ajax({
            url: "${APP_PATH}/errCRUD/" + eid,
            type: "DELETE",
            success: function (result) {
                to_page(currentPage);
            }

        })
    })

    $(document).on("click", ".delete_btn", function () {
        var bianhao = $(this).parents("tr").find("td:eq(5)").text();
        var id = $(this).attr("delete-id");
        if (confirm("确认删除>" + bianhao + "<?")) {
            $.ajax({
                url: "${APP_PATH}/errCRUD/" + id,
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
    $("#err_delect_all_btn").click(function(){
        var bicyclebianhaos="";
        var strids="";
        $.each($(".check_item:checked"),function () {
            bicyclebianhaos +=$(this).parents("tr").find("td:eq(5)").text()+",";
            strids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        bicyclebianhaos.substring(0,bicyclebianhaos.length-1);
        strids= strids.substring(0, strids.length-1)
        if(confirm("确认删除>" + bicyclebianhaos + "<?")){
            $.ajax({
                url: "${APP_PATH}/errCRUD/" + strids,
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