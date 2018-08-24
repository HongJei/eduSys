<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 获取应用的路径  并给与path变量 -->
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程计划管理 <span class="c-gray en">&gt;</span> 课程计划列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        &nbsp;<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i>
                批量删除
            </a>
            <a href="javascript:;" onclick="tc_add('添加课程计划','${path}/tc/toAdd','800','500')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加课程计划
            </a>
        </span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" ></th>
                <th width="80">ID</th>
                <th width="120">课程</th>
                <th width="100">教师</th>
                <th width="100">开课日期</th>
                <th width="100">开课学期</th>
                <th width="60">课程完成情况</th>
                <th width="60">审核情况</th>
                <th width="60">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${tcList}" var="tc">
                <tr class="text-c">
                    <td><input type="checkbox" value="${tc.tc_no}" name="checkboxs"></td>
                    <td>${tc.tc_no}</td>
                    <td>${tc.course.course_name}</td>
                    <td>${tc.teacher.t_name}</td>
                    <td>${tc.launch_year}</td>
                    <td>${tc.launch_term}</td>
                    <td>${tc.executed_plan}</td>
                    <td class="td-status">
                        <c:if test="${tc.audit==1}">
                            <span class="label label-success radius">通过</span>
                        </c:if>
                        <c:if test="${tc.audit==0}">
                            <span class="label radius">未通过</span>
                        </c:if>
                    </td>
                    <td class="f-14 td-manage">
                        <c:if test="${tc.audit==1}">
                            <a style="text-decoration:none" onClick="tc_stop(this,'${tc.tc_no}')" href="javascript:;" title="未通过">
                                <i class="Hui-iconfont">&#xe631;</i>
                            </a>
                        </c:if>
                        <c:if test="${tc.audit==0}">
                            <a style="text-decoration:none" onClick="tc_start(this,'${tc.tc_no}')" href="javascript:;" title="通过">
                                <i class="Hui-iconfont">&#xe615;</i>
                            </a>
                        </c:if>
                        <a title="编辑" href="javascript:;" onclick="tc_edit('课程计划编辑','${path}/tc/findById?tc_no=${tc.tc_no}','800','500')" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a style="text-decoration:none" class="ml-5" onClick="tc_del(this,'${tc.tc_no}')" href="javascript:" title="删除">
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


    <!--增加课程计划-->
    function tc_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    <!--删除课程计划-->
    function tc_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${path}/tc/delById',
                data: {"tc_no":id},
                dataType: 'text',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg(data,{icon:1,time:1000});
                },
                error:function(data) {
                    layer.msg(data,{icon:5,time:4000});
                },
            });
        });
    }

    <!--批量删除-->
    function datadel() {
        layer.confirm('确认要删除吗？',function(index){
            var Ids = [];
            $("input:checkbox[name = checkboxs]:checked").each(function(i){
                console.log($(this).val());
                Ids.push( $(this).val() );
            });
            $.ajax({
                traditional: true,
                type: 'POST',
                url: '${path}/tc/delByIds',
                data:{tc_nos:Ids},
                dataType:"text",
                success: function(data){
                    $("input:checkbox[name = colcheck]:checked").each(function(i){
                        $(this).parents("tr").remove();
                    });
                    layer.msg(data,{icon:1,time:6000});

                },
                error:function(data) {
                    layer.msg("删除失败!",{icon:5,time:2000});
                },
            });
        });
    }

    <!--编辑课程计划-->
    function tc_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }

    function tc_stop(obj,id){
        layer.confirm('确认要不通过吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'POST',
                url: '${path}/tc/updateStatus',
                data: {"tc_no":id,"status":0},
                dataType: "text",
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="tc_start(this,'+data+')" href="javascript:;" title="通过" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label  radius">未通过</span>');
                    $(obj).remove();
                    layer.msg("更新成功",{icon: 1,time:1000})
                },
                error:function(data) {
                    layer.msg(data,{icon: 5,time:5000});
                },
            });
            ;
        });
    }

    function tc_start(obj,id){
        layer.confirm('确认要通过吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'POST',
                url: '${path}/tc/updateStatus',
                data: {"tc_no":id,"status":1},
                dataType: "text",
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="tc_stop(this,'+data+')" href="javascript:;" title="不通过" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">通过</span>');
                    $(obj).remove();
                    layer.msg("更新成功", {icon: 1,time:1000});
                },
                error:function(data) {
                    layer.msg(data,{icon: 5,time:5000});
                },
            });


        });
    }

</script>
</body>
</html>