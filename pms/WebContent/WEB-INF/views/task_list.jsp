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
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body">
                                                <!-- cta -->
                                                <div class="row">
                                                	<c:if test="${mem.auth == 'pm' }">
                                                    <div class="col-sm-3">
                                                        <a href="#" class="btn btn-primary waves-effect waves-light"><i class='fe-plus me-1'></i>할일 추가</a>
                                                    </div>
                                                    </c:if>
                                                    <div class="col-sm-9">
                                                        <div class="float-sm-end mt-3 mt-sm-0">
                                                            <div class="d-flex align-items-start flex-wrap">
                                                                <div class="mb-3 mb-sm-0 me-sm-2">
                                                                    <form>
                                                                        <div class="position-relative">
                                                                            <input type="text" class="form-control" placeholder="Search...">
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn btn-light dropdown-toggle" type="button"
                                                                        data-bs-toggle="dropdown" aria-haspopup="true"
                                                                        aria-expanded="false">
                                                                        <i class="mdi mdi-filter-variant"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-end">
                                                                        <a class="dropdown-item" href="#">Due Date</a>
                                                                        <a class="dropdown-item" href="#">Added Date</a>
                                                                        <a class="dropdown-item" href="#">Assignee</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="custom-accordion">
                                                    <div class="mt-4">
                                                        <h5 class="position-relative mb-0"><a href="#taskcollapse1" class="text-dark d-block" data-bs-toggle="collapse">오늘의 할일 <span class="text-muted">(${TaskList.size()})</span> <i class="mdi mdi-chevron-down accordion-arrow"></i></a></h5>
                                                        <div class="collapse show" id="taskcollapse1">
                                                            <div class="table-responsive mt-3">
                                                                <table class="table table-centered table-nowrap table-borderless table-sm">
                                                                    <thead class="table-light">
                                                                        <tr class="">
                                                                            <th scope="col">
                                                                                <div class="form-check">
                                                                                    <label class="form-check-label" for="tasktodayCheck">Task ID</label>
                                                                                </div>
                                                                            </th>
                                                                            <th scope="col">Tasks</th>
                                                                            <th scope="col">Assign to</th>
                                                                            <th scope="col">Due Date</th>
                                                                            <th scope="col">Task priority</th>                                                                  
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach var="task" items="${TaskList}">                    
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <label class="form-check-label" for="tasktodayCheck01">${task.task_no}</label>
                                                                                </div>
                                                                            </td>
                                                                            <td onclick="location.href='${path}/taskdetail.do?method=list'">${task.task_name }</td>
                                                                            <td>
                                                                            ${task.name}
                                                                            </td>
                                                                            <td>${task.enddte}</td>
                                                                            <td>
                                                                            <c:choose>    
                                                                            <c:when test="${task.task_priority eq 'High'}">
                                                                            	<span class="badge badge-soft-danger p-1">
                                                                            </c:when>
                                                                            <c:when test="${task.task_priority eq 'Medium'}">
                                                                            	<span class="badge badge-soft-success p-1">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            	<span class="badge badge-soft-info p-1">
                                                                            </c:otherwise>
                                                                        	</c:choose>	
                                                                        	${task.task_priority}</span></td> 
                                                                        </tr>
                                                                       </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="mt-4">
                                                        <h5 class="position-relative mb-0"><a href="#taskcollapse2" class="text-dark d-block" data-bs-toggle="collapse">마감 임박<span class="text-muted">(${TaskList.size()})</span> <i class="mdi mdi-chevron-down accordion-arrow"></i></a></h5>
                                                        <div class="collapse show" id="taskcollapse2">
                                                            <div class="table-responsive mt-3">
                                                                <table class="table table-centered table-nowrap table-borderless table-sm">
                                                                    <thead class="table-light">
                                                                        <tr class="">
                                                                            <th scope="col">
                                                                                <div class="form-check">      
                                                                                    <label class="form-check-label" for="taskupcomingCheck">Task ID</label>
                                                                                </div>
                                                                            </th>
                                                                            <th scope="col">Tasks</th>
                                                                            <th scope="col">Assign to</th>
                                                                            <th scope="col">Due Date</th>
                                                                            <th scope="col">Task priority</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    
                                                                  		<c:forEach var="task" items="${TaskList2}" begin="0" end="4">                    
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <label class="form-check-label" for="tasktodayCheck01">${task.task_no}</label>
                                                                                </div>
                                                                            </td>
                                                                            
                                                                            <td onclick="location.href='${path}/taskdetail.do?method=list'">${task.task_name }</td>
                                                                            
                                                                            <td>
                                                                            ${task.name}
                                                                                
                                                                            </td>
                                                                            <td>${task.enddte}</td>
																			<td>
                                                                            <c:choose>    
                                                                            <c:when test="${task.task_priority eq 'High'}">
                                                                            	<span class="badge badge-soft-danger p-1">
                                                                            </c:when>
                                                                            <c:when test="${task.task_priority eq 'Medium'}">
                                                                            	<span class="badge badge-soft-success p-1">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            	<span class="badge badge-soft-info p-1">
                                                                            </c:otherwise>
                                                                        	</c:choose>	
                                                                        	${task.task_priority}</span></td> 
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
                                    </div>
                                </div>
                            </div>
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

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>