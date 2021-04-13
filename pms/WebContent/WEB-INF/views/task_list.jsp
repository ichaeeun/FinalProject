<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <title>Tasks List</title>
        <style type="text/css">
        table#demo-foo-filtering tr:first-child th { background:  rgba(0, 0, 0, 0.075);}
        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">

		<!-- App css -->
		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

		<!-- icons -->
		<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
		<%-- j-query --%>
		<script type="text/javascript" src="/springweb/a00_com/jquery-3.5.1.js"></script>
<script>
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
                        <div class="row">
						   <div class="row" style="padding-top:10px;">
							<a href="${path }/task.do?method=view"><button class="btn btn-primary btn-md">${task.project_name }</button></a>
							</div> 
							<div class="col-xl-12">
								 <ul class="nav nav-tabs nav-bordered" style="padding-top:10px;">
						            <li class="nav-item">
						                      <a href="${path }/task.do?method=view"  class="nav-link ">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-book-open"></i></span>
						                    <span class="d-none d-sm-inline-block">오버뷰</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/task.do?method=list" class="nav-link active">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-task"></i></span>
						                    <span class="d-none d-sm-inline-block">태스크리스트</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="#"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bxs-dashboard"></i></span>
						                    <span class="d-none d-sm-inline-block">대시보드</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/main.do?method=gantt"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class=" bx bx-bar-chart-square"></i></span>
						                    <span class="d-none d-sm-inline-block">간트차트</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="#"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-calendar"></i></span>
						                    <span class="d-none d-sm-inline-block">캘린더</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/task.do?method=log"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-comment-dots"></i></span>
						                    <span class="d-none d-sm-inline-block">활동로그</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/main.do?method=riskBoard"  class="nav-link">
						                           <span class="d-inline-block d-sm-none"><i class="bx bx-info-circle"></i></span>
						                           <span class="d-none d-sm-inline-block">리스크</span>
						                </a>
						            </li>
						         </ul> 
							</div>
						</div>
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">Tasks List</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Tasks</a></li>
                                            <li class="breadcrumb-item active">Tasks List</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Tasks List</h4>
                                        <p class="sub-header">
                                            현재 프로젝트의 전체 태스크 리스트 입니다.
                                        </p>
    
                                        <div class="mb-2">
                                            <div class="row row-cols-lg-auto g-2 align-items-center">
                                                <div class="col-12">
                                                    <div>
                                                        <select id="demo-foo-filter-status" class="form-select form-select-sm">
                                                            <option value="">Show all</option>
                                                            <option value="High">High</option>
                                                            <option value="Medium">Medium</option>
                                                            <option value="Low">Low</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <input id="demo-foo-search" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="table-responsive">
                                            <table id="demo-foo-filtering" class="table table-bordered toggle-circle mb-0" data-page-size="7">
                                                <thead>
                                                <tr>
                                                	<th>Task ID</th>
                                                    <th data-toggle="true">Tasks</th>
                                                    <th>Assign to</th>
                                                    <th data-hide="phone, tablet">Due Date</th>
                                                    <th data-hide="phone, tablet">Task priority</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="task" items="${TaskList}">          
                                                <tr  onclick="location.href='${path}/taskdetail.do?method=list&task_no=${task.task_no}'">
                                                	<td>${task.task_no}</td>
                                                    <td>${task.task_name}</td>
                                                    <td>${task.name}</td>
                                                    <td>${task.enddte}</td>                                             
                                                      <td>
                                                      <c:choose>    
                                                      <c:when test="${task.task_priority eq 'High'}">
                                                      	<span class="badge label-table badge-soft-danger p-1">
                                                      </c:when>
                                                      <c:when test="${task.task_priority eq 'Medium'}">
                                                      	<span class="badge label-table badge-soft-success p-1">
                                                      </c:when>
                                                      <c:otherwise>
                                                      	<span class="badge label-table badge-soft-info p-1">
                                                      </c:otherwise>
                                                  	</c:choose>	
                                                  	${task.task_priority}</span></td> 
                                                </tr>
                                            </c:forEach>                                                                   
                                                </tbody>
                                                <tfoot>
                                                <tr class="active">
                                                    <td colspan="10">
                                                        <div>
                                                            <ul class="pagination pagination-rounded justify-content-end footable-pagination mb-0"></ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tfoot>
                                            </table>
                                        </div> <!-- end .table-responsive-->
                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->
                                              <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">마감 임박</h4>
                                        <p class="sub-header">
                                            시한이 얼마 남지 않은 태스크 입니다.
                                        </p>

                                        <table class="tablesaw table mb-0" data-tablesaw-sortable data-tablesaw-sortable-switch>
                                            <thead>
                                            <tr>
                                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="persist">Task ID</th>
                                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-sortable-default-col data-tablesaw-priority="3">Tasks</th>
                                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="2">Assign to</th>
                                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="1">Due Date</th>
                                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="4">Task priority</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                          <c:forEach var="task" items="${TaskList2}">          
                                                <tr  onclick="location.href='${path}/taskdetail.do?method=list'">
                                                	<td>${task.task_no}</td>
                                                    <td>${task.task_name}</td>
                                                    <td>${task.name}</td>
                                                    <td>${task.enddte}</td>                                             
                                                      <td>
                                                      <c:choose>    
                                                      <c:when test="${task.task_priority eq 'High'}">
                                                      	<span class="badge label-table badge-soft-danger p-1">
                                                      </c:when>
                                                      <c:when test="${task.task_priority eq 'Medium'}">
                                                      	<span class="badge label-table badge-soft-success p-1">
                                                      </c:when>
                                                      <c:otherwise>
                                                      	<span class="badge label-table badge-soft-info p-1">
                                                      </c:otherwise>
                                                  	</c:choose>	
                                                  	${task.task_priority}</span></td> 
                                                </tr>
                                            </c:forEach>                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col-->
                        </div>
                        <!-- end row -->
                        
                    </div> <!-- container-fluid -->

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
        <jsp:include page="right.jsp"></jsp:include>        
        <!-- /Right-bar -->
        
        <!-- Right bar overlay-->

        <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>
        <!-- Footable js -->
        <script src="${path}/Admin/dist/assets/libs/footable/footable.all.min.js"></script>
        <!-- Init js -->
        <script src="${path}/Admin/dist/assets/js/pages/foo-tables.init.js"></script>
        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
    </body>
</html>