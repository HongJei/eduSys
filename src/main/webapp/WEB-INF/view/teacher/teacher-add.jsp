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
    <title>新增图片</title>
    <link href="${path}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />


</head>
<body>
<div class="page-container">
    <form class="form form-horizontal" id="form-teacher-add" enctype="multipart/form-data">
        <div class="row cl">
            <c:if test="${teacher!=null}">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>教师编号：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" readonly="readonly" value="${teacher.work_id}"   name="work_id">
                </div>
            </c:if>
            <c:if test="${teacher==null}">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>教师编号：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="" id="work_id"  name="work_id">
                </div>
            </c:if>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>教师名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${teacher.t_name}" placeholder="" id="t_name"  name="t_name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">性别：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input  type="radio" value="男" name="t_gender" checked>
                    <label for="status-1">男</label>
                </div>

                <div class="radio-box">
                    <input type="radio" value="女" name="t_gender">
                    <label for="status-2">女</label>
                </div>

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input type="radio" value="1" name="t_status" id="status-1" checked>
                    <label for="status-1">工作中</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="status-2" value="0" name="t_status">
                    <label for="status-2">空闲</label>
                </div>

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>联系号码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${teacher.t_telephone}" placeholder="" id="t_telephone"  name="t_telephone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${teacher.t_email}" placeholder="@" name="t_email" id="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">联系地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${teacher.t_address}" placeholder="" id="t_address"  name="t_address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分属学院：</label>
            <div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select id="department" class="select" name="college_no" onchange="change(this)">
                    <c:if test="${teacher!=null}">
                        <option checked value="${teacher.college_no}">当前所属学院编号:${teacher.college_no}</option>
                        <c:forEach items="${collegeList}" var="college">
                            <option value="${college.college_no}">${college.college_name}</option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${teacher==null}">
                        <option checked>请选择学院:</option>
                        <c:forEach items="${collegeList}" var="college">
                            <option value="${college.college_no}">${college.college_name}</option>
                        </c:forEach>
                    </c:if>
                </select>
				</span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分属专业：</label>
            <div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select id="professional" class="select" name="major_no">
                    <c:if test="${teacher!=null}">
                        <option checked value="${teacher.major_no}">当前所属专业编号:${teacher.major_no}</option>
                    </c:if>
                </select>
				</span>
            </div>
        </div>
        <c:if test="${teacher!=null}">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    当前头像:
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                        ${teacher.t_img}
                </div>
            </div>
        </c:if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                肖像上传：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="item_name" style="width: 120px;">上传图片：</span>
                <label class="uploadImg">
                    <input type="hidden" value="${teacher.t_img}" name="t_img" >
                    <input type="file" name="pictureFile" />
                </label>
            </div>

        </div>


        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${path}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${path}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${path}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript">
    $(function() {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            $("#form-teacher-add").validate({
                rules:{
                    t_name:{
                        required:true,
                        minlength:2,
                        maxlength:16
                    },
                    work_id:{
                        required:true,
                        minlength:2,
                        maxlength:10
                    },
                    t_telephone:{
                        required:true,
                        isPhone:true
                    },
                    college_no:{
                        required:true,
                    },
                    major_no:{
                        required:true,
                    },
                    t_email:{
                        required:true,
                        email:true
                    },
                },
                onkeyup:false,
                focusCleanup:true,
                success:"valid",
                submitHandler:function(form){
                    var params = $('#form-teacher-add').serialize();
                    var url = "${path}/teacher/addTeacher";
                    if (${teacher!=null}){
                        url = "${path}/teacher/doUpdate";
                    }
                    alert(url);
                    alert(params);
                    layer.confirm('确认提交吗？',function(index){
                        $(form).ajaxSubmit({
                            type: 'post',
                            url: url ,
                            data: params,
                            dataType: 'text',
                            success: function(data){
                                layer.msg('操作成功!',{icon:1,time:3000});
                                $('#form-teacher-add')[0].reset();
                            },
                            error: function(data){
                                layer.msg('操作失败!编号已存在!',{icon:5,time:4000});
                            }
                        });

                    });
                }
            });
        }
    );

    //根据parentid，读取数据，然后返回
    function getData(parentId , callback){
        $.ajax({
            url : '${path}/major/getToJson',//后台数据地址
            data : {parentId : parentId},//请求parentid的数据
            dataType: "json",
            success : function(result){
                callback(result);
            },
            error : function (textStatus, errorThrown) {
                alert(textStatus+errorThrown);
            }
        })
    }

    function renderOptions(arr , el){//生成select 的 option
        el.empty();
        $.each(arr , function(index , item){
            $('<option/>').attr({
                value : item.major_no
            }).html(item.major_name).appendTo(el);
        })
    }


    var professional = $('#professional');//专业的select
    function change(el){//当系变化的时候
        var parentId = $(el).val();//这里得到选择的系的id
        getData(parentId , function(data){
            professional.empty();
            renderOptions(data , professional );//这里生成专业的select
        });
    }

</script>
</body>
</html>