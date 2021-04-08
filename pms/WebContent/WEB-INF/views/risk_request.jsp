<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<c:if test="${mem.auth == 'ceo' }"><title>최고경영자</title></c:if>
	<c:if test="${mem.auth == 'hp' }"><title>인사담당자</title></c:if>
	<c:if test="${mem.auth == 'pm' }"><title>프로젝트 매니저</title></c:if>
	<c:if test="${mem.auth == 'wk' }"><title>개발자</title></c:if>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
	<meta content="Coderthemes" name="author" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >	
	<!-- App favicon -->
	<link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">

       <!-- third party css -->
       <link href="${path}/Admin/dist/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
       <link href="${path}/Admin/dist/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

	<!-- App css -->
	<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
	<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

	<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
	<link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

	<!-- icons -->
	<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
</head>
	<body class="loading">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Topbar Start -->
			<jsp:include page="top.jsp"></jsp:include>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
			<jsp:include page="side.jsp"></jsp:include>
            <!-- Left Sidebar End -->

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">리스크</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="${path}/main.do?method=main">메인</a></li>
                                            <li class="breadcrumb-item active">리스크 보드</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                            			<c:if test="${mem.auth == 'wk'}">
                                        <div class="row mb-2">
                                            <div class="col-sm-6">
                                                <a href="${path}/risk.do?method=riskBoardCreate" class="btn btn-danger mb-2" id="regBtn">리스크 작성하기</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="float-sm-end">
                                                    <button type="button" class="btn btn-success mb-2 mb-sm-0"><i class="mdi mdi-cog"></i></button>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                          				</c:if>
                                        <!-- end row -->
                
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="all" style="width: 20px;">
                                                            <div class="form-check mb-0 font-16">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck">
                                                                <label class="form-check-label" for="productlistCheck">&nbsp;</label>
                                                            </div>
                                                        </th>
                                                        <th class="all">번호</th>
                                                        <th>제목</th>
                                                        <th>프로젝트 이름</th>
                                                        <th>리스크 카테고리</th>
                                                        <th>등록일</th>
                                                        <th>리스크 상태</th>
                                                        <th>작성자</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                               	<c:forEach var="rl" items="${risklist}">
                                                    <tr>
                                                        <td>
                                                            <div class="form-check mb-0 font-16">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck1">
                                                                <label class="form-check-label" for="productlistCheck1">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                 			${rl.risk_no}
                                                        </td>
                                                        <td>   
                                                            <h5 class="m-0 d-inline-block align-middle"><a href="${path}/risk.do?method=riskDetail" class="text-dark"> ${rl.risk_title}</a></h5>
                                                        </td>
                                                        <td>
                                                            <h5 class="m-0 d-inline-block align-middle"><a href="${path}/risk.do?method=riskDetail" class="text-dark"> ${rl.risk_content}</a></h5>
                                                        </td>
                                                        <td>
                                                   			${rl.risk_parent_no}
                                                        </td>
                                                        <td>
                                                            <fmt:formatDate value="${rl.regdte}"/>
                                                        </td>
                                                        <td>
                                                            <div>
                                                   				${rl.risk_category}
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                     				${rl.risk_title}
                                                            </div>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                              		</c:forEach>
                                                    <!-- 복붙해야할부분 -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->
                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <script>document.write(new Date().getFullYear())</script> &copy; Minton theme by <a href="">Coderthemes</a> 
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end footer-links d-none d-sm-block">
                                    <a href="javascript:void(0);">About Us</a>
                                    <a href="javascript:void(0);">Help</a>
                                    <a href="javascript:void(0);">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <jsp:include page="right.jsp"></jsp:include>
        
         <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>

        <!-- third party js -->
        <script src="${path}/Admin/dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/jquery-datatables-checkboxes/js/dataTables.checkboxes.min.js"></script>
        <!-- third party js ends -->

        <script src="${path}/Admin/dist/assets/js/pages/product-list.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>