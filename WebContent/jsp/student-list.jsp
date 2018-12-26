<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="pageTop.jsp"/>
<body>
<!-- 顶部开始 -->
<jsp:include page="contentTop.jsp"/>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 左侧菜单开始 -->
    <jsp:include page="pageLeft.jsp"/>
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form xbs" action="/studentInfo/stuList" method="post">
                <input type="hidden" name="currentPage" value="${page.currentPage}">
                <div class="layui-form-pane" style="text-align: center;">
                    <div class="layui-form-item" style="display: inline-block;">
                        <div class="layui-input-inline">
                            <input type="text" name="key"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline" style="width:80px">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </div>
                </div>
            </form>
            <xblock><button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button><button class="layui-btn" onclick="member_add('添加用户','../jsp/student-add.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button><span class="x-right" style="line-height:40px">共有数据：${page.totalCount} 条</span></xblock>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" name="" value="">
                    </th>
                    <th>ID</th>
                    <th>学生姓名</th>
                    <th>性别</th>
                    <th>手机</th>
                    <th>邮箱</th>
                    <th>家庭住址</th>
                    <th>班级</th>
                    <th>公司地址</th>
                    <th>公司</th>
                    <th>薪水</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${studentInfoList}" var="itm">
                        <tr>
                            <td>
                                <input type="checkbox" value="1" name="">
                            </td>
                            <td>
                                ${itm.stuId}
                            </td>
                            <td>
                                ${itm.stuName}
                            </td>
                            <td >
                                ${itm.stuSex}
                            </td>
                            <td >
                                ${itm.stuPhone}
                            </td>
                            <td >
                                ${itm.stuEmail}
                            </td>
                            <td >
                                ${itm.homeAddress}
                            </td>
                            <td>
                                ${itm.className}
                            </td>
                            <td>
                                ${itm.company}
                            </td>
                            <td>
                                ${itm.workAddress}
                            </td>
                            <td>
                                ${itm.salary}万
                            </td>
                            <td class="td-manage">
                                <a title="编辑" href="javascript:;" onclick="member_edit('编辑','/studentInfo/getStuById?stuId=${itm.stuId}','4','','510')"
                                   class="ml-5" style="text-decoration:none">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
                                <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                                   style="text-decoration:none">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- 右侧内容框架，更改从这里结束 -->
            <!--右侧分页开始-->
            <div >
                <c:if test="${page.currentPage>1}">
                    <span class="btn" style="margin-left: 30%"><a href="/studentInfo/stuList?currentPage=${page.currentPage-1}">上一页</a></span>
                </c:if>
                <c:if test="${page.currentPage==1}">
                    <span class="btn" style="margin-left: 30%"><a href="/studentInfo/stuList?currentPage=${1}">上一页</a></span>
                </c:if>
                <c:if test="${page.currentPage<page.totalPage}">
                    <span class="btn" style="margin-left: 30%"><a href="/studentInfo/stuList?currentPage=${page.currentPage+1}">下一页</a></span>
                </c:if>
                <c:if test="${page.currentPage==page.totalPage}">
                    <span class="btn" style="margin-left: 30%"><a href="/studentInfo/stuList?currentPage=${page.totalPage}">下一页</a></span>
                </c:if>
            </div>
            <!--右侧分页结束-->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<!-- 底部开始 -->
<!-- 底部结束 -->
<!-- 背景切换开始 -->
<jsp:include page="pageBackground.jsp"/>
<!-- 背景切换结束 -->
<!-- 页面动态效果 -->
<script>
    layui.use(['laydate'], function(){
        laydate = layui.laydate;//日期插件

        //以上模块根据需要引入
        //
//        var start = {
//            min: laydate.now()
//            ,max: '2099-06-16 23:59:59'
//            ,istoday: false
//            ,choose: function(datas){
//                end.min = datas; //开始日选好后，重置结束日的最小日期
//                end.start = datas //将结束日的初始值设定为开始日
//            }
//        };
//
//        var end = {
//            min: laydate.now()
//            ,max: '2099-06-16 23:59:59'
//            ,istoday: false
//            ,choose: function(datas){
//                start.max = datas; //结束日选好后，重置开始日的最大日期
//            }
//        };
//
//        document.getElementById('LAY_demorange_s').onclick = function(){
//            start.elem = this;
//            laydate(start);
//        }
//        document.getElementById('LAY_demorange_e').onclick = function(){
//            end.elem = this
//            laydate(end);
//        }

    });

    //批量删除提交
    function delAll () {
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
        });
    }
    /*用户-添加*/
    function member_add(title,url,w,h){
        x_admin_show(title,url,w,h);
    }
    /*用户-查看*/
    function member_show(title,url,id,w,h){
        x_admin_show(title,url,w,h);
    }

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //发异步把用户状态进行更改
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //发异步把用户状态进行更改
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    // 用户-编辑
    function member_edit (title,url,id,w,h) {
        x_admin_show(title,url,w,h);
    }
    /*密码-修改*/
    function member_password(title,url,id,w,h){
        x_admin_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
</script>
</body>
</html>
