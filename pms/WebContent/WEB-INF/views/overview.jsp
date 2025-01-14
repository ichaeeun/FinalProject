<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>overview</title>
<style type="text/css">
.project-body {
	text-align: left !important;
}

.bg-vio {
	background-color: #B396FF !important;
}

.text-vio {
	color: #B396FF !important;
}

.curpoint {
	cursor: pointer;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="${path}/Admin/dist/assets/images/favicon.ico">

<!-- third party css -->
<link
	href="${path}/Admin/dist/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${path}/Admin/dist/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />

<!-- App css -->
<link
	href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css"
	rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css"
	rel="stylesheet" type="text/css" id="app-default-stylesheet" />

<link
	href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css"
	rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
<link
	href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css"
	rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

<!-- icons -->
<link href="${path}/Admin/dist/assets/css/icons.min.css"
	rel="stylesheet" type="text/css" />
<script src="${path}/a00_com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("dd");
}
	var mem = "${mem.id}";
	if(mem==""){
			alert("세션이 만료되어 로그인화면으로 이동합니다.");
			location.href="${path}/main.do?method=loginform"; // 세션값 없을 때 바로 로그인폼 이동
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

				<!-- Start Content -->
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
									class="nav-link active"> <span
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
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
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
									href="${path}/risk.do?method=riskRequest&no=${param.no}" class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-info-circle"></i></span> <span
										class="d-none d-sm-inline-block">리스크 요청</span>
								</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- 상단 탭바 끝 -->

					<!--  start page title -->
					<!--                         <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">Overview</h4>
                                    
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Apps</a></li>
                                            <li class="breadcrumb-item active">Tickets</li>
                                        </ol>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>      -->
					<!-- end page title  -->

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="text-center">
										<div class="row">
											<div class="project-body">
												<div class="py-1">
													<i class="fe-archive font-24"></i>
													<h3 class="text-warning">${project.project_name}</h3>
													<%--  --%>
													<p class="text-uppercase mb-1 font-13 fw-medium">
														${project.project_content}</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<table
										class="table table-hover m-0 table-centered dt-responsive nowrap w-100 table01"
										cellspacing="0" id="tickets-table">
										<thead class="bg-light">
											<tr>
												<th class="fw-medium" style="width: 25px">ID</th>
												<th class="fw-medium" style="width: 100px">팀원명</th>
												<th class="fw-medium">태스크 진행율</th>
												<th class="fw-medium" style="width: 100px">태스크 개수</th>
											</tr>
										</thead>

										<tbody class="font-14">
											<c:forEach var="view" items="${ViewMem}">
												<tr>
													<td><b>${view.pno}</b></td>
													<td class="curpoint"
														onclick="location.href='${path}/manpower.do?method=contacts_profile&ename=${view.name}&pno=${view.pno}'">${view.name}</td>
													<td><c:choose>
															<c:when test="${view.task_tot==0}">
																<div class="progress mb-0 " style="width: 80%;">
																	<div
																		class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
																		role="progressbar" aria-valuenow="0" aria-valuemin="0"
																		aria-valuemax="1"></div>
																</div>
															</c:when>
															<c:otherwise>
																<div class="progress mb-0" style="width: 80%;">
																	<div
																		class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
																		role="progressbar"
																		aria-valuenow="${Integer.toString(view.task_done/view.task_tot*100)}"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width:${Integer.toString(view.task_done/view.task_tot*100)}%"></div>
																</div>

															</c:otherwise>
														</c:choose></td>
													<td style="text-align: center;">${view.task_tot}개</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- end col -->
					</div>

					<!-- end row -->

					<!-- start row -->
					<!-- end row -->
				</div>
				<!-- container -->

			</div>
			<!-- content -->

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
	<jsp:include page="right.jsp"></jsp:include>
	<!-- /Right-bar -->

	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<!-- Vendor js -->
	<script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>

	<!-- third party js -->
	<script
		src="${path}/Admin/dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${path}/Admin/dist/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${path}/Admin/dist/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${path}/Admin/dist/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	<!-- third party js ends -->

	<script src="${path}/Admin/dist/assets/js/pages/tickets.init.js"></script>

	<!-- App js -->
	<script src="${path}/Admin/dist/assets/js/app.min.js"></script>

</body>
</html>
