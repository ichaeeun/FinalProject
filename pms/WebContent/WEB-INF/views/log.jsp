<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jsexp.z01_vo.*"
    import="jsexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <title>활동로그</title>
        <style type="text/css">
        #basic-datatable_filter { display:none!important; }
        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">

        <!-- third party css -->
        <link href="${path}/Admin/dist/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/Admin/dist/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/Admin/dist/assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/Admin/dist/assets/libs/datatables.net-select-bs4/css//select.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

		<!-- App css -->
		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

		<!-- icons -->
		<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
		
		<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
		<script type="text/javascript">

		$(document).ready(function() {

		    $('#basic-datatabl').DataTable( {
		        "order": [[ 0, "desc" ]]
		    } );
		} );
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
						<div class="row" style="padding-top: 10px;">
							<a href="#"><button
									class="btn btn-primary btn-md">${project.project_name}
								</button></a>
							<%-- ${ViewMem.project_name} --%>
						</div>
						<div class="col-xl-12">
							<ul class="nav nav-tabs nav-bordered" style="padding-top: 10px;">
								<li class="nav-item"><a
									href="${path }/task.do?method=view&no=${param.no}"
									class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-book-open"></i></span> <span
										class="d-none d-sm-inline-block">오버뷰</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/task.do?method=list&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class="bx bx-task"></i></span> <span
										class="d-none d-sm-inline-block">태스크리스트</span>
								</a></li>
								<li class="nav-item"><a href="${path}/dashboard.do?method=list&no=${param.no}" class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bxs-dashboard"></i></span> <span
										class="d-none d-sm-inline-block">대시보드</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/gantt.do?method=gantt&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class=" bx bx-bar-chart-square"></i></span> <span
										class="d-none d-sm-inline-block">간트차트</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/cal.do?method=list&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class="bx bx-calendar"></i></span> <span
										class="d-none d-sm-inline-block">캘린더</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/task.do?method=log&no=${param.no}"
									class="nav-link active"> <span class="d-inline-block d-sm-none"><i
											class="bx bx-comment-dots"></i></span> <span
										class="d-none d-sm-inline-block">활동로그</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/risk.do?method=riskBoard&no=${param.no}" class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-info-circle"></i></span> <span
										class="d-none d-sm-inline-block">리스크 현황</span>
								</a></li>
								<c:if test="${mem.auth=='pm' }">
								 <li class="nav-item"><a
									href="${path}/risk.do?method=riskRequest&no=${param.no}" class="nav-link "> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-info-circle"></i></span> <span
										class="d-none d-sm-inline-block">리스크 요청</span>
								</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- 상단 탭바 끝 -->
                        <!-- start page title -->
    
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">활동 로그</h4>
                                        <p class="sub-header">
                                      		현재까지 활동들이 보여집니다.
                                            <code style="display:none;">$().DataTable();</code>.
                                        </p>
                                        <table id="basic-datatabl" class="table dt-responsive nowrap w-100">
                                        <col width="10%">
                                        <col width="90%">
                                            <thead>
                                                <tr>
                                                  <th id="sort">발생시간</th>
                                                  <th>log</th>                                                
                                                </tr>
                                            </thead>                                      
                                            <tbody>
                                            <c:forEach var="task" items="${taskLog}">                                          
                                                <tr>
                                                	<td>${task.regdte}</td>
                                                    <td>${task.name}님이 ${task.task_name}(${task.task_no}) 태스크를 생성했습니다.</td>											
                                                </tr>                                             
                                            </c:forEach>     
                                            <c:forEach var="req" items="${reqLog}">                                          
                                                <tr>
                                                	<td>${req.regdte}</td>
                                                    <td>${req.name}님이 ${req.task_name}(${req.task_no}) 승인요청 하였습니다.</td>											
                                                </tr>                                              
                                            </c:forEach>      
                                            <c:forEach var="ass" items="${projLog}">                                          
                                                <tr>
                                                	<td>${ass.regdte}</td>
                                                   <td>${ass.name}님이 ${ass.project_name}(${ass.project_no}) 에 할당되었습니다.</td>
                                                </tr>                                             
                                            </c:forEach>                                      
                                            </tbody>
                                        </table>

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->


                        
                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
              <jsp:include page="footer.jsp"></jsp:include>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- Right Sidebar -->
   
        <!-- /Right-bar -->
		<jsp:include page="right.jsp"></jsp:include>
        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>

        <!-- third party js -->
        <script src="${path}/Admin/dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/pdfmake/build/pdfmake.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/pdfmake/build/vfs_fonts.js"></script>
        <!-- third party js ends -->

        <!-- Datatables init -->
        <script src="${path}/Admin/dist/assets/js/pages/datatables.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>