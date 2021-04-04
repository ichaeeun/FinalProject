<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form"
		uri="http://www.springframework.org/tags/form"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${path }/a00_com/assets/images/favicon.ico">
		<!-- App css -->
		<link href="${path }/a00_com/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
		<link href="${path }/a00_com/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />
		<link href="${path }/a00_com/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
		<link href="${path }/a00_com/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />
		<!-- icons -->
		<link href="${path }/a00_com/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

$(document).ready(function(){
   
});
function goPage(page){
		$("[name=curPage]").val(page);
		$("form").submit();
	};
</script>
</head>

<body class="loading">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Topbar Start -->
            <jsp:include page="top.jsp" flush="false"/>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
            <jsp:include page="side.jsp" flush="false"/>
            <!-- Left Sidebar End -->

             <!-- ============================================================== -->
            <!-- Start Page Content here(완료한 프로젝트 테이블로 출력) -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
			
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-sm-6">
                                                <a href="${path }/task.do?method=view" class="btn btn-info mb-2">오버뷰</a>
                                                <a href="${path}/" class="btn btn-info mb-2">대시보드</a>
                                                <a href="${path}/main.do?method=gantt" class="btn btn-info mb-2">간트</a>
                                                <a href="${path}/main.do?method=gantt" class="btn btn-info mb-2">캘린더</a>
                                                <a href="${path}/task.do?method=list" class="btn btn-info mb-2">태스크리스트</a>
                                                <a href="${path}/task.do?method=log" class="btn btn-info mb-2">활동로그</a>
                                                <a href="${path}/main.do?method=riskBoard" class="btn btn-info mb-2">리스크</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="float-sm-end">
                                                    
                                                    <button type="button" class="btn btn-success mb-2 mb-sm-0"><i class="mdi mdi-cog"></i></button>
                                                    
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                        <!-- end row -->
                                        
                						<!-- ================================ -->
                						<!-- 테이블 관련 코드 시작 -->
                						<!-- ================================ -->
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="all" style="width: 20px;">
                                                            <div class="form-check font-16 mb-0">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck">
                                                                <label class="form-check-label" for="productlistCheck">&nbsp;</label>
                                                            </div>
                                                        </th>
                                                        <th class="all">프로젝트명</th>
                                                        <th>시작일</th>
                                                        <th>종료일</th>
                                                        <th>담당PM</th>
                                                        <th>현재상태</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <form:form modelAttribute="sch" method="post">
                                                <div class="input-group-prepend">
									  		<span class="btn btn-info">총 : ${sch.count} 건</span>
									  		
									  	</div>
	                                                <%--현재 클릭한 페이지번호 --%>
											     	<form:hidden path="curPage"/>
													<form:input path="project_name" placeholder="제목" />
											
													<button class="btn btn-success" type="submit">Search</button>

                                                </form:form>
                                                
                                                
                                                <tbody>
                                                <c:forEach var="bd" items="${boardList}">
                                                    <tr>
                                                        <td>
                                                            <div class="form-check font-16 mb-0">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck1">
                                                                <label class="form-check-label" for="productlistCheck1">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="m-0 d-inline-block align-middle"><a href="#" class="text-dark">${bd.project_name}</a></h5>
                                                        </td>
                                                        <td>${bd.start1}</td>
                                                        <td>${bd.end1}</td>
                                                        <td>${bd.pm_pno}</td>
                                                        <td>
                                                            <span class="badge badge-soft-success">${bd.project_status}</span>
                                                        </td>
                                                        <td>
                                                            <ul class="list-inline table-action m-0">
                                                                <li class="list-inline-item"> 
                                                                    <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
                                                                </li>
                                                                <li class="list-inline-item"> 
                                                                    <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                                                                </li>
                                                                <li class="list-inline-item"> 
                                                                    <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    	<!-- ================================ -->
                						<!-- 테이블 관련 코드 끝 -->
                						<!-- ================================ -->
                						
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        
                    </div> <!-- container -->
                <!-- ===================== -->    
				<!-- 페이지 번호 관련 코드 start -->
			<ul class="pagination justify-content-center"> 
			  	<li class="page-item">
			  	<!-- 이전(previous)을 클릭시, 기본적으로 현재블럭의 시작번호 -1로 처리되게 한다. -->
			  	<a class="page-link" 
			  		href="javascript:goPage(${sch.startBlock-1})">Previous</a>
			  	</li>
			  	<!-- 블럭은 시작블럭과 마지막 블럭번호를 반복문으로 수행하게 한다. -->
			  	<c:forEach var="cnt" begin="${sch.startBlock}" 
			  						 end="${sch.endBlock}">
			  		<!-- 클릭한 현재 페이지번호와 반복되는 페이지 번호가 같으면 active 클래스 적용 -->
			  		<li class="page-item ${sch.curPage==cnt?'active':''}">
				  		<a class="page-link" 
				  		href="javascript:goPage(${cnt})">${cnt}</a></li>
			  	</c:forEach>
			  	<li class="page-item">
			  	<!-- 다음(next)을 클릭시, 현재블럭의 마지막번호 +1로 처리되게 한다. -->
			  	<a class="page-link" 
			  		href="javascript:goPage(${sch.endBlock+1})">Next</a>
			  	</li>
		  	</ul>
		  	<!-- 페이징 번호 관련 코드 end -->
		  	<!-- =================== -->
                </div> <!-- content -->

            </div>
			<!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
        </div>
        <!-- END wrapper -->

        <!-- Right Sidebar -->
        <jsp:include page="right.jsp" flush="false"/>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>

        <!-- plugin js -->
        <script src="${path}/Admin/dist/assets/libs/moment/min/moment.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/@fullcalendar/core/main.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/@fullcalendar/bootstrap/main.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/@fullcalendar/daygrid/main.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/@fullcalendar/timegrid/main.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/@fullcalendar/list/main.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/@fullcalendar/interaction/main.min.js"></script>

        <!-- Calendar init -->
        <script src="${path}/Admin/dist/assets/js/pages/calendar.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>