<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready...');
	$('#btn').click(function(){
		console.log('click....');
		$('#loginForm').submit();
	});
});
</script>

<title>home</title>
</head>
<body>
	<h1>Home</h1>
	<a href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a> <!-- 빠른 테스트를 위해서 메뉴 꺼내놓음 -->
	<a href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a> <!-- 빠른 테스트를 위해서 메뉴 꺼내놓음 -->
	<!-- 로그 오프 시... -->
	<c:if test="${loginStaff == null}">
		<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
			<div>email :</div>
			<div><input type="text" id="email" name="email"></div>
			<div>password :</div>
			<div><input type="password" id="password" name="password"></div>
			<div>
				<button id="btn" type="button">로그인</button>
			</div>
		</form>
	</c:if>
	
	<!-- 로그 온 시... -->
	<c:if test="${loginStaff != null}">
		<a href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a>
		<a href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a>
		<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
	</c:if>
</body>
</html>