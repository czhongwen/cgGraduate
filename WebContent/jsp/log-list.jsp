<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/3
  Time: 20:21
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
            <form class="layui-form xbs" action="/loginfo/logList" >
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
            <xblock><button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button><button class="layui-btn" onclick="member_add('添加用户','../jsp/member-add.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button><span class="x-right" style="line-height:40px">共有数据：${page.totalCount} 条</span></xblock>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>
                        <button class="btn" id="btn" >全选</button>
                    </th>
                    <th>
                        ID
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        访问
                    </th>
                    <th>
                        IP地址
                    </th>
                    <th>
                        访问时间
                    </th>
                    <th>
                        访问结果
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
                            <input type="checkbox" value="${itm.get("l_id")}" name="adminId">
                        </td>
                        <td>
                                ${itm.get("l_id")}
                        </td>
                        <td>
                                ${itm.get("l_admin_name")}
                        </td>
                        <td>
                                ${itm.get("l_operation")}
                        </td>
                        <td >
                                ${itm.get("l_ip")}
                        </td>
                        <td >
                                ${itm.get("l_time")}
                        </td>
                        <td >
                                ${itm.get("l_result")}
                        </td>
                        <td class="td-manage">
                            <a title="删除" href="javascript:;" onclick="member_del(this,'${itm.get("l_id")}')"
                               style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!--右侧分页开始-->
            <div >
                <c:if test="${page.currentPage>1}">
                    <span class="btn" style="margin-left: 30%"><a href="/loginfo/logList?currentPage=${page.currentPage-1}">上一页</a></span>
                </c:if>
                <c:if test="${page.currentPage==1}">
                    <span class="btn" style="margin-left: 30%"><a href="/loginfo/logList?currentPage=${1}">上一页</a></span>
                </c:if>
                <c:if test="${page.currentPage<page.totalPage}">
                    <span class="btn" style="margin-left: 30%"><a href="/loginfo/logList?currentPage=${page.currentPage+1}">下一页</a></span>
                </c:if>
                <c:if test="${page.currentPage==page.totalPage}">
                    <span class="btn" style="margin-left: 30%"><a href="/loginfo/logList?currentPage=${page.totalPage}">下一页</a></span>
                </c:if>
            </div>
            <!--右侧分页结束-->
            <!-- 右侧内容框架，更改从这里结束 -->
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

    layui.use(['laydate', 'layer'], function(){
        var laydate = layui.laydate;//日期插件
        var layer = layui.layer;//弹出

        //以上模块根据需要引入
        var start = {
            min: '1800-06-16 23:59:59'
            ,max: '2099-06-16 23:59:59'
            ,istoday: false
            ,choose: function(datas){
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };

        var end = {
            min: '1800-06-16 23:59:59'
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

    //全选
    $("#btn").bind("click", function () {
        $(".layui-table input").each(function () {
            $(this).prop("checked", !$(this).prop("checked"));
        });
    });

    //批量删除提交
    function delAll () {
        var arr = new Array();
        $(".layui-table input").each(function () {
            if($(this).prop("checked")==true){
                arr.push($(this).val())
            }
        });
        if(arr.length>0){
            layer.confirm('确认要删除吗？',function(index){
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url:"delInfoByIds",
                    type:"post",
                    data:{
                        ids:arr.toString()
                    },
                    success:function (res) {
                        console.log(res);
                        if(res>0){
                            layer.msg('删除成功', {icon:1,time:1000});
                            window.location.reload();
                        }else if(res==0){
                            layer.msg('删除失败', {icon:1,time:1000});
                        }else {
                            layer.msg('未知错误', {icon:1,time:1000});
                        }
                    }
                });

            });
        }else{
            layer.msg("未选中");
        }

    }
    /*用户-添加*/

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.ajax({
                url:"delById",
                type:"post",
                data:{
                    lId:id
                },
                success:function (res) {
                    console.log(res);
                    if(res==1){
                        $(obj).parents("tr").remove();
                        layer.msg('删除成功!',{icon:1,time:1000});
                    }else if(res==0){
                        layer.msg('删除失败!',{icon:1,time:1000});
                    }else{
                        layer.msg('未知错误!',{icon:1,time:1000});
                    }
                }
            })
        });
    }
</script>
</body>
</html>
