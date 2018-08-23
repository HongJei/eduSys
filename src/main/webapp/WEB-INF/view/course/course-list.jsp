<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 获取应用的路径  并给与path变量 -->
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="referrer" content="origin">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/css/style.css" />

    <title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 学院管理 <span class="c-gray en">&gt;</span> 学院列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        &nbsp;<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i>
                批量删除
            </a>
            <a class="btn btn-primary radius" onclick="course_add('添加课程','${path}/course/toAdd')" href="javascript:;">
                <i class="Hui-iconfont">&#xe600;</i> 添加课程
            </a>
        </span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="40"><input  type="checkbox" value=""></th>
                <th width="80">ID</th>
                <th width="70">课程名称</th>
                <th width="80">课程所属专业编号</th>
                <th width="40">课程学分</th>
                <th width="40">课程学时</th>
                <th width="40">课程性质</th>
                <th width="120">备注</th>
                <th width="60">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${courseList}" var="course">

                <tr class="text-c">
                    <td><input name="checkboxs" type="checkbox" value="${course.course_no}"></td>
                    <td>${course.course_no}</td>
                    <td>${course.course_name}</td>
                    <td>${course.major_no}</td>
                    <td>${course.credit}</td>
                    <td>${course.planned_hour}</td>
                    <td>${course.course_type}</td>
                    <td>${course.remarks}</td>

                    <td class="td-manage">
                        <a style="text-decoration:none" class="ml-5" onClick="course_edit('更新课程','${path}/course/toUpdate?course_no=${course.course_no}')" href="javascript:;" title="编辑">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a style="text-decoration:none" class="ml-5" onClick="course_del(this,'${course.course_no}')" href="javascript:;" title="删除">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</div>
<script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${path}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${path}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "pading":false,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[0,7]}// 不参与排序的列
        ]
    });

    function teacher_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    <!-- 添加课程页面 -->
    function course_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    <!-- 课程更新 -->
    function course_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

    <!-- 编辑课程 -->
    function course_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

    <!-- 删除课程 -->
    function course_del(obj,id){
        layer.confirm('确认要删除吗?删除课程将会删除相关的课程成绩!',function(index){
            $.ajax({
                type: 'POST',
                url: '${path}/course/delById',
                data: {"course_no":id},
                dataType: 'text',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    layer.msg('删除失败!!',{icon:5,time:4000});
                    console.log(data.msg);
                },
            });
        });
    }

    <!-- 批量删除课程 -->
    function datadel() {
        layer.confirm('确认要删除吗？',function(index){
            var course_nos = [];
            $("input:checkbox[name = checkboxs]:checked").each(function(i){
                console.log($(this).val());
                course_nos.push( $(this).val() );
            });
            $.ajax({
                traditional: true,
                type: 'POST',
                url: '${path}/course/delByIds',
                data: {course_nos:course_nos},
                dataType: "text",
                success: function(data){
                    $("input:checkbox[name = checkboxs]:checked").each(function(i){
                        $(this).parents("tr").remove();
                    });
                    layer.msg('已删除!',{icon:1,time:2000});
                },
                error:function(data) {
                    layer.msg('删除失败!',{icon:5,time:4000});
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>