<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/common/path.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><sitemesh:write property='title' /></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="/WEB-INF/common/common.jsp" %>

</head>

<body class="hold-transition skin-green-light sidebar-mini">
<div class="wrapper">

    <%@ include file="/WEB-INF/common/head.jsp" %>
    <%@ include file="/WEB-INF/common/left.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <sitemesh:write property="body"/>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@include file="/WEB-INF/common/footer.jsp" %>

</div>

</body>
</html>

