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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 学生管理 <span class="c-gray en">&gt;</span> 学生列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        &nbsp;<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i>
                批量删除
            </a>
            <a href="javascript:;" onclick="student_add('添加学生','${path}/student/toAdd','800','500')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加学生
            </a>
        </span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" ></th>
                <th width="100">ID</th>
                <th width="60">名称</th>
                <th width="100">肖像</th>
                <th width="40">性别</th>
                <th width="100">出生日期</th>
                <th width="80">班别</th>
                <th width="120">家庭住址</th>
                <th width="120">联系号码</th>
                <th width="120">邮箱</th>
                <th width="60">状态</th>
                <th width="60">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${studentList}" var="student">
                <tr class="text-c">
                    <td><input type="checkbox" value="${student.register_no}" name="colcheck"></td>
                    <td>${student.register_no}</td>
                    <td>${student.s_name}</td>
                    <td>
                        <a href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')">
                            <img width="60" height="50" class="picture-thumb" src="/eduSys/images/student/${student.s_img}">
                        </a>
                    </td>
                    <td>${student.s_gender}</td>
                    <td>${student.s_dateofbirth}</td>
                    <td>${student.major.major_name}</td>
                    <td>${student.s_address}</td>
                    <td>${student.s_tele}</td>
                    <td>${student.s_email}</td>
                    <td class="td-status">
                        <c:if test="${student.graduation==1}">
                            <span class="label label-success radius">毕业</span>
                        </c:if>
                        <c:if test="${student.graduation==0}">
                            <span class="label radius">未毕业</span>
                        </c:if>
                    </td>
                    <td class="f-14 td-manage">
                        <c:if test="${student.graduation==1}">
                            <a style="text-decoration:none" onClick="student_stop(this,'${student.register_no}')" href="javascript:;" title="未毕业">
                                <i class="Hui-iconfont">&#xe631;</i>
                            </a>
                        </c:if>
                        <c:if test="${student.graduation==0||student.graduation==null}">
                            <a style="text-decoration:none" onClick="student_start(this,'${student.register_no}')" href="javascript:;" title="毕业">
                                <i class="Hui-iconfont">&#xe615;</i>
                            </a>
                        </c:if>

                        <a title="编辑" href="javascript:;" onclick="student_edit('学生编辑','${path}/student/toUpdate?register_no=${student.register_no}','800','500')" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a style="text-decoration:none" class="ml-5" onClick="student_del(this,'${student.register_no}')" href="javascript:" title="删除">
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
        "aaSorting": [[ 1, "desc" ]],
        "bStateSave": true,
        "pading":false,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[0,11]}
        ]
    });

    function student_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    function student_del(obj,id){
        layer.confirm('确认要删除吗？将会删除该学生的所有信息!',function(index){
            $.ajax({
                type: 'POST',
                url: '${path}/student/delById',
                data: {"register_no":id},
                dataType: 'text',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg(data.toString(),{icon:1,time:1000});
                },
                error:function(data) {
                    layer.msg(data.toString(),{icon:5,time:4000});
                    console.log(data.msg);
                },
            });
        });
    }


    <!--批量删除-->
    function datadel() {
        layer.confirm('确认要删除吗？',function(index){
            var Ids = [];
            $("input:checkbox[name = colcheck]:checked").each(function(i){
                //使用循环遍历迭代的方式得到所有被选中的checkbox复选框
                console.log($(this).val());
                Ids.push( $(this).val() ); //当前被选中checkbox背后对应的值
            });
            $.ajax({
                traditional: true,
                type: 'POST',
                url: '${path}/student/delByIds',
                data:{register_nos:Ids},
                dataType:"text",
                success: function(data){
                    $("input:checkbox[name = colcheck]:checked").each(function(i){
                        $(this).parents("tr").remove();
                    });
                    layer.msg('已删除!',{icon:1,time:6000});

                },
                error:function(data) {
                    layer.msg('未选择!',{icon:5,time:2000});
                    console.log(data.msg);
                },
            });
        });
    }



    function student_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }
    <!--  -->
    function student_stop(obj,id){
        layer.confirm('请确认',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'POST',
                url: '${path}/student/updateStatus',
                data: {"register_no":id,"status":0},
                dataType: "text",
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="student_start(this,'+data+')" href="javascript:;" title="毕业" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label  radius">未毕业</span>');
                    $(obj).remove();
                    layer.msg("更新成功",{icon: 1,time:1000})
                },
                error:function(data) {
                    layer.msg('更新失败!',{icon: 5,time:5000});
                },
            });
            ;
        });
    }

    <!-- 毕业 -->
    function student_start(obj,id){
        layer.confirm('请确认',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: 'POST',
                url: '${path}/student/updateStatus',
                data: {"register_no":id,"status":1},
                dataType: "text",
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="student_stop(this,'+data+')" href="javascript:;" title="未毕业" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">毕业</span>');
                    $(obj).remove();
                    layer.msg("操作成功", {icon: 6,time:1000});
                },
                error:function(data) {
                    layer.msg("更新失败!",{icon: 5,time:5000});
                    console.log(data.msg);
                },
            });


        });
    }
</script>
</body>
</html>