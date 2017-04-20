
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/path.jsp"%>
<link rel="stylesheet" href="${basePath}/resources/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
<input id="menuTarget" type="hidden" value="userVariableList"/>
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                客户管理
                <%--<small>授权ip</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${basePath}/user/list"><i class="fa fa-dashboard"></i> 客户管理</a></li>
                <li class="active">客户染黑度变量</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">客户染黑度变量</h3>
                </div>
                <!-- /.box-header -->


                <div class="box-body">
                    <table id="variableTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>客户名</th>
                            <th>vkey</th>
                            <th>变量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>

        </section>
        <!-- /.content -->


    </div>
    <!-- /.content-wrapper -->


</div>



<script src="${basePath}/resources/AdminLTE/js/datatables/jquery.dataTables.js"></script>
<script src="${basePath}/resources/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>

<script>
    var table;
    $(document).ready(function () {

        $('body').on('click', '[name="toUpdateBtn"]', function() {
            var me = $(this);
            location.href="${basePath}/user/grayscale/variable/update?userId=" + me.attr("user-id");
        });


        table =  $('#variableTable').DataTable({
            serverSide: true,
            ajax: function(data, callback, settings) {
                $.post('${basePath}/user/grayscale/variable/list', {
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
                    width: '8%'
                }, {
                    data: 'userVkey',
                    name:'vkey',
                    width: '8%'
                }, {
                    data: 'allVariableName',
                    orderable: false,
                    width: '8%',
                    render:function (data) {
                            return data.replace("<br/>_","<br/>");
                    }
                }, {
                    width: '5%',
                    orderable: false,
                    render: function(data, type, full, meta) {

                        return '<button style="margin-right:5px;" type="button" class="btn btn-primary btn-xs" name="toUpdateBtn" user-id="' + full.userId + '"><i class="fa fa-edit"></i>修改</button>';

                    }
                }
            ]
        });

        $('.dataTables_filter input').attr('placeholder', '用户名');

    });

</script>
