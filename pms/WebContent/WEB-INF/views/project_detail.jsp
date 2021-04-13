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
        <link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">
		<!-- App css -->
		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />
		<!-- icons -->
		<link href="${path }/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

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
										<ul class="nav nav-tabs nav-bordered" style="margin-top:10px;">
								            <li class="nav-item">
												<a href="${path }/task.do?method=view"  class="nav-link active">
													<span class="d-inline-block d-sm-none"><i class="mdi mdi-home-variant"></i></span>
													<span class="d-none d-sm-inline-block">오버뷰</span>
												</a>
											</li>
											<li class="nav-item">
												<a href="${path}/task.do?method=list" class="nav-link">
								                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
								                    <span class="d-none d-sm-inline-block">태스크리스트</span>
								                </a>
								            </li>
								            <li class="nav-item">
								                <a href="${path}/dashboard.do?method=list"  class="nav-link">
								                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
								                    <span class="d-none d-sm-inline-block">대시보드</span>
								                </a>
								            </li>
								            <li class="nav-item">
								                <a href="${path}/gantt.do?method=gantt"  class="nav-link">
								                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-email-variant"></i></span>
								                    <span class="d-none d-sm-inline-block">간트차트</span>
								                </a>
								            </li>
								            <li class="nav-item">
								                <a href="${path}/cal.do?method=list"  class="nav-link">
								                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
								                    <span class="d-none d-sm-inline-block">캘린더</span>
								                </a>
								            </li>
								            <li class="nav-item">
								                <a href="${path}/task.do?method=log"  class="nav-link">
								                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
								                    <span class="d-none d-sm-inline-block">활동로그</span>
								                </a>
								            </li>
								            <li class="nav-item">
								                <a href="${path}/risk.do?method=riskBoard"  class="nav-link">
													<span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
													<span class="d-none d-sm-inline-block">리스크</span>
								                </a>
								            </li>
										</ul>
									</div>
								</div>
                            </div>
						</div>
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <div class="row">
                                                <div class="project-body">
                                                    <div class="py-1">
                                                        <i class="fe-archive font-24"></i>
                                                        <h3 class="text-warning">${pms_project.project_name}</h3>
                                                        <p class="text-uppercase mb-1 font-13 fw-medium">
                                                        프로젝트 관리 소프트웨어는 리소스 도구를 계획, 조직, 관리하는 것을 도와주고 리소스 추산치를 만드는 소프트웨어이다.<br>
                                                        프로젝트 관리 시스템은 프로젝트의 정량적인 성과 및 진행 지표를 체계적으로 관리하기 위한 것이다. 
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                        
                    </div> <!-- container -->

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