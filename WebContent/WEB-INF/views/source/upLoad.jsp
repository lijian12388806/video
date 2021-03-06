<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=utf-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mis" uri="http://mis_functions" %>
<%@ taglib prefix="final" uri="http://final_functions" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<html>
<head>
<meta charset="UTF-8">
	<title>上传列表</title>
    <link rel="icon" href="${pageContext.request.contextPath}/icons/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/color.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <style>
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:15px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>
    <script type="text/javascript">
		$(function() {
		 selectPanel("内容管理");
		});
		
		
		//查询按钮调用方法
		function doSearch(){
			$('#dg').datagrid('load',{
				startDate: $('#startDate').datebox('getValue'),
				endDate: $('#endDate').datebox('getValue'),
			});
		}
		
		//操作按钮
		function formatMgr(value, row) {
			var status = row.status;
	    	if(status == 0){
	    		return "<a href='javascript:void(0)' onclick='pass("+row.id+",2)'>启用</a>"+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
	    		"<a href='javascript:void(0)' onclick='pass("+row.id+",1)'>不启用</a>";
	    	}else if(status == 1){
	    		return "<a href='javascript:void(0)' onclick='pass("+row.id+",2)'>启用</a>";
	    	}else if(status == 2){
	    		return "<a href='javascript:void(0)' onclick='pass("+row.id+",1)'>不启用</a>";
	    	}
		}
		//状态栏
		function formatStatus(value){
			return "<span>"+convert(value)+" </span>";
		}
		function convert(status) {
			 switch(status){
			 case 0:
				 return "启用";
			 case 1:
				 return "启用成功";	 
			 case 2:
				 return "未启用";	 
		     default:
		    	 return "";
			 }
		 }
		//改为审核通过
		function pass(id,sum) {
			$.ajax({
  				type:"POST",
  				url:"<%=request.getContextPath()%>/source/pass",
  				data:{id:id,status:sum},
  				dataType:"json",
  				success:function(result){
  					if(result.success){
  						$('#dg').datagrid('reload');
  						topCenter("SUCCESS", result.msg);
  					} else {
  						topCenter("ERROR", result.msg);
  					}
  				}
  			});
		}
		
		//批量审核通过
		function multipleAudit(){
			var selRows = $("#dg").datagrid("getChecked");
			var ids = "";
			if(selRows.length<1) {
				topCenter("ERROR","请先选择至少一条记录进行审核");
				return false
			}
			for(i=0;i<selRows.length;i++){
				ids += selRows[i].id+",";
			}
			ids = ids.substring(0,ids.length-1);
			$.post('${pageContext.request.contextPath}/source/multipleAudit',{ids:ids},function(result){
				if(result.success){
					$('#dg').datagrid('reload');
					topCenter("SUCCESS", result.msg);
				} else {
					topCenter("ERROR", result.msg);
				}
			},'json');
		}
		//批量审核不通过
		function multipleAuditNot(){
			var selRows = $("#dg").datagrid("getChecked");
			var ids = "";
			if(selRows.length<1) {
				topCenter("ERROR","请先选择至少一条记录进行审核");
				return false
			}
			for(i=0;i<selRows.length;i++){
				ids += selRows[i].id+",";
			}
			ids = ids.substring(0,ids.length-1);
			$.post('${pageContext.request.contextPath}/source/multipleAuditNot',{ids:ids},function(result){
				if(result.success){
					$('#dg').datagrid('reload');
					topCenter("SUCCESS", result.msg);
				} else {
					topCenter("ERROR", result.msg);
				}
			},'json');
		}
		
		function formatImage(value, row) {
			if(row.type=="IMAGE") {
				return "<a href='"+value+"' target='_blank'><img height='100px' src='"+value+"'/></a>";
			} else if (row.type=="VIDEO") {
				return "<a href='"+value+"' target='_blank'><video height='100px' src='"+value+"' /></a>"
			} else if (row.type=="VOICE") {
				return "<a href='"+value+"' target='_blank' style='display:block;'>点击播放音频</a>"
			}
		}
    </script>
</head>
<body class="easyui-layout">
	<jsp:include page="../common/commonui.jsp" flush="true"/>
	<div data-options="region:'center'">
		<table id="dg" class="easyui-datagrid" title="素材管理列表" class="easyui-datagrid" style="width:100%;height:100%"
				url="${pageContext.request.contextPath}/upLoad/toUpList"
				toolbar="#toolbar" pagination="true" rownumbers="true" fitColumns="true" singleSelect="false" >
			<thead>
				<tr>
					<th field="id" width="5%" checkbox="true" align='center' title=""></th>
		            <th field="name" width="15%" align='center'>影视名称</th>
		            <th field="path" width="15%" align='center'>缩略图</th>
		            <th field="createTime" formatter="dateformatter" width="20%" align='center'>最后修改时间</th>
		            <th field="username" width="10%" align='center'>上传用户</th>
		            <th field="status" width="10%" align='center'>显示状态</th>
		            <th field="aa" formatter="formatMgr"  width="15%" align='center'>操作</th>
				</tr>
			</thead>
			
			<tbody>
                <c:forEach items="${videos}" var="video">
					<tr>
						<td></td>
						<td>${video.videoName}</td>
						<td>${video.videoPath}</td>
						<td>${video.createTime}</td>
						<td>${user.username}</td>
						<td>${video.status}</td>
<%-- 						<td><img width="100px;" height="100px" src="http://114.215.80.37${img.path}" /></td> --%>
<%-- 						<td><tags:time time="${img.uploadTime}"></tags:time></td> --%>
					</tr>
				</c:forEach>
              </tbody>
			
		</table>
	</div>
	<div id="toolbar" style="padding:2px 5px;">
<!--               上传文件:<input id="startDate" name="fileVedio" class="easyui-file" type="file"></input> -->
<!-- 		<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">搜索</a> -->
<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="multipleAudit()">审核通过</a> -->
<!--         <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="multipleAuditNot()">审核不通过</a> -->
		<form action="${pageContext.request.contextPath}/upLoad/toUpLoad" enctype="multipart/form-data" method="post">
			影视名字:<input type="text" name="fileName"><br>
			上传影视:<input type="file" name="fileVideo"><br>
<!-- 			上传缩略图:<input type="file" name="imgVedio"><br> -->
			<input type="submit" name="提交">
		</form>
	</div>
</body>
</html>