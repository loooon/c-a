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
                客户染黑度变量
                <%--<small>授权ip</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 用户管理</a></li>
                <li class="active">客户染黑度变量更新</li>
            </ol>
        </section>


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Horizontal Form -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">客户染黑度变量更新</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form class="form-horizontal" id="userVariableForm">
                                <div class="box-body">
                                    <div class="form-group" id="selectVariable">
                                        <label  class="col-sm-3 control-label">变量选择<em style="color:red;">*</em></label>
                                        <input type="hidden" name="userId" id="userId" value="${userId}">

                                        <div class="col-sm-1">
                                            <select class="form-control" id="dateSelect" name="dateSelect">
                                                <option value="">选择周期</option>
                                                <c:forEach items="${dateEnum}" var="date">
                                                   <option value=" ${date.name}">${date.description}</option>
                                               </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-1">
                                            <select class="form-control" id="timeSelect" name="timeSelect">
                                                <option>选择时间</option>
                                                <c:forEach items="${timeEnum}" var="time">
                                                    <option value=" ${time.name}">${time.description}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-1">
                                            <select class="form-control" id="" name="dunSelect">
                                                <option>选择类型</option>
                                                <c:forEach items="${dunEnum}" var="dun">
                                                    <option value=" ${dun.name}">${dun.description}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <select class="form-control">
                                                <option>选择变量</option>
                                                <c:forEach items="${variableList}" var="variable">
                                                    <option>${variable.description}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-block btn-info" id="addSelectBtn">添加到选择区</button>

                                        </div>
                                    </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">已选择的变量<em style="color:red;">*</em></label>
                                            <div class=" col-sm-5">
                                                <select multiple="" class="form-control" size="20" name="variableList" id="selectedVariable">
                                                    <c:forEach items="${userVariableList}" var="variable">
                                                        <option value="<c:if test="${empty variable.conditionName}">${variable.variableName}</c:if><c:if test="${not empty variable.conditionName}">${variable.conditionName}_${variable.variableName}</c:if>">${variable.variableDateDesc}${variable.variableTimeDesc}${variable.variableDunDesc}${variable.variableDescription}---
                                                            <c:if test="${empty variable.conditionName}">${variable.variableName}</c:if><c:if test="${not empty variable.conditionName}">${variable.conditionName}_${variable.variableName}</c:if></option>
                                                </c:forEach>
                                            </select>
                                            </div>
                                            <div class="col-sm-1">
                                                <button type="button" class="btn btn-block btn-info" id="deleteSelectBtn">从选择区删除</button>
                                            </div>
                                        </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-4">
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
        var  validate = $("#userVariableForm").validate({
            rules: {
                dateSelect: {
                    required: true
                },  timeSelect: {
                    required: true
                },  dunSelect: {
                    required: true
                }
            },
          /*  messages: {
            },*/
   /*         errorPlacement: function(error, element) {
                error.css('color', 'red');
                error.appendTo(element.parent());
            },
            errorElement: "span",*/
/*            submitHandler: function(form) {
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

            }*/
        });

        $("#addSelectBtn").click(function () {
           if(validate.element($(dateSelect))){
               alert("xxx");
           }
        })
    });
</script>
