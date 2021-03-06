<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wangjunling
  Date: 2017/3/31
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/path.jsp"%>
<link rel="stylesheet" href="${basePath}/resources/AdminLTE/plugins/datatables/dataTables.bootstrap.css">

<input id="menuTarget" type="hidden" value="adminAdd"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                操作员管理
                <%--<small>操作员添加</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 操作员管理</a></li>
                <li class="active">操作员添加</li>
            </ol>
        </section>


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Horizontal Form -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">操作员添加</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form class="form-horizontal" id="addAdminForm" action="${basePath}/admin/add" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label  class="col-sm-4 control-label">姓名<em style="color:red;">*</em></label>

                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="userName" id="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">手机<em style="color:red;">*</em></label>

                                        <div class="col-sm-4">
                                            <input type="text"   name="phone"  class="form-control" id="phone" >
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">邮箱<em style="color:red;">*</em></label>

                                        <div class="col-sm-3">
                                            <input type="text"  name="email"  class="form-control" id="email">
                                        </div>
                                        <div style="margin-top: 0.22%;padding-left: 3%;">@pingansec.com</div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-4">
                                            <button type="submit" class="btn btn-primary">保存</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">

                                </div>
                                <!-- /.box-footer -->
                            </form>
                        </div>
                        <!-- /.box -->

                    </div>



                </div>
            </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>

<script src="${basePath}/resources/AdminLTE/plugins/validate/jquery.validate.min.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/validate/messages_zh.min.js"></script>

<script>
    var session = '${sessionScope.user_session.XUser.superAdmin}';
    console.log(session);
    $().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
       var  addAdminForm = $("#addAdminForm").validate({
//            debug:true,
            rules: {
                phone:{
                    required:true,
                    digits:true,
                    minlength:11,
                    maxlength:11,
                    mobile:true,
                    remote:{
                        url:'${basePath}/admin/isused',
                        data:{
                            paramValue:function(){return $("[name=phone]").val();},
                            paramName:"phone"
                        }}},
                userName: {
                    required:true,
                    remote:{
                        url:'${basePath}/admin/isused',
                        data:{
                            paramValue:function(){return $("[name=userName]").val();},
                            paramName:"user_name"
                        }
                    }
                },
                email: {
                    required:true,
                    emailprefix:true
                }
            },
            messages: {
                userName:{
                    required:'请填写姓名',
                    remote:'该操作员已存在，请更换新名称'
                },
                phone:{
                    required:'请填写手机号',
                    minlength:'手机号为11位',
                    maxlength:'手机号为11位',
                    mobile:'请输入正确的手机号',
                    remote:'该手机号已存在，请更换新手机号'
                },
                email:{
                    required:'请填写邮箱',
                    emailprefix:'请填写后缀为@pingansec.com的企业邮箱名，后缀不用填',
//                    minlength:'请至少选择2项服务'
                },
//                email: "请输入一个正确的邮箱",
            },
           errorPlacement: function(error, element) {
                   error.css('color', 'red');
                   error.appendTo(element.parent());
           },
           errorElement: "span",
           submitHandler: function(form) {
               $(".btn").prop('disabled', 'disabled');
               var param = $("#addAdminForm").serialize();

               $.ajax({
                   url : "${basePath}/admin/add",
                   type : "post",
                   dataType : "json",
                   data: param,
                   success : function(result) {
                       if(result.result == 200) {
                           $(".btn").removeAttr('disabled', 'disabled');
                           $("#addAdminForm")[0].reset();
                           $("div.icheckbox_flat-green.checked").each(function ()
                           {
                               $(this).removeClass('checked');
                               $(this).attr("aria-checked", 'false');
                           });
                           malertInfo("添加成功", 'm-alert-info-success', {},"");
                       } else if(result.result == 500) {
                           $(".btn").removeAttr('disabled', 'disabled');
//                        $(".submit").css('disabled', 'disabled');
                           malertInfo("添加失败", 'm-alert-info-failed', {},"");
                       } else {
                       }
                   },
                   error:function ()
                   {
                       alert("failed.");
                   }
               });

           }
        });



        // 手机验证
        jQuery.validator.addMethod("mobile", function(value, element) {
            var tel = /^((1[3,5,7,8][0-9])|(14[5,7]))\d{8}$/;
            return this.optional(element) || (tel.test(value));
        }, "请正确填写您的手机号");

        jQuery.validator.addMethod("emailprefix", function(value, element) {
            var email_prefix = /^[A-Za-zd]+([-_.][A-Za-zd]+)*$/;
            return this.optional(element) || (email_prefix.test(value));
        }, "请正确填写您的@pingansec.com邮箱名");
    });
</script>
