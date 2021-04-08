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
        <meta charset="utf-8" />
        <title>Products List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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

    </head>

<body class="loading" data-layout-mode="detached" data-layout='{"mode": "light", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "light", "size": "default", "showuser": true}, "topbar": {"color": "dark"}, "showRightSidebarOnPageLoad": true}'>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Topbar Start -->
            <jsp:include page="top.jsp"/>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
            <jsp:include page="side.jsp" flush="false"/>
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
                                    <h4 class="page-title">프로젝트 리스트</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">eCommerce</a></li>
                                            <li class="breadcrumb-item active">Products List</li>
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
                                        <div class="row mb-2">
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-1"></i>프로젝트 추가</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="float-sm-end">
                                                    
                                                    <button type="button" class="btn btn-success mb-2 mb-sm-0"><i class="mdi mdi-cog"></i></button>
                                                    
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                        <!-- end row -->
                
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
                                                        <th>프로젝트번호</th>
                                                        <th>시작일</th>
                                                        <th>종료일</th>
                                                        <th>담당PM</th>
                                                        <th>Quantity</th>
                                                        <th>현재상태</th>
                                                        <th style="width: 85px;">Action</th>
                                                    </tr>
                                                </thead>
                                                <!-- ---------------------------------------------------- -->
                                                <!-- 테이블 몸통 시작(데이터베이스에 있는 목록 출력) -->
                                                <!-- ---------------------------------------------------- -->
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
                                                        <td>
                                                            ${bd.project_no}
                                                        </td>
                                                        <td>
                                                            ${bd.start1}
                                                        </td>
                                                        <td>
                                                            ${bd.end1}
                                                        </td>
                                                        <td>
                                                            ${bd.pm_pno}
                                                        </td>
                                                        <td>
                                                            @@
                                                        </td>
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
                                            	<!-- ---------------------------------------------------- -->
                                                <!-- 테이블 몸통 끝-->
                                                <!-- ---------------------------------------------------- -->
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

        <!-- Right Sidebar -->
        <jsp:include page="right.jsp" flush="false"/>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

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