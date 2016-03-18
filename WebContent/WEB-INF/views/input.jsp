<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="${pageContext.request.contextPath }/conversion" method="post">
			employee:<input type="text" name="employee" value="aa;123@123.com;1;105"/>
			<input type="submit" value="conversion_submit">
		</form>

		<form:form action="${pageContext.request.contextPath }/emp" method="post" modelAttribute="employee">
		lastName:&nbsp;<form:input path="lastName"/><br>
		email:&nbsp;&nbsp;<form:input path="email"/><br>
		gender:&nbsp;<form:radiobuttons path="gender" items="${requestScope.genders }"/><br>
		department:<form:select path="department.id" items="${requestScope.departments}" itemValue="id" itemLabel="departmentName"></form:select><br>
		&nbsp;&nbsp;<input type="submit" value="save_submit">
		</form:form>
</html>