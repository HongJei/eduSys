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
    <form class="form form-horizontal" id="form-student-add" enctype="multipart/form-data">
        <div class="row cl">
            <c:if test="${student!=null}">
                <input type="text" class="input-text" value="${student.register_no}" hidden="hidden"  name="aId">
            </c:if>
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学生姓名：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text"  value="${student.s_name}" placeholder="" id="s_name" name="s_name">
                </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="register_no" class="input-text" autocomplete="off" value="${student.register_no}" placeholder="学号" id="register_no">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="s_gender" type="radio" value="男" id="status-1" checked>
                    <label for="status-1">男</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="status-2" value="女" name="s_gender">
                    <label for="status-2">女</label>
                </div>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出生日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="date" class="input-text" value="${student.s_dateofbirth}" placeholder="" id="s_dateofbirth" name="s_dateofbirth">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="major_no" class="input-text">
                    <c:if test="${student!=null}">
                        <option value="${student.major_no}">当前专业:${sutdent.major.major_name}----${student.major_no}</option>
                    </c:if>
                    <option>--请选择--</option>
                    <c:forEach items="${majorList}" var="major">
                        <option value="${major.major_no}">${major.major_name}----${major.major_no}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>家庭住址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${student.s_address}" placeholder="家庭住址" name="s_address" id="s_address">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系号码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${student.s_tele}" placeholder="联系号码" name="s_tele" id="s_tele">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${student.s_email}" placeholder="家庭住址" name="s_email" id="s_email">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="graduation" type="radio" value="1" id="status-3" checked>
                    <label for="status-3">毕业</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="status-4" value="0" name="graduation">
                    <label for="status-4">未毕业</label>
                </div>
            </div>
        </div>

        <c:if test="${student!=null}">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">
                    当前头像:
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                        ${student.s_img}
                </div>
            </div>
        </c:if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">肖像上传：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <label class="uploadImg">
                    <input type="hidden" value="${student.s_img}" name="s_img" >
                    <input type="file" name="pictureFile" />
                </label>
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

        $("#form-student-add").validate({
            rules:{
                register_no:{
                    required:true,
                    minlength:4,
                    maxlength:16
                },
                major_no:{
                    required:true,
                },
                s_name:{
                    required:true,
                    minlength:2,
                    maxlength:10
                },
                s_img:{
                    required:true,
                },
                s_gender:{
                    required:true,
                },
                s_dateofbirth:{
                    required:true,
                },
                s_class:{
                    required:true,
                },
                s_address:{
                    required:true,
                },
                s_tele:{
                    required:true,
                    isPhone:true
                },
                s_email:{
                    required:true,
                    email:true
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var student = $('#form-student-add').serialize();
                var url = "${path}/student/addStudent";
                if (${student!=null}){
                    url = "${path}/student/doUpdate";
                }
                layer.confirm('确认提交吗？',function(index){
                    $(form).ajaxSubmit({
                        traditional: true,
                        type: 'post',
                        url: url ,
                        data: student,
                        dataType: 'text',
                        success: function(data){
                            layer.msg('操作成功!',{icon:1,time:3000});
                            $('#form-student-add')[0].reset();
                        },
                        error: function(e){
                            var res = $.parseJSON(e.responseText);
                            console.log(res.msg);
                            // layer.msg('操作失败!学号已存在!',{icon:5,time:4000});
                        }
                    });

                });
            }
        });
    });
</script>
</body>
</html>