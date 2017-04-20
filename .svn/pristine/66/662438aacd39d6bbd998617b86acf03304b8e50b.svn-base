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


<input id="menuTarget" type="hidden" value="userIpList"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户授权ip更新
                <%--<small>授权ip</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 用户管理</a></li>
                <li class="active">用户授权ip更新</li>
            </ol>
        </section>


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Horizontal Form -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">更新用户授权ip</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form class="form-horizontal" id="userIpForm">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label  class="col-sm-4 control-label">ip<em style="color:red;">*</em></label>
                                        <input type="hidden" name="userId" id="userId" value="${userId}">
                                        <div class="col-sm-4">
                                            <textarea rows="8" class="form-control" name="authIps" id="authIps" >${ips}</textarea>
                                            <p class="text-aqua">每行一个ip</p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-4">
                                            <button type="submit" id="saveBtn" class="btn btn-primary">保存</button>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>

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

    $().ready(function() {

       var  userIpForm = $("#userIpForm").validate({
//            debug:true,
            rules: {
                authIps: {
                    required: true,
                }
            },
            messages: {
            },
           errorPlacement: function(error, element) {
                   error.css('color', 'red');
                   error.appendTo(element.parent());
           },
           errorElement: "span",
           submitHandler: function(form) {
               $("#saveBtn").addClass("disabled");
               var param = $("#userIpForm").serialize();

               $.ajax({
                   url : "${basePath}/user/ip/update",
                   type : "post",
                   dataType : "json",
                   data: param,
                   success : function(result) {
                       $("#saveBtn").removeClass("disabled");
                       if(result.result == 0) {
                         location.href='${basePath}/user/ip/list';
                       } else if(result.result == 500) {
                               malertInfo("更新失败", 'm-alert-info-success', {});
                       }
                   }
               });

           }
        });
    });
</script>
