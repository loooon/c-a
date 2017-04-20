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

<input id="menuTarget" type="hidden" value="formTest"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
                <%--<small>Optional description</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 用户管理</a></li>
                <li class="active">用户添加</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <!-- Horizontal Form -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">表单提交</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form class="form-horizontal" id="userSaveForm">
                            <div class="box-body">
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Email</label>

                                    <div class="col-sm-4">
                                        <input type="email" class="form-control" name="inputEmail3" id="inputEmail3" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Password</label>

                                    <div class="col-sm-4">
                                        <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-4">
                                        <button type="submit" class="btn btn-primary">提交</button>
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
    $().ready(function() {
        var va = $("#userSaveForm").validate({
            ignore: '',
            rules: {
                inputEmail3: {
                    required: true,
                    email:true,
                },
            },
            messages: {

            }
        });


    });





</script>
