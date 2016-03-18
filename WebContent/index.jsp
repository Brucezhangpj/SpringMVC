<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
  $(function(){
	
	$("#testJson").click(function(){
		var url= $(this).attr("href");
			var args={name:'z3'};
		$.post(url,args,function(data){
			for(var i=0;i<data.length;i++){
				
				var id=data[i].id;
				var lastName= data[i].lastName;
				alert(id+"/t"+lastName);
			};
		});
	
		return false;
	});
});


</script>
</head>
<body>
	查找成员名单列表：<a href="${pageContext.request.contextPath }/emps">list</a>
	<hr>
	testJson:<a id="testJson" href="${pageContext.request.contextPath }/testJson" >testJson</a>
	testRequestBody:<br>
	<form action="${pageContext.request.contextPath }/testRequestBody" method="post"  enctype="multipart/form-data">
		file:<input type="file" name="file" value=""><br>
		name:<input type="text" name="name" value="jack"><br>
		password:<input type="password" name="password" value="123456"><br>
		<input type="submit" value="submit">
	</form>
	testUpload:<form action="${pageContext.request.contextPath }/testUpload" method="post" enctype="multipart/form-data">
		file1:<input type="file" name="file" value="" ><br>
		file2:<input type="file" name="file" value=""><br>
		file3:<input type="file" name="file" value=""><br>
	<input type="submit" value="submit" ><br> 	
	</form>	
</body>
</html>