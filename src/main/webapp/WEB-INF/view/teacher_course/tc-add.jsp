<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8"%>
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
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-tc-add">
        <div class="row cl">
            <c:if test="${tc!=null}">
                <input type="text" class="input-text" value="${tc.tc_no}" hidden="hidden"  name="tc_no">
            </c:if>
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>课程：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="course_no" class="input-text">
                    <c:if test="${tc!=null}">
                        <option checked value="${tc.course_no}">当前课程:${tc.course.course_name}----${tc.course_no}</option>
                        <c:forEach items="${courseList}" var="course">
                            <option value="${course.course_no}">${course.course_name}</option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${tc==null}">
                        <option>--选择--</option>
                        <c:forEach items="${courseList}" var="course" >
                            <option value="${course.course_no}">${course.course_name}----${course.course_no}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>教师：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="work_id" class="input-text">

                    <c:if test="${tc!=null}">
                        <option checked value="${tc.tc_no}">当前教师:${tc.teacher.t_name}----${tc.work_id}</option>
                        <c:forEach items="${teacherList}" var="teacher">
                            <option value="${teacher.work_id}">${teacher.t_name}</option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${tc==null}">
                        <option>--选择--</option>
                        <c:forEach items="${teacherList}" var="teacher" >
                            <option value="${teacher.work_id}">${teacher.t_name}----${teacher.work_id}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>开课时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="date"  name="launch_year" class="input-text" autocomplete="off"  placeholder="开课时间" >
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>开课学期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="launch_term" class="input-text">
                    <option>--选择--</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>完成情况：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${tc.executed_plan}" placeholder="完成情况" name="executed_plan" id="executed_plan">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">审核情况：</label>
            <div class="radio-box">
                <input  type="radio" value="1" id="status-1" name="audit" checked>
                <label for="status-1">通过</label>
            </div>
            <div class="radio-box">
                <input type="radio" value="0" id="status-2" name="audit">
                <label for="status-2">未通过</label>
            </div>
        </div>


        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${path}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-tc-add").validate({
            rules:{
                course_no:{
                    required:true,
                },
                work_id:{
                    required:true,
                },
                launch_year:{
                    required:true,
                },
                launch_term:{
                    required:true,
                },
                executed_plan:{
                    required:true,
                },
                audit:{
                    required:true,
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var params = $('#form-tc-add').serialize();
                var url = "${path}/tc/addTC";
                if (${tc!=null}){
                    url = "${path}/tc/updateTC";
                }
                layer.confirm('确认提交吗？',function(index){
                    $(form).ajaxSubmit({
                        type: 'post',
                        url: url ,
                        data: params,
                        dataType: 'text',
                        success: function(data){
                            layer.msg('操作成功!',{icon:1,time:3000});
                            $('#form-tc-add')[0].reset();
                        },
                        error: function(data){
                            layer.msg('操作失败!',{icon:5,time:4000});
                        }
                    });

                });
            }
        });
    });
</script>
</body>
</html>