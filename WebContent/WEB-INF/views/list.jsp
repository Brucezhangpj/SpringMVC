<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".deleteCss").click(function(){
		var action = $(this).attr("href");
		alert(action);
		$("#deleteFrom").attr("action",action).submit();
		return false;
	});
	
	$(".json").click(function(){
		var url=$(this).attr("href");
		var args={name:'ma'};
		
		$.post(url,args,function(data){
			for (var i = 0; i < data.length; i++) {
				var id=data[i].id;
				var lastName=data[i].lastName;
				alert(id+"  "+lastName);
			}
		});
		return false;
	});
});


</script>
</head>
<body>
	<c:if test="${requestScope.employees==null }">
		there are nothing！！！
	</c:if>
	<c:if test="${requestScope.employees!=null }">

		<table border="1" cellpadding="10" cellspacing="2" align="center">
			<tr>
				<td>ID</td>
				<td>lastName</td>
				<td>email</td>
				<td>gender</td>
				<td>department</td>
				<td>Edit</td>
				<td>Delete</td>
			</tr>
			<c:forEach items="${requestScope.employees}" var="employees">
				<tr>
					<td>${employees.id}</td>
					<td>${employees.lastName}</td>
					<td>${employees.email}</td>
					<td>${employees.gender==1? "male":"female"}</td>
					<td>${employees.department.departmentName}</td>
					<td><a href="${pageContext.request.contextPath }/emp/${employees.id}">Edit</a></td>
					<td><a class="deleteCss" href="${pageContext.request.contextPath }/emp/${employees.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	add:<a href="${pageContext.request.contextPath}/emp">add employee</a><br>
	
	testJson--list:<a  class="json" href="${pageContext.request.contextPath }/json">testJson</a>
			<form id="deleteFrom" action=""  method="post">
				<input  type="hidden" name="_method" value="DELETE">
			</form>
</body>
</html>