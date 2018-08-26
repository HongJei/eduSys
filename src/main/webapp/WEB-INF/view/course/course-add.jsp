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
    <link rel="Bookmark" href="${path}/images/favicon.ico" >
    <link rel="Shortcut Icon" href="${path}/images/favicon.ico" />
    <script type="text/javascript" src="${path}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${path}/lib/respond.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/css/style.css" />
    <script type="text/javascript" src="${path}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>

    <title>新增学院</title>
</head>
<body>
<article class="page-container">
    <form class="form" id="form-course-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:if test="${course!=null}">
                    <input type="text" class="input-text" style="border: none" readonly="readonly" value="${course.course_no}" placeholder="" id="course_no" name="course_no">
                </c:if>
                <c:if test="${course==null}">
                    <input type="text" class="input-text" value="" placeholder="" id="course_no" name="course_no">
                </c:if>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${course.course_name}" placeholder="" id="course_name" name="course_name">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程所属专业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="major_no" class="input-text">
                    <c:if test="${course!=null}">
                        <option>当前专业:${course.major.major_name}----${course.major.major_no}</option>
                    </c:if>
                    <c:if test="${course==null}">
                        <option>---选择---</option>
                    </c:if>
                    <c:forEach items="${majorList}" var="major">
                        <option value="${major.major_no}">${major.major_name}----${major.major_no}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程学分：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${course.credit}" placeholder=""  name="credit">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程学时：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${course.planned_hour}" placeholder=""  name="planned_hour">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程性质：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="course_type" class="input-text">
                    <c:if test="${course!=null}">
                        <option>当前课程性质:${course.course_type}</option>
                    </c:if>
                    <c:if test="${course==null}">
                        <option>---选择---</option>
                    </c:if>
                    <option value="专业课">专业课</option>
                    <option value="公选课">公选课</option>
                    <option value="体育课">体育课</option>
                </select>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder=""  name="remarks">
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="" class="btn btn-primary radius" type="submit">
                    <i class="Hui-iconfont">&#xe632;</i> 保存
                </button>
                <button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</article>

<script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${path}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${path}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${path}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        <!-- 表单验证 -->
        $("#form-course-add").validate({
            rules:{
                course_no:{
                    required:true,
                    minlength:2,
                    maxlength:10
                },
                course_name:{
                    required:true,
                    minlength:2,
                    maxlength:10
                },
                major_no:{
                    required:true,
                },
                credit:{
                    required:true,
                    digits:true
                },
                planned_hour:{
                    required:true,
                },
                course_type:{
                    required:true,
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var params = $("#form-course-add").serialize();

                var url = "${path}/course/doAdd";
                if (${course!=null}){
                    url = "${path}/course/doUpdate";
                }
                alert(params);
                layer.confirm('确认提交吗？',function(index){
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data:params,
                        dataType: "text",
                        success: function(data){
                            layer.msg('操作成功!',{icon:6,time:2000});
                            $('#form-course-add')[0].reset();
                        },
                        error:function(data) {
                            layer.msg('操作失败!',{icon:6,time:4000});
                            console.log(data.msg);
                        },
                    });
                });
            },
            invalidHandler: function(form, validator) {return false;}
        });
    });
</script>
</body>
</html>