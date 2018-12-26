<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="./jsp/pageTop.jsp"></jsp:include>
<body>
<h1 style="text-align: center;margin-top: 15%">您无权操作<button class="btn" id="btn" value="返回">返回</button></h1>
<script>
    $("#btn").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>
