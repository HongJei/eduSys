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
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/static/h-ui.admin/css/style.css" />
    <script type="text/javascript" src="${path}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <title>我的桌面</title>
</head>
<body>
<div class="page-container">
    <p class="f-20 text-success">欢迎使用 eduSys 教务管理系统 <span class="f-14">v3.1</span></p>
    <p>登录次数：18 </p>
    <p>本次登录IP：111.11.111.11 ** 上次登录IP：222.35.131.79.1 ** 上次登录时间：2014-6-14 11:19:55</p>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th colspan="7" scope="col">信息统计</th>
        </tr>
        <tr class="text-c">
            <th>统计</th>
            <th>学生库</th>
            <th>教师库</th>
            <th>用户库</th>
            <th>管理员库</th>
        </tr>
        </thead>
        <tbody>
        <tr class="text-c">
            <td>总数</td>
            <td>92</td>
            <td>9</td>
            <td>0</td>
            <td>8</td>
        </tr>

        </tbody>
    </table>
    <table class="table table-border table-bordered table-bg mt-20">
        <thead>
        <tr>
            <th colspan="2" scope="col">服务器信息</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th width="30%">服务器计算机名</th>
            <td><span id="lbServerName">http://127.0.0.1/</span></td>
        </tr>
        <tr>
            <td>服务器IP地址</td>
            <td>192.168.1.1</td>
        </tr>
        <tr>
            <td>服务器域名</td>
            <td>www.h-ui.net</td>
        </tr>
        </tbody>
    </table>
</div>
<footer class="footer mt-20">
    <div class="container">
        <p>
            Copyright &copy;2015-2018 eduSys v3.1 All Rights Reserved.<br>
            本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架"></a>Jei Lee提供技术支持</p>
    </div>
</footer>
<script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>

</body>
</html>