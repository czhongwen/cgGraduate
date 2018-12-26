<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="pageTop.jsp"/>
<body>
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form" action="/studentInfo/updateStu" method="post" onsubmit="return check()">
                <input type="hidden" name="stuId" value="${studentInfo.stuId}">
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="stuName" value="${studentInfo.stuName}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span>*</span>性别
                    </label>
                    <div class="layui-input-inline">
                        <c:if test="${studentInfo.stuSex=='男'}">
                            <input type="radio"  name="stuSex"   checked value="男">男
                            <input type="radio"  name="stuSex"  value="女">女
                        </c:if>
                        <c:if test="${studentInfo.stuSex=='女'}">
                            <input type="radio"  name="stuSex"    value="男">男
                            <input type="radio"  name="stuSex" checked value="女">女
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>手机号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="stuPhone" value="${studentInfo.stuPhone}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_pass" class="layui-form-label">
                        <span class="x-red">*</span>QQ
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_pass" name="stuQq" value="${studentInfo.stuQq}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                        <span class="x-red">*</span>邮箱
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_repass" name="stuEmail" value="${studentInfo.stuEmail}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>家庭住址
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="homeAddress" value="${studentInfo.homeAddress}" required="" lay-verify="repass"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>班级
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="className" value="${studentInfo.className}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>职业
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="profession" value="${studentInfo.profession}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>工作地点
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="workAddress" value="${studentInfo.workAddress}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>薪水
                    </label>
                    <div class="layui-input-inline">
                        <input type="number"  name="salary" value="${studentInfo.salary}" required=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>公司
                    </label>
                    <div class="layui-input-inline">
                        <input type="text"  name="company" value="${studentInfo.company}" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <button type="submit" class="layui-btn" lay-filter="add" lay-submit="">
                        增加
                    </button>
                </div>
            </form>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
</body>
</html>
