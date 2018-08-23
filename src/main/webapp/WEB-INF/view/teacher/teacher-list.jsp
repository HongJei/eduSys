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
            <a class="btn btn-primary radius" onclick="teacher_add('添加教师','${path}/teacher/toAddTeacher')" href="javascript:;">
                <i class="Hui-iconfont">&#xe600;</i> 添加教师
            </a>
        </span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="40"><input  type="checkbox" value=""></th>
                <th width="80">ID</th>
                <th width="70">姓名</th>
                <th width="80">肖像</th>
                <th width="40">性别</th>
                <th width="40">专业</th>
                <th width="40">所属学院</th>
                <th width="120">地址</th>
                <th width="120">联系电话</th>
                <th width="120">邮箱</th>
                <th width="60">状态</th>
                <th width="80">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${teacherList}" var="teacher">

                <tr class="text-c">
                    <td><input name="checkboxs" type="checkbox" value="${teacher.work_id}"></td>
                    <td>${teacher.work_id}</td>
                    <td>${teacher.t_name}</td>
                    <td>
                        <a href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')">
                            <img width="60" height="50" class="picture-thumb" src="/eduSys/images/teacher/${teacher.t_img}">
                        </a>
                    </td>
                    <td class="text-l">${teacher.t_gender}</td>
                    <td class="text-c">${teacher.major_no}</td>
                    <td>${teacher.college_no}</td>
                    <td>${teacher.t_address}</td>
                    <td>${teacher.t_telephone}</td>
                    <td>${teacher.t_email}</td>
                    <td class="td-status">
                        <c:if test="${teacher.t_status==1}">
                            <span class="label label-success radius">工作</span>
                        </c:if>
                        <c:if test="${teacher.t_status==0}">
                            <span class="label  radius">休假</span>
                        </c:if>
                    </td>
                    <td class="td-manage">
                        <c:if test="${teacher.t_status==1}">
                            <a style="text-decoration:none" onClick="teacher_stop(this,'${teacher.work_id}')" href="javascript:;" title="休假">
                                <i class="Hui-iconfont">&#xe631;</i>
                            </a>
                        </c:if>
                        <c:if test="${teacher.t_status==0||teacher.t_status==null}">
                            <a style="text-decoration:none" onClick="teacher_start(this,'${teacher.work_id}')" href="javascript:;" title="工作">
                                <i class="Hui-iconfont">&#xe615;</i>
                            </a>
                        </c:if>


                        <a style="text-decoration:none" class="ml-5" onClick="teacher_edit('更新教师','${path}/teacher/toUpdate?work_id=${teacher.work_id}')" href="javascript:;" title="编辑">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a style="text-decoration:none" class="ml-5" onClick="teacher_del(this,'${teacher.work_id}')" href="javascript:;" title="删除">
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
            {"orderable":false,"aTargets":[0,11]}// 不参与排序的列
        ]
    });
    /*教师-添加*/
    function teacher_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function picture_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*教师更新*/
    function teacher_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }


    /*教师休假*/
    function teacher_stop(obj,id){
        layer.confirm('确认更新吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'POST',
                url: '${path}/teacher/updateStatus',
                data: {"work_id":id,"status":0},
                dataType: "text",
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="teacher_start(this,'+data+')" href="javascript:;" title="工作" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label  radius">休假</span>');
                    $(obj).remove();
                    layer.msg('已更新!',{icon: 5,time:1000})
                },
                error:function(data) {
                    layer.msg('更新失败!',{icon: 5,time:5000});
                    console.log(data.msg);
                },
            });
            ;
        });
    }

    /*教师工作*/
    function teacher_start(obj,id){
        layer.confirm('确认要更新吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'POST',
                url: '${path}/teacher/updateStatus',
                data: {"work_id":id,"status":1},
                dataType: "text",
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="teacher_stop(this,'+data+')" href="javascript:;" title="休假" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">工作</span>');
                    $(obj).remove();
                    layer.msg('已更新!', {icon: 6,time:1000});
                },
                error:function(data) {
                    layer.msg('更新失败!',{icon: 5,time:5000});
                    console.log(data.msg);
                },
            });


        });
    }


    /*图片-编辑*/
    function picture_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*教师-删除*/
    function teacher_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '${path}/teacher/delById',
                data: {"work_id":id},
                dataType: 'text',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    layer.msg('删除失败!该教师相关信息尚未删除!',{icon:5,time:4000});
                    console.log(data.msg);
                },
            });
        });
    }

    /*教师-批量删除*/
    function datadel() {
        layer.confirm('确认要删除吗？',function(index){
            var Ids = [];
            $("input:checkbox[name = checkboxs]:checked").each(function(i){
                //使用循环遍历迭代的方式得到所有被选中的checkbox复选框
                console.log($(this).val());
                Ids.push( $(this).val() ); //当前被选中checkbox背后对应的值
            });
            $.ajax({
                traditional: true,
                type: 'POST',
                url: '${path}/teacher/delByIds',
                data:{Ids:Ids},
                dataType:"text",
                success: function(data){
                    $("input:checkbox[name = checkboxs]:checked").each(function(i){
                        $(this).parents("tr").remove();
                    });
                    layer.msg('已删除!',{icon:1,time:6000});

                },
                error:function(data) {
                    layer.msg('出现异常!',{icon:5,time:2000});
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>