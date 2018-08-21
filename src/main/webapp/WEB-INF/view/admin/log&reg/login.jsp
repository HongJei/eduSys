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
  <script type="text/javascript" src="${path}/lib/html5shiv.js"></script>
  <script type="text/javascript" src="${path}/lib/respond.min.js"></script>
  <link href="${path}/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
  <link href="${path}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
  <link href="${path}/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
  <link href="${path}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${path}/lib/myjs.js"></script>
  <script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>
  <script type="text/javascript" src="${path}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
  <script>DD_belatedPNG.fix('*');</script>

  <script type="text/javascript">
      function login() {
          /*表单验证*/
          //序列化表单数据
          if($("#adminName").val() == "") {
              $("#msg").text("请输入账户");
              $("#adminName").focus();
              return false;
          }
          if($("#adminPwd").val() == "") {
              $("#msg").text("请输入密码");
              $("#adminPwd").focus();
              return false;
          }
          if($("#checkCode").val() == "") {
              $("#msg").text("请输入验证码");
              $("#checkCode").focus();
              return false;
          }
          $("#msg").text("");
              var params = $("#logForm").serialize();
              $.ajax({
                  type:"POST",
                  url:'${path}/admin/doLogin',
                  data:params,
                  success:function (data) {
                      if (data!=""){
                          window.location.href = "${path}/"+data;
                      }
                      else{
                          location.reload();

                      }
                  }
              });
      }

  </script>

  <title>edu教务管理系统</title>

</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form id="logForm" class="form form-horizontal"  method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="adminName" name="adminName" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="adminPwd" name="adminPwd" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" id="checkCode" type="text" placeholder="验证码" name="checkCode" aria-placeholder="验证码:" style="width:150px;">
          <img src="checkCode" alt="" width="100" height="32" name="passCode" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
          <p id="msg" style="color: RED;">${msg}</p>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="loginBtn" name="loginBtn" onclick="login()" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright Jei Lee eduSys </div>


</body>
</html>