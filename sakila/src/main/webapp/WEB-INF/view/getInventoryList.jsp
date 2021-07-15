<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="${pageContext.request.contextPath}/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<title>getInventoryList</title>
<body>
    <%-- <div align="right"> *** UI 적용으로 사용 안하는 기능 ***
	    <form action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
	        <!-- 드롭다운으로 storeId 선택 가능하게 하기 -->
	        Store :
		    <select name="storeId">
	            <option value="">선택</option>
	               <c:if test="${storeId == 1}">
	                   <option value="1" selected="selected">store 1</option>
	                </c:if>
	                <c:if test="${storeId != 1}">
	                   <option value="1">store 1</option>
	                </c:if>
	                <c:if test="${storeId == 2}">
	                   <option value="2" selected="selected">store 2</option>
	                </c:if>
	                <c:if test="${storeId != 2}">
	                   <option value="2">store 2</option>
	                </c:if>
			</select>
	        
	        <!-- 검색어 입력창 -->
	        <label for="searchWord">검색어(영화 제목) :</label> 
	        <input name="searchWord" type="text">
	        <button type="submit">검색</button>
	    </form>
	</div> --%>
    
    <!--*******************
        Preloader start (페이지 로딩중일 때 뜨는 아이콘)
	    ********************-->
	    <div id="preloader">
	        <div class="loader">
	            <svg class="circular" viewBox="25 25 50 50">
	                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
	            </svg>
	        </div>
	    </div>
	    <!--*******************
	        Preloader end
	    ********************-->
		
		<!--**********************************
	        Main wrapper start
	    ***********************************-->
	    <div id="main-wrapper">
	    
	    <!--**********************************
	            Nav header start (로고 자리)
	        ***********************************-->
	    <div class="nav-header">
	        <div class="brand-logo">
	            <a href="${pageContext.request.contextPath}/">
	                <b class="logo-abbr"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""> </b>
	                <span class="logo-compact"><img src="${pageContext.request.contextPath}/images/logo-compact.png" alt=""></span>
	                <span class="brand-title">
	                    <img src="${pageContext.request.contextPath}/images/logo-text.png" alt="">
	                </span>
	            </a>
	        </div>
	    </div>
	    <!--**********************************
	        Nav header end
	    ***********************************-->
	    
	    <!--**********************************
	            Header start
	        ***********************************-->
	    <div class="header">    
	        <div class="header-content clearfix">
	            <div class="nav-control">
	                <div class="hamburger">
	                    <span class="toggle-icon"><i class="icon-menu"></i></span>
	                </div>
	            </div>
	            <div class="header-right">
	                <ul class="clearfix">
	                    <li class="icons dropdown">
	                        <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
	                            <span class="activity active"></span>
	                            <img src="${pageContext.request.contextPath}/images/user/1.png" height="40" width="40" alt="">
	                        </div>
	                        <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
	                            <div class="dropdown-content-body">
	                                <ul>
	                                    <li><a href="${pageContext.request.contextPath}/admin/logout"><i class="icon-key"></i> <span>Logout</span></a></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <!--**********************************
	        Header end ti-comment-alt
	    ***********************************-->
	
		<!--**********************************
            Sidebar start
        ***********************************-->
		<!-- mainMenu -->
		<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
		<!--**********************************
            Sidebar end
        ***********************************-->
		
		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/getInventoryList">InventoryList</a></li>
                        <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/">Dashboard</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
            
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Inventory List</h4>
                                <hr class="my-2">
                                <div align="right">
                                	<a class="btn mb-1 btn-outline-primary" href="${pageContext.request.contextPath}/admin/addInventory">재고 추가</a>
                                	<a class="btn mb-1 btn-outline-primary" href="${pageContext.request.contextPath}/admin/removeInventory">재고 삭제</a>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered zero-configuration">
                                        <thead>
                                            <tr>
                                                <th>storeID</th>
								                <th>title</th>
								                <th>totalInventory</th>
								                <th>totalRental</th>
								                <th>totalStock</th>
                                            </tr>
                                        </thead>
                                        <tbody>
								            <c:forEach var="i" items="${inventoryList}">
								                <tr>
								                	<td>${i.storeId}</td>
								                    <td>${i.title}</td>
								                    <td>${i.totalInventory}</td>
								                    <td>${i.rental}</td>
								                    <td>${i.stock}</td>
								                </tr>
								            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>

		<!--**********************************
	       Footer
	   	***********************************-->
		
		<div class="footer">
			<div class="copyright">
			    <p>Copyright &copy; Developed by <a href="https://https://jung-ah-c.github.io/">JungAh Choi</a> 2021</p>
			    <p>Copyright &copy; Designed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2021</p>
			</div>
		</div>
	
		<!--**********************************
		       Scripts
		   	***********************************-->
		<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/settings.js"></script>
		<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
		<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>
		
		<script src="${pageContext.request.contextPath}/plugins/tables/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

	<!--**********************************
            Main wrapper end
        ***********************************-->
    
    <%-- <!-- 페이징 --> *** UI 적용으로 사용 안하는 기능 ***
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}">다음</a></li>
        </c:if>
    </ul> --%>
</body>
</html>