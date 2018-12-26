<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 8:44
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
            <form class="layui-form xbs" action="/adminInfo/getAdminLevel" >
                <input type="hidden" name="currentPage" value="${page.currentPage}">
                <div class="layui-form-pane" style="text-align: center;">
                    <div class="layui-form-item" style="display: inline-block;">
                        <label class="layui-form-label xbs768">日期范围</label>
                        <div class="layui-input-inline xbs768">
                            <input class="layui-input" name="beginKeyDate" placeholder="开始日" id="LAY_demorange_s">
                        </div>
                        <div class="layui-input-inline xbs768">
                            <input class="layui-input" name="endKeyDate" placeholder="截止日" id="LAY_demorange_e">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="keyWord"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline" style="width:80px">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </div>
                </div>
            </form>
            <xblock><button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button><span class="x-right" style="line-height:40px">共有数据：${page.totalCount} 条</span></xblock>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" name="" value="">
                    </th>
                    <th>
                        ID
                    </th>
                    <th>
                        等级名
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${mapList}" var="itm">
                        <tr>
                            <td>
                                <input type="checkbox" value="1" name="">
                            </td>
                            <td>
                                    ${itm.get("admin_id")}
                            </td>
                            <td>
                                    ${itm.get("rorl_name")}
                            </td>
                            <td >
                                    ${itm.get("admin_name")}
                            </td>
                            <td class="td-manage">
                                <a title="编辑" href="javascript:;" onclick="level_edit('修改管理员等级','../adminRole/getAdminRoleById?adminId=${itm.get("admin_id")}','${itm.get("admin_id")}','','500')"
                                   style="text-decoration:none">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
                                <a title="删除" href="javascript:;" onclick="level_del(this,'1')"
                                   style="text-decoration:none">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- 右侧内容框架，更改从这里结束 -->
            <div >
                <c:if test="${page.currentPage>1}">
                    <span class="btn" style="margin-left: 30%"><a href="/adminInfo/adminList?currentPage=${page.currentPage-1}">上一页</a></span>
                </c:if>
                <c:if test="${page.currentPage==1}">
                    <span class="btn" style="margin-left: 30%"><a href="/adminInfo/adminList?currentPage=${1}">上一页</a></span>
                </c:if>
                <c:if test="${page.currentPage<page.totalPage}">
                    <span class="btn" style="margin-left: 30%"><a href="/adminInfo/adminList?currentPage=${page.currentPage+1}">下一页</a></span>
                </c:if>
                <c:if test="${page.currentPage==page.totalPage}">
                    <span class="btn" style="margin-left: 30%"><a href="/adminInfo/adminList?currentPage=${page.totalPage}">下一页</a></span>
                </c:if>
            </div>
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



        var start = {
            min: laydate.now()
            ,max: '2099-06-16 23:59:59'
            ,istoday: false
            ,choose: function(datas){
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };

        var end = {
            min: laydate.now()
            ,max: '2099-06-16 23:59:59'
            ,istoday: false
            ,choose: function(datas){
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };

        document.getElementById('LAY_demorange_s').onclick = function(){
            start.elem = this;
            laydate(start);
        }
        document.getElementById('LAY_demorange_e').onclick = function(){
            end.elem = this
            laydate(end);
        }

    });

    //批量删除提交
    function delAll () {
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
        });
    }
    // 等级-增加
    function level_add (title,url,id,w,h) {
        x_admin_show(title,url,w,h);
    }
    // 等级-编辑
    function level_edit (title,url,id,w,h) {
        x_admin_show(title,url,w,h);
    }

    /*等级-删除*/
    function level_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
</script>
</body>
</html>
