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
    <form class="form form-horizontal" id="form-admin-add">
        <div class="row cl">
            <c:if test="${admin!=null}">
                <input type="text" class="input-text" value="${admin.aId}" hidden="hidden"  name="aId">
            </c:if>
            <c:if test="${admin==null}">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text"  placeholder="" id="adminName" name="adminName">
                </div>
            </c:if>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" name="adminPwd" class="input-text" autocomplete="off" value="${admin.adminPwd}" placeholder="密码" id="password">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" name="password_confirm" class="input-text" autocomplete="off"  placeholder="确认新密码" >
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${admin.adminPhone}" placeholder="" id="phone" name="adminPhone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${admin.adminEmail}" placeholder="@" name="adminEmail" id="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">角色：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
			<select class="select" id="permissions" name="permissions" size="1">
				<option value="超级管理员">超级管理员</option>
				<option value="管理员">管理员</option>
			</select>
			</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="adminStatus" type="radio" value="1" id="status-1" checked>
                    <label for="status-1">启用</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="status-2" value="0" name="adminStatus">
                    <label for="status-2">停用</label>
                </div>

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

        $("#form-admin-add").validate({
            rules:{
                adminName:{
                    required:true,
                    minlength:4,
                    maxlength:16
                },
                adminPwd:{
                    required:true,
                },
                password_confirm:{
                    required:true,
                    equalTo: '#password'
                },
                adminPhone:{
                    required:true,
                    isPhone:true,
                },
                adminEmail:{
                    required:true,
                    email:true,
                },
                permissions:{
                    required:true,
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var params = $('#form-admin-add').serialize();
                var url = "${path}/admin/addAdmin";
                if (${admin!=null}){
                    url = "${path}/admin/doUpdate";
                }
                layer.confirm('确认提交吗？',function(index){
                    $(form).ajaxSubmit({
                        type: 'post',
                        url: url ,
                        data: params,
                        dataType: 'text',
                        success: function(data){
                            layer.msg('操作成功!',{icon:1,time:3000});
                            $('#form-admin-add')[0].reset();
                        },
                        error: function(data){
                            layer.msg('操作失败!登录名已存在!',{icon:5,time:4000});
                        }
                    });

                });
            }
        });
    });
</script>
</body>
</html>