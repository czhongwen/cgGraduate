<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息后台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
</head>
<body>
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form" action="/adminInfo/updateAdminInfos" method="post">
                <input type="hidden" name="adminId" value="${adminInfo.adminId}">
                <div class="layui-form-item">
                    <label for="L_email" class="layui-form-label">
                        邮箱
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_email" name="adminEmail" required lay-verify="email"
                               autocomplete="off" value="${adminInfo.adminEmail}" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        如果您在邮箱已激活的情况下，变更了邮箱，需
                        <a href="#" style="font-size: 12px; color: #4f99cf;">
                            重新验证邮箱
                        </a>
                        。
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label">
                        姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_username" name="adminName" required lay-verify="required"
                               autocomplete="off" value="${adminInfo.adminName}" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <c:if test="${adminInfo.adminSex=='男'}">
                            <div class="layui-input-inline">
                                <input type="radio" name="adminSex" value="男" checked title="男">
                                <input type="radio" name="adminSex" value="女" title="女">
                            </div>
                        </c:if>
                        <c:if test="${adminInfo.adminSex=='女'}">
                            <div class="layui-input-inline">
                                <input type="radio" name="adminSex" value="男"  title="男">
                                <input type="radio" name="adminSex" value="女" checked title="女">
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_city" class="layui-form-label">
                        城市
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_city" name="adminAddres" autocomplete="off" value="${adminInfo.adminAddress}"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_city" class="layui-form-label">
                        手机号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_phone" name="adminPhone" autocomplete="off" value="${adminInfo.adminPhone}"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="L_sign" class="layui-form-label">
                        签名
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  autocomplete="off"
                                  class="layui-textarea" style="height: 80px;"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_sign" class="layui-form-label">
                    </label>
                    <button class="layui-btn" key="set-mine" lay-filter="save" lay-submit>
                        保存
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
