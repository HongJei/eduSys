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

    <title>新增成绩</title>
</head>
<body>
<article class="page-container">
    <form class="form" id="form-grade-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>学号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:if test="${grade!=null}">
                    <input type="text" class="input-text" readonly="readonly" value="${grade.register_no}" placeholder="" id="register_no" name="register_no">
                    <input type="text" class="input-text" hidden="hidden" value="${grade.grade_no}" placeholder="" id="grade_no" name="grade_no">
                </c:if>
                <c:if test="${grade==null}">
                    <input type="text" class="input-text" value="${grade.register_no}" placeholder="" id="register_no" name="register_no">
                </c:if>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${grade.course_no}" placeholder="" id="course_no" name="course_no">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>教师编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${grade.work_id}" placeholder="" id=work_id" name="work_id">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程成绩：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${grade.final_grade}" placeholder="" id="final_grade" name="final_grade">
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否补考：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="makeup_flag" type="radio" value="1" id="status-1" checked>
                    <label for="status-1">补考</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="status-2" value="0" name="makeup_flag">
                    <label for="status-2">非补考</label>
                </div>
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
        $("#form-grade-add").validate({
            rules:{
                register_no:{
                    required:true,
                    minlength:2,
                    maxlength:20
                },
                work_id:{
                    required:true,
                    minlength:2,
                    maxlength:10
                },
                course_no:{
                    required:true,
                },
                final_grade:{
                    required:true,
                    digits:true
                },
                makeup_flag:{
                    required:true,
                }
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var params = $("#form-grade-add").serialize();

                var url = "${path}/grade/addGrade";
                if (${grade!=null}){
                    url = "${path}/grade/doUpdate";
                }
                layer.confirm('确认提交吗？',function(index){
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data:params,
                        dataType: "text",
                        success: function(data){
                            layer.msg("成功",{icon:6,time:2000});
                            $('#form-grade-add')[0].reset();
                        },
                        error:function(data) {
                            layer.msg("失败!请检查教师/课程编号",{icon:5,time:4000});
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