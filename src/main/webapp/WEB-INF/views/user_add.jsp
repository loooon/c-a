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
<link rel="stylesheet" href="${basePath}/resources/AdminLTE/plugins/iCheck/all.css">
<!-- InputMask -->
<script src="${basePath}/resources/AdminLTE/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/input-mask/jquery.inputmask.extensions.js"></script>

<!-- icheck-->
<script src="${basePath}/resources/AdminLTE/plugins/iCheck/icheck.min.js"></script>


<input id="menuTarget" type="hidden" value="userAdd"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                客户管理
                <%--<small>客户添加</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 客户管理</a></li>
                <li class="active">客户添加</li>
            </ol>
        </section>


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Horizontal Form -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">客户添加</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form class="form-horizontal" id="addUserForm" action="${basePath}/user/add" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label  class="col-sm-4 control-label">企业名称<em style="color:red;">*</em></label>

                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="companyName" id="" placeholder="上海凭安征信服务有限公司">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-sm-4 control-label">产品名称</label>

                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="productName" id="productName" placeholder="凭安信用">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-sm-4 control-label">手机号</label>

                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="phone" id="phone" >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">邮箱</label>

                                        <div class="col-sm-4">
                                            <input type="email"  name="email"  class="form-control" id="email" placeholder="">
                                        </div>
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




<%--<script src="/resources/AdminLTE/js/datatables/jquery.dataTables.js"></script>
<script src="/resources/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>
<!-- SlimScroll -->
<script src="/resources/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<%--<script src="/resources/AdminLTE/plugins/fastclick/fastclick.js"></script>&ndash;%&gt;--%>
<script src="${basePath}/resources/AdminLTE/plugins/validate/jquery.validate.min.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/validate/messages_zh.min.js"></script>

<script>

    $("[data-mask]").inputmask();
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    });
    $().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
       var  addUserForm = $("#addUserForm").validate({
//            debug:true,
            rules: {
                companyName: {
                    required: true,
                },
                productName:{},
                phone:{
                    digits:true,
                    minlength:11,
                    maxlength:11,
                    mobile:true
                },
                email:{},
            },
            messages: {
                companyName:{
                    required:'请填写企业名称',
                    remote:'此企业名称已被注册，请更换新企业名称'
                },
                phone:{
                    digits:'手机号为纯数字',
                    minlength:'手机号为11位',
                    maxlength:'手机号为11位',
                    mobile:'请输入正确的手机号'
                },
                email: "请输入正确的邮箱",


            },
           errorPlacement: function(error, element) {
                   error.css('color', 'red');
                   error.appendTo(element.parent());
           },
           errorElement: "span",
           submitHandler: function(form) {
               $(".btn").prop('disabled', 'disabled');
               var param = $("#addUserForm").serialize();

               $.ajax({
                   url : "${basePath}/user/add",
                   type : "post",
                   dataType : "json",
                   data: param,
                   success : function(result) {
                       if(result.result == 200) {
                           $(".btn").removeAttr('disabled', 'disabled');
                           $("#addUserForm")[0].reset();
                           $("div.icheckbox_flat-green.checked").each(function ()
                           {
                               $(this).removeClass('checked');
                               $(this).attr("aria-checked", 'false');
                           });
                           malertInfo("添加成功", 'm-alert-info-success', {},"");

                       } else if(result.result == 500) {
                           $(".btn").removeAttr('disabled', 'disabled');
                           malertInfo("添加失败", 'm-alert-info-failed', {},"");
                       } else {}
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

        // 密码验证
        jQuery.validator.addMethod("password", function(value, element) {
            var passwordExp  = /^((?=.*[0-9])(?=.*[a-zA-Z]))|(((?=.*[0-9])(?=.*[a-zA-Z]))(?=.*[!@#$%^&*,./;'\[\]\-=+\{}:"<>\?])){6,20}$/;
            return this.optional(element) || (passwordExp.test(value));
        }, "请填写6-20位由数字字母特殊符号组成的密码，至少包含其中的2种.");

        // 对象验证
        jQuery.validator.addMethod("sss", function(value, element) {
            if($(element).prev().children('div').children('input').prop('checked'))
            {
                $(element).prop("checked", true);
                return this.optional(element) || ( $(element).val().trim() !="");
            }
            return this.optional(element) || true;
        }, "按时大大大发送");

        jQuery.validator.addMethod("lll", function(value, element) {
            var checked_flag = 0;
            $(element).siblings().each(function ()
            {
                if($(this).children('label').children('div').children('input').prop('checked'))
                {
                    checked_flag++;
                }
            });
            return this.optional(element) || ( checked_flag > 0);
        }, "bitian");
    });
</script>
