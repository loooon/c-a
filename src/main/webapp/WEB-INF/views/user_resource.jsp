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


<input id="menuTarget" type="hidden" value="userList"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                客户管理
                <%--<small>客户资源</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 客户管理</a></li>
                <li class="active">客户资源</li>
            </ol>
        </section>


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Horizontal Form -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">客户资源</h3>
                            </div>
                            <form class="form-horizontal" id="updateUserResourceForm" action="${basePath}/user/update/permission" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label  class="col-sm-4 control-label">客户名<em style="color:red;">*</em></label>

                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="userName" id="userName" value="${user.userName}" readonly>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" id="resource_error_id">查询服务<em style="color:red;">*</em></label>
                                        <span class="error" style="color: red;margin-left: 2%;display: none;">请选择一项查询服务</span>
                                        <div class="col-sm-4" id="resource_id">
                                            <c:if test="${not empty siteResourceModels}">
                                                <c:forEach items="${siteResourceModels}" var="siteResourceModel" varStatus="status">
                                                    <c:set var="ischecked" value="${siteResourceModel.isExist}"/>
                                                    <div class="row">
                                                        <label class="col-sm-6">

                                                            <input type="checkbox" name="siteResourceModels[${status.index}].resourceId" ${ischecked} value="${siteResourceModel.resourceId}" class="flat-red" required minlength="1" >
                                                                ${siteResourceModel.resourceName}
                                                        </label>
                                                        <input class="col-sm-3" name="siteResourceModels[${status.index}].dailyTimes"  type="text" value="${siteResourceModel.dailyTimes}" class="form-control"  data-attr="resource_times" id="dailyTimes_${status.index}" placeholder="日" >
                                                        <input class="col-sm-3" name="siteResourceModels[${status.index}].yearlyTimes" type="text" value="${siteResourceModel.yearlyTimes}" class="form-control"  data-attr="resource_times" id="yearlyTimes_${status.index}"  placeholder="年">
                                                        <span class="error" style="display:none;color: red;margin-right: 5%;">请填写日查询次数</span>
                                                        <span class="error" style="display:none;color: red;">请填写年查询次数</span>
                                                    </div>

                                                </c:forEach>
                                            </c:if>
                                            （可多选，输入框内设定查询次数，-1为不限次数）
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-4">
                                            <button id="to_save" type="button" class="btn btn-primary">保存</button>
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

<script>
    $("[data-mask]").inputmask();
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    });
    $().ready(function() {

        $("#resource_id").find("[data-attr=resource_times]").on('keyup',function ()
        {
                var tmptxt=$(this).val();
                var times = tmptxt.replace(/[^0-9-]/g,'');
                $(this).val(times);
        });

       $("#to_save").on('click',function ()
       {
           var _this_btn = this;
           var checked_flag = false;
           var resourceIds_num=0;
           var c = $("div.icheckbox_flat-green.checked").length;
           if(c>0)
           {
               $("div.icheckbox_flat-green.checked").each(function ()
               {
                   var search_times =$(this).parent('label').siblings();
                  if(search_times.eq(0).val().trim() == "")
                  {
                      search_times.eq(2).show();
                  }else
                      {
                          search_times.eq(2).hide();
                      }
                   if(search_times.eq(1).val().trim() == "")
                  {
                      search_times.eq(3).show();
                  }else
                      {
                          search_times.eq(3).hide();
                      }

               });

               if($(".error:visible").length == 0)
               {
                   checked_flag=true;
               }
           }
           console.log(c);
           console.log(resourceIds_num);
           if(checked_flag)
           {
               $(this).prop('disabled', 'disabled');
               var param = $("#updateUserResourceForm").serialize();
           $.ajax({
               url : "${basePath}/user/update/permission",
               type : "post",
               dataType : "json",
               data: param,
               success : function(result) {
                   if(result.result == 200) {
                       $(".btn").removeAttr('disabled', 'disabled');
                       malertInfo("添加成功", 'm-alert-info-success', {},"");
                       window.location.href ='${basePath}/user/list';
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

    });
</script>
