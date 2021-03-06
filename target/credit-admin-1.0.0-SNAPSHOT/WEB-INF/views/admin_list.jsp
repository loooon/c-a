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
<input id="menuTarget" type="hidden" value="adminList"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                操作员管理
                <%--<small>操作员列表</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 操作员管理</a></li>
                <li class="active">操作员列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">操作员列表</h3>
                </div>
                <!-- /.box-header -->


                <div class="box-body">
                    <table id="adminTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>


                <div class="modal modal-success" id="modify_id"  style="display: none;" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">修改操作员</h4>
                            </div>


                            <form class="form-horizontal" id="updateAdmin">
                                <input type="hidden" name="id">
                                <div class="modal-body">
                                    <!-- form start -->
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">姓名</label>

                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="userName" id="userName">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">手机</label>

                                            <div class="col-sm-6">
                                                <input type="text" name="phone" class="form-control" id="phone">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">邮箱</label>

                                            <div class="col-sm-4">
                                                <input type="text" name="email" class="form-control" id="email">
                                            </div>
                                            <div style="margin-top: 0.22%;padding-left: 3%;">@pingansec.com</div>
                                        </div>
                                    </div>
                                    <%--<span id="all_error" class="" style="color: red;display: none;">请填写需要更新的内容，至少填写一项！</span>--%>
                                </div>

                                <div class="modal-footer">
                                    <button id="to_cancel" type="button" class="btn btn-outline pull-left"
                                            data-dismiss="modal">取消
                                    </button>
                                    <button id="to_update" type="submit" class="btn btn-outline">保存</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


</div>




<script src="${basePath}/resources/AdminLTE/js/datatables/jquery.dataTables.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>
<!-- SlimScroll -->
<script src="${basePath}/resources/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${basePath}/resources/AdminLTE/plugins/fastclick/fastclick.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/validate/jquery.validate.min.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/validate/messages_zh.min.js"></script>
<script>
    var table;
    $(document).ready(function () {

        var id = 0;
        $("#adminTable").on('click','[name=updateUser]',function ()
        {
            $("[name=id]").val($(this).attr("commodity-id"));
            var full_obj = $(this).data();
            $("[name=userName]").val(full_obj.name);
            $("[name=phone]").val(full_obj.phone);
            $("[name=email]").val(full_obj.email.split('@')[0]);
            $('#modify_id').modal('show');
        });

        $("#updateAdmin").validate({
//            debug:true,
            rules: {
                userName:{
                    required:true,
                    remote:{
                        url:'${basePath}/admin/nonentity/isused',
                        data:{id:function(){return $("[name=id]").val();},
                            paramValue:function(){return $("[name=userName]").val();},
                            paramName:"user_name"}
                    }
                },
                phone:{
                    required:true,
                    digits:true,
                    minlength:11,
                    maxlength:11,
                    mobile:true,
                    remote:{
                        url:'${basePath}/admin/nonentity/isused',
                        data:{id:function(){return $("[name=id]").val();},
                            paramValue:function(){return $("[name=phone]").val();},
                            paramName:"phone"}
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
                    remote:'该姓名已存在，请更换新名称'
                },
                phone:{
                    required:'请填写手机号',
                    digits:'手机号为纯数字',
                    minlength:'手机号为11位',
                    maxlength:'手机号为11位',
                    mobile:'请输入正确的手机号',
                    remote:'该手机号已被存在，请更换新手机号'
                },
                email:{
                    required:'请填写邮箱',
                    emailprefix:'请填写后缀为@pingansec.com的企业邮箱名，后缀不用填',
                }
            },
            errorPlacement: function(error, element) {
                error.css('color', 'red');
                error.appendTo(element.parent());
            },
            errorElement: "span",
            submitHandler: function(form) {
                var this_btn = $(this);
                this_btn.prop('disabled', 'disabled');
                var param = $("#updateAdmin").serialize();

                $.ajax({
                    url : "${basePath}/admin/update",
                    type : "post",
                    dataType : "json",
                    data: param,
                    success : function(result) {
                        if(result.result == 200) {
                            $(".btn").removeAttr('disabled', 'disabled');
                            $("#updateAdmin")[0].reset();
                            $("#to_cancel").click();
                            malertInfo("更新操作员信息成功", 'm-alert-info-success', {},"width:200px;");
                            table.ajax.reload();
                            <%--window.location.href= '${basePath}/admin/list';--%>
                        } else if(result.result == 500) {
                            $("#to_cancel").click();
                            $(".btn").removeAttr('disabled', 'disabled');
                            malertInfo("更新操作员信息失败", 'm-alert-info-failed', {},"width:200px;");
                            table.ajax.reload();
                        } else {
                       malertInfo("更新操作员信息失败", 'm-alert-info-failed', {},"width:200px;");
                        }
                    },
                    error:function ()
                    {
                        alert("failed.");
                    }
                });

            }
        });


        table = $('#adminTable').DataTable({
            serverSide: true,
            ajax: function(data, callback, settings) {
                $.post('${basePath}/admin/list', {
                    pageSize: data.length,
                    pageNum: data.start / data.length + 1,
                    userName: $.trim(data.search.value),
                    'sort.property' : data.order.length == 0 ? '' : data.columns[data.order[0].column].name==''?data.columns[data.order[0].column].data:data.columns[data.order[0].column].name,
                    'sort.direction' : data.order.length == 0 ? '' : data.order[0].dir
                }, function(res) {
                    var data = res.data;
                    callback({
                        recordsTotal: data.totalCount,
                        recordsFiltered: data.totalCount,
                        data: data.data
                    });
                });
            },
            columnDefs: [
                { defaultContent: '', targets: -1}
            ],
            order: [],
            columns: [
                {
                    data: 'userName',
                    name:'user_name',
                    width: '18%'
                }, {
                    data: 'phone',
                    width: '16%'
                }, {
                    data: 'email',
                    width: '8%'
                }, {
                    width: '14%',
                    orderable: false,
                    render: function(data, type, full, meta) {

                        return '<button style="margin-right:5px;" type="button" class="btn btn-primary btn-xs" name="updateUser" data-name="'+full.userName+'" data-phone="'+full.phone+'" data-email="'+full.email+'" commodity-id="' + full.id + '"><i class="fa fa-edit"></i>修改</button>';

                    }
                }
            ]
        });

        // 手机验证
        jQuery.validator.addMethod("mobile", function(value, element) {
            var tel = /^((1[3,5,7,8][0-9])|(14[5,7]))\d{8}$/;
            return this.optional(element) || (tel.test(value));
        }, "请正确填写您的手机号");

        // 企业邮箱
        jQuery.validator.addMethod("emailprefix", function(value, element) {
            var email_prefix = /^[A-Za-zd]+([-_.][A-Za-zd]+)*$/;
            return this.optional(element) || (email_prefix.test(value));
        }, "请正确填写您的@pingansec.com邮箱名");
    });




</script>
