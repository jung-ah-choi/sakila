<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getFilmList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function() {
       $('#btn').click(function() {
          console.log('btn click...');
            $('#filmForm').submit();   
         });
   });
</script>
</head>
<body>
<div class="container">
	<h1><a href="${pageContext.request.contextPath}/admin/getFilmList">FilmList</a></h1>
	<div>
		<!-- 검색 내용 폼 -->
		<!-- 
		   1. 카테고리별
		   2. 가격별
		   3. 제목 검색
		   4. 등급별
		   5. 페이징
		   6. 배우검색
		   7. 타이틀 클릭 시 상세보기
		 -->
		<!-- 드롭다운 및 검색 폼 -->
		<form id="filmForm" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
			<!-- 카테고리 -->
			Category : 
			<select name="category">
				<option value="">카테고리 선택</option>
				<c:forEach var="name" items="${categoryNameList}">
					<!-- 카테고리 선택했을 때 -->
					<c:if test="${name == category}">
						<option value="${name}" selected="selected">${name}</option>
					</c:if>
					<!-- 카테고리 선택하지 않았을 때 -->
					<c:if test="${name != category}">
						<option value="${name}">${name}</option>
					</c:if>
				</c:forEach>
			</select>
			
			<!-- 가격 -->
			Price : 
			<select name="price">
				<option value="0">가격 선택</option>
				<c:if test="${price == 0.99}">
					<option value="0.99" selected="selected">0.99</option>
				</c:if>
				<c:if test="${price != 0.99}">
					<option value="0.99">0.99</option>
				</c:if>
				
				<c:if test="${price == 2.99}">
					<option value="2.99" selected="selected">2.99</option>
				</c:if>
				<c:if test="${price != 2.99}">
					<option value="2.99">2.99</option>
				</c:if>
				
				<c:if test="${price == 4.99}">
					<option value="4.99" selected="selected">4.99</option>
				</c:if>
				<c:if test="${price != 4.99}">
					<option value="4.99">4.99</option>
				</c:if>
			</select>
			
			<!-- 등급별 -->
			Rating :
			<select name="rating">
				<option value="">등급 선택</option>
				<c:if test="${rating eq 'G'}"> <!-- jstl 문자열 비교, eq -> equals, ne -> != -->
					<option value="G" selected="selected">G</option>
				</c:if>
				<c:if test="${rating ne 'G'}">
					<option value="G">G</option>
				</c:if>
				
				<c:if test="${rating eq 'PG'}">
					<option value="PG" selected="selected">PG</option>
				</c:if>
				<c:if test="${rating ne 'PG'}">
					<option value="PG">PG</option>
				</c:if>
				
				<c:if test="${rating eq 'PG-13'}">
					<option value="PG-13" selected="selected">PG-13</option>
				</c:if>
				<c:if test="${rating ne 'PG-13'}">
					<option value="PG-13">PG-13</option>
				</c:if>
				
				<c:if test="${rating eq 'R'}">
					<option value="R" selected="selected">R</option>
				</c:if>
				<c:if test="${rating ne 'R'}">
					<option value="R">R</option>
				</c:if>
				
				<c:if test="${rating eq 'NC-17'}">
					<option value="NC-17" selected="selected">NC-17</option>
				</c:if>
				<c:if test="${rating ne 'NC-17'}">
					<option value="NC-17">NC-17</option>
				</c:if>
			</select>
			
			<!-- 제목 검색 -->
			Title :
			<input type="text" name="title">
			
			<!-- 배우 검색 -->
			Actors : 
			<input type="text" name="actors">
			
			<button id="btn" type="button">검색</button>
		</form>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>filmID</th>
				<th>title</th>
				<th>category</th>
				<th>price</th>
				<th>rating</th>
				<th>actors</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${filmList}">
				<tr>
				   <td>${m.FID}</td>
					<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${m.FID}">${m.title}</a></td>
					<td>${m.category}</td>
					<td>${m.price}</td>
					<td>${m.rating}</td>
					<td>${m.actors}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&category=${category}&price=${price}&rating=${rating}&title=${title}&actors=${actors}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&category=${category}&price=${price}&rating=${rating}&title=${title}&actors=${actors}">다음</a></li>
        </c:if>
    </ul>
</div>
</body>
</html>