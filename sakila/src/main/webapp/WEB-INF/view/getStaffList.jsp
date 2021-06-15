<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getStaffList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<!-- mainMenu -->
<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>

<div class="container">
    <h1><a href="${pageContext.request.contextPath}/admin/getStaffList">StaffList</a></h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>address</th>
                <th>zip code</th>
                <th>phone</th>
                <th>city</th>
                <th>country</th>
                <th>SID(Store ID)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="s" items="${staffList}">
                <tr>
                	<td>${s.ID}</td>
                    <td>${s.name}</td>
                    <td>${s.address}</td>
                    <td>${s.zipCode}</td>
                    <td>${s.phone}</td>
                    <td>${s.city}</td>
                    <td>${s.country}</td>
                    <td>${s.SID}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 검색어 입력창 -->
    <form action="${pageContext.request.contextPath}/admin/getStaffList" method="get">
        <label for="searchWord">검색어(이름) :</label> 
        <input name="searchWord" type="text">
        <button type="submit">검색</button>
    </form>
</div>
</body>
</html>