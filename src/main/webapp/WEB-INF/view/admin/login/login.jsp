<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
    <script type="text/javascript" src="${path}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${path}/lib/respond.min.js"></script>
    <link href="${path}/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="${path}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="${path}/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${path}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="${path}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>


    <title>edu教务管理系统</title>

</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form id="form-admin-login" class="form form-horizontal">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="adminName" name="adminName" type="text" placeholder="账户" class="input-text size-L radius">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="adminPwd" name="adminPwd" type="password" placeholder="密码" class="input-text size-L radius">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe6cb;</i></label>
                <div class="formControls col-xs-8">
                    <input class="input-text size-L radius" id="checkCode" type="text" placeholder="验证码" name="checkCode" aria-placeholder="验证码:"  style="width:150px;">
                    <img src="checkCode" alt="" width="100" height="32" name="passCode" class="passcode radius" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input id="loginBtn" name="loginBtn"  type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <label><p id="msg" style="color: red"></p></label>
                </div>
            </div>
        </form>

    </div>
</div>
<div class="footer">Copyright Jei Lee eduSys </div>
<script type="text/javascript" src="${path}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function(){
        $("#form-admin-login").validate({
            rules:{
                adminName:{
                    required:true,
                    minlength:2,
                    maxlength:10
                },
                adminPwd:{
                    required:true,
                },
                checkCode:{
                    required:true,
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                var params = $('#form-admin-login').serialize();
                $(form).ajaxSubmit({
                    type: 'post',
                    url: '${path}/admin/doLogin' ,
                    data: params,
                    dataType: 'text',
                    success: function(data){
                        if (data=="success"){
                            window.location.href='${path}/admin/toMain';
                        }
                        else {
                            layer.msg(data,{icon:5,time:2000});
                        }
                    }
                });
            }
        });
    });
</script>

</body>
</html>