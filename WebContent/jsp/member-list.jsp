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
            <form class="layui-form xbs" action="/adminInfo/adminList" >
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
                        用户名
                    </th>
                    <th>
                        性别
                    </th>
                    <th>
                        手机
                    </th>
                    <th>
                        邮箱
                    </th>
                    <th>
                        地址
                    </th>
                    <th>
                        加入时间
                    </th>
                    <th>
                        状态
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${adminInfoList}" var="itm">
                        <c:if test="${itm.adminId!=sessionAdmin.adminId}">
                            <tr>
                                <td>
                                    <input type="checkbox" value="${itm.adminId}" name="adminId">
                                </td>
                                <td>
                                        ${itm.adminId}
                                </td>
                                <td>
                                    <u style="cursor:pointer" onclick="member_show('张三','member-show.html','10001','360','400')">
                                            ${itm.adminName}
                                    </u>
                                </td>
                                <td >
                                        ${itm.adminSex}
                                </td>
                                <td >
                                        ${itm.adminPhone}
                                </td>
                                <td >
                                        ${itm.adminEmail}
                                </td>
                                <td >
                                        ${itm.adminAddress}
                                </td>
                                <td>
                                        ${itm.regDate}
                                </td>
                                <td class="td-status">
                                    <c:if test="${itm.adminStatus==0}">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini">
                                        已停用
                                    </span>
                                    </c:if>
                                    <c:if test="${itm.adminStatus==1}">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini">
                                        已启用
                                    </span>
                                    </c:if>
                                </td>
                                <td class="td-manage">
                                    <a style="text-decoration:none" onclick="member_stop(this,${itm.adminId})" href="javascript:;" title="停用">
                                        <i class="layui-icon">&#xe601;</i>
                                    </a>
                                    <a title="编辑" href="javascript:;" onclick="member_edit('编辑','/adminInfo/getAdminById?adminId=${itm.adminId}','4','','510')"
                                       class="ml-5" style="text-decoration:none">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a style="text-decoration:none"  onclick="member_password('修改密码','/adminInfo/updatePass?adminId=${itm.adminId}','10001','600','400')"
                                       href="javascript:;" title="修改密码">
                                        <i class="layui-icon">&#xe631;</i>
                                    </a>
                                    <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                                       style="text-decoration:none">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <!--右侧分页开始-->
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
        //
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
                    url:"/adminInfo/delAdminByIds",
                    type:"post",
                    dataType : 'json',
                    contentType : 'application/json',
                    data:{
                        ids:arr
                    }
                });
                layer.msg('删除成功', {icon: 1});
            });
        }else{
            layer.msg("未选中");
        }

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
            $.ajax({
                url:"updateAdminInfo",
                type:"POST",
                data:{
                    adminId:id,
                    adminStatus:0
                },
                success:function (res) {
                    if(res==1){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');

                    }else{
                        $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">修改失败</span>');
                    }
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                }
            })
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //发异步把用户状态进行更改
            $.ajax({
                url:"updateAdminInfo",
                type:"POST",
                data:{
                    adminId:id,
                    adminStatus:1
                },
                success:function (res) {
                    if(res==1){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');

                    }else{
                        $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">修改失败</span>');
                    }
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                }
            })


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
