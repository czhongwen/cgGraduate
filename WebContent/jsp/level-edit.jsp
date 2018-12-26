<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="pageTop.jsp"/>
<body>
<form class="layui-form" action="../adminRole/updateAdminRole" method="post">
    <input type="hidden" name="adminId" value="${map.get("admin_id")}">
    <div class="layui-form-item">
        <label class="layui-form-label">
            ID
        </label>
        <div class="layui-input-inline">
            <input type="text" name="adminId" disabled="" value="${map.get("admin_id")}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label  class="layui-form-label">
            <span class="x-red">*</span>等级名
        </label>
        <div class="layui-input-inline">
            <select name="roleId">
                <c:forEach items="${roleMap}" var="itm">
                    <c:if test="${itm.get('rorl_name')==map.get('rorl_name')}">
                        <option value="${itm.get('roel_id')}" selected>${itm.get('rorl_name')}</option>
                    </c:if>
                    <c:if test="${itm.get('rorl_name')!=map.get('rorl_name')}">
                        <option value="${itm.get('roel_id')}">${itm.get('rorl_name')}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="level-kiss" class="layui-form-label">
            <span class="x-red">*</span>姓名
        </label>
        <div class="layui-input-inline">
            <input readonly type="text" id="level-kiss" required="" value="${map.get('admin_name')}" lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_repass" class="layui-form-label">
        </label>
        <button type="submit"  class="layui-btn" id="L_repass" lay-filter="save" lay-submit="">
            保存
        </button>
    </div>
</form>
</body>
</html>
