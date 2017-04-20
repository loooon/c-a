<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/path.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${basePath}/resources/AdminLTE/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${basePath}/resources/AdminLTE/css/font-awesome-4.7.0/css/font-awesome.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${basePath}/resources/AdminLTE/css/ionicons-2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${basePath}/resources/AdminLTE/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${basePath}/resources/AdminLTE/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="${basePath}/resources/AdminLTE/js/html5shiv.min.js"></script>
    <script src="${basePath}/resources/AdminLTE/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Admin</b>LTE</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <form action="${basePath}/login" method="post">
            <div id="login_form_id">
                <div id="login_error_message" class="form-group has-error" style="display: none;">
                    <label class="control-label"><i class="fa fa-times-circle-o"></i> <span>Input with
                        error</span></label>
                </div>

            <div class="form-group has-feedback">
                <input type="text" name="userName" class="form-control" placeholder="用户名" required>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" placeholder="密码" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            </div>
            <%--<div class="form-group has-error">
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> Input with
                    error</label>
                <input type="password" id="inputError" name="password" class="form-control" placeholder="密码" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>--%>
            <div class="row">
                <%--<div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> Remember Me
                        </label>
                    </div>
                </div>--%>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" class="btn btn-primary btn-block btn-flat">登 陆</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

      <%--  <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                Google+</a>
        </div>
        <!-- /.social-auth-links -->

        <a href="#">I forgot my password</a><br>
        <a href="register.html" class="text-center">Register a new membership</a>
--%>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="${basePath}/resources/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${basePath}/resources/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${basePath}/resources/AdminLTE/plugins/iCheck/icheck.min.js"></script>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
//    var passwordExp  = /^((?=.*[0-9])(?=.*[a-zA-Z]))|(((?=.*[0-9])(?=.*[a-zA-Z]))(?=.*[!@#$%^&*,./;'\[\]\-=+\{}:"<>\?])){6,20}$/;

    $(function ()
    {
        $("#login_form_id input").on('blur',function ()
        {
           if($(this).val()=="")
           {
               $(this).closest('div').removeClass('has-feedback').addClass('has-error');
           }else {
               $(this).closest('div').removeClass('has-error').addClass('has-success');
           }
        });

        $("button").on('click',function ()
        {
            var userName = $("[name=userName]").val();
            var password= $("[name=password]").val();
            if(userName == "")
            {
                $("[name=userName]").closest('div').removeClass('has-feedback').addClass('has-error');
                return false;
            }else {
                $("[name=userName]").closest('div').removeClass('has-error').addClass('has-success');
            }
            if(password == "")
            {
                $("[name=password]").closest('div').removeClass('has-feedback').addClass('has-error');
                return false;
            }else {
                $("[name=password]").closest('div').removeClass('has-error').addClass('has-success');
            }
            $.ajax({
                url: "${basePath}/login",
                method: "POST",
                // timeout: 5e3,
                // async:true,
                dataType: "json",
                data: {userName: userName, password: password},
                error: function ()
                {
//                    $(".login").attr("value", "登录")
                },
                success: function (t)
                {
                    if (t.result == 0)
                    {
                        window.location.href = "${basePath}/";
                    } else
                    {
//                        $(".login").attr("value", "登录");
//                        $(".login-d .error span").html(t.message);
                        $("#login_error_message span").text(t.message);
                        $("#login_error_message").show();
                    }
                }
            })
        })
    });
</script>
</body>
</html>
