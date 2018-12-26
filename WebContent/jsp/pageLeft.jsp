<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li class="list" current>
                <a href="../jsp/index.jsp">
                    <i class="iconfont">&#xe761;</i>
                    欢迎页面
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
            </li>
            <li class="list">
                <a href="javascript:;">
                    <i class="iconfont">&#xe70b;</i>
                    管理员管理
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="/adminInfo/adminList?currentPage=1">
                            <i class="iconfont">&#xe6a7;</i>
                            管理员列表
                        </a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="member-del.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--管理员删除--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <li>
                        <a href="/adminInfo/getAdminLevel?currentPage=1">
                            <i class="iconfont">&#xe6a7;</i>
                            等级管理
                        </a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="member-kiss.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--积分管理--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <li>
                        <a href="/loginfo/logList?currentPage=1">
                            <i class="iconfont">&#xe6a7;</i>
                            浏览记录
                        </a>
                    </li>
                </ul>
            </li>
            <%--<li class="list" >--%>
                <%--<a href="javascript:;">--%>
                    <%--<i class="iconfont">&#xe6a3;</i>--%>
                    <%--分类管理--%>
                    <%--<i class="iconfont nav_right">&#xe697;</i>--%>
                <%--</a>--%>
                <%--<ul class="sub-menu">--%>
                    <%--<li>--%>
                        <%--<a href="./category.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--分类列表--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
            <%--<li class="list" >--%>
                <%--<a href="javascript:;">--%>
                    <%--<i class="iconfont">&#xe6a3;</i>--%>
                    <%--轮播管理--%>
                    <%--<i class="iconfont nav_right">&#xe697;</i>--%>
                <%--</a>--%>
                <%--<ul class="sub-menu" style="display:none">--%>
                    <%--<li>--%>
                        <%--<a href="../banner-list.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--轮播列表--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
            <li class="list" >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a3;</i>
                    学生管理
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu" style="display:none">
                    <li>
                        <a href="../studentInfo/stuList?currentPage=1">
                            <i class="iconfont">&#xe6a7;</i>
                            学生列表
                        </a>
                    </li>
                </ul>
            </li>
            <li class="list" >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a3;</i>
                    系统统计
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu" style="display:none">
                    <li>
                        <a href="../echarts1.html">
                            <i class="iconfont">&#xe6a7;</i>
                            拆线图
                        </a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="../echarts2.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--柱状图--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="../echarts3.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--地图--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="./echarts4.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--饼图--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="./echarts5.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--k线图--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="./echarts6.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--仪表图--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="http://echarts.baidu.com/examples.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--更多案例--%>
                        <%--</a>--%>
                    <%--</li>--%>
                </ul>
            </li>
            <%--<li class="list" >--%>
                <%--<a href="javascript:;">--%>
                    <%--<i class="iconfont">&#xe6a3;</i>--%>
                    <%--系统设置--%>
                    <%--<i class="iconfont nav_right">&#xe697;</i>--%>
                <%--</a>--%>
                <%--<ul class="sub-menu" style="display:none">--%>
                    <%--<li>--%>
                        <%--<a href="./banner-list.html">--%>
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <%--轮播列表--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
        </ul>
    </div>
</div>
</body>
</html>
