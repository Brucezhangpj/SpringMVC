<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
2016年3月7日22:03
2016/3/8 19:00
<hr>
testModelAndView:${requestScope.testModelAndView}&nbsp;&nbsp;&nbsp;<%=request.getAttribute("testModelAndView") %>
<hr>
Map:${requestScope.Map };
<hr>
Model:${requestScope.Model };
<hr>
ModelMap:${requestScope.ModelMap };
<hr>
@SessionAttibutes:${sessionScope.user };
</body>
</html>