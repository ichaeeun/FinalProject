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
<html>
<head>
<meta charset="UTF-8">
<c:if test="${mem.auth == 'ceo' }"><title>최고경영자</title></c:if>
<c:if test="${mem.auth == 'hp' }"><title>인사담당자</title></c:if>
<c:if test="${mem.auth == 'pm' }"><title>프로젝트 매니저</title></c:if>
<c:if test="${mem.auth == 'wk' }"><title>개발자</title></c:if>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<!-- App favicon -->
<link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">

<!-- App css -->
<%-- <link href="${path}/Admin/dist/assets/css/default/bootstrap.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
<link href="${path}/Admin/dist/assets/css/default/app.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

<link href="${path}/Admin/dist/assets/css/default/bootstrap-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
<link href="${path}/Admin/dist/assets/css/default/app-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" /> --%>

<link href="${path }/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
<link href="${path }/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

<link href="${path }/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
<link href="${path }/Admin/dist//assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />
<!-- icons -->
<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<script type="text/javascript">
		


	$(document).ready(function(){
		// 1. 프로젝트의 시작일과 종료일 date로 변환 //2021-03-01T00:00:00.000Z 형태를 // 2021-03-01로 
		
		
		
		// 파이차트에 들어갈 데이터
		var options = {
				chart: {
				      height: 250,
				      type: 'radialBar',
				  },
				  plotOptions: {
					    radialBar: {
					     dataLabels: {
					        showOn: "always",
					        name: {
					          offsetY: -10,
					          show: true,
					          color: "#888",
					          fontSize: "13px"
					        },
					        value: {
					          color: "#111",
					          fontSize: "30px",
					          show: true
					        }
					      }
					    }
					  },
				  
				  
				  stroke: {
					    lineCap: "round",
					},
				  series: [${Math.round(project.doday/project.allday*100 )}],
				  labels: ['${project.project_name}(${project.doday}/${project.allday})'],
				};
		var chart = new ApexCharts(document.querySelector("#chart1"), options);
		chart.render();
		var options = {
				  chart: {
				      height: 250,
				      type: 'radialBar',
				  },
				  series: [${Math.round(task.taskcnt/task.tasktotal*100)}],
				  labels: ['태스크진행도(${task.taskcnt}/${task.tasktotal})'],
				};
		var chart = new ApexCharts(document.querySelector("#chart2"), options);
		chart.render();
		var options = {
				  chart: {
				      height: 250,
				      type: 'radialBar',
				  },
				  series: [${Math.round(risk.riskcnt/risk.riskcnt*100)}],
				  labels: ['리스크진행도(${risk.riskcnt}/${risk.risktotal})'],
				};
		var chart = new ApexCharts(document.querySelector("#chart3"), options);
		chart.render();

				
	});
</script>
</head>
<body class="loading">

        <!-- Begin page -->
        <div id="wrapper">

            <jsp:include page="top.jsp" flush="false"/>

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
						<div class="row">
							<div class="row" style="padding-top:10px;">
														<a href="${path }/task.do?method=view"><button class="btn btn-primary btn-md">${project.project_name }</button></a>
														</div>
							<div class="col-xl-12">
									 <ul class="nav nav-tabs nav-bordered" style="padding-top:10px;">
							            <li class="nav-item">
							                      <a href="${path }/task.do?method=view&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-home-variant"></i></span>
							                    <span class="d-none d-sm-inline-block">오버뷰</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/task.do?method=list&no=${param.no}" class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
							                    <span class="d-none d-sm-inline-block">태스크리스트</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/dashboard.do?method=list&no=${param.no}"  class="nav-link active">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
							                    <span class="d-none d-sm-inline-block">대시보드</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/gantt.do?method=gantt&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-email-variant"></i></span>
							                    <span class="d-none d-sm-inline-block">간트차트</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/cal.do?method=list&no=${param.no}"  class="nav-link ">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                    <span class="d-none d-sm-inline-block">캘린더</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/task.do?method=log&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                    <span class="d-none d-sm-inline-block">활동로그</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/risk.do?method=riskBoard&no=${param.no}"  class="nav-link">
							                           <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                           <span class="d-none d-sm-inline-block">리스크</span>
							                </a>
							            </li>
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
							
							
							<div class="row">
								<div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Booked Revenue">프로젝트 남은 기간</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${project.allday-project.doday}</span>일</h3>
						                            <!-- 
						                            <p class="mb-0 text-muted">
						                                <span class="text-success me-2"><span class="mdi mdi-arrow-up-bold"></span> 34.61%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
						                             -->
						                        </div>
						                        <div class="avatar-sm">
						                            <span class="avatar-title bg-soft-primary rounded">
						                                <i class="ri-money-dollar-box-line font-20 text-primary"></i>
						                            </span>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div><!-- end col -->
							
							
						        <div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Campaign Sent">참여인원</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${member.membercnt}</span></h3>
						                            <!-- 
						                            <p class="mb-0 text-muted">
						                                <span class="text-success me-2"><span class="mdi mdi-arrow-up-bold"></span> 5.27%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
						                            -->
						                        </div>
						                        <div class="avatar-sm">
						                            <span class="avatar-title bg-soft-primary rounded">
						                                <i class="ri-stack-line font-20 text-primary"></i>
						                            </span>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div><!-- end col -->
						
						        <div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="New Leads">전체 태스크 수</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${task.tasktotal}</span></h3>
						                            <!-- 
						                            <p class="mb-0 text-muted">
						                                <span class="text-danger me-2"><span class="mdi mdi-arrow-down-bold"></span> 3.27%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
						                             -->
						                        </div>
						                        <div class="avatar-sm">
						                            <span class="avatar-title bg-soft-primary rounded">
						                                <i class="ri-slideshow-2-line font-20 text-primary"></i>
						                            </span>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div><!-- end col -->
						
						        <div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Deals">전체 리스크 수</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${risk.risktotal}</span></h3>
						                            <!-- 
						                            <p class="mb-0 text-muted">
						                                <span class="text-success me-2"><span class="mdi mdi-arrow-up-bold"></span> 8.58%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
						                             -->
						                        </div>
						                        <div class="avatar-sm">
						                            <span class="avatar-title bg-soft-primary rounded">
						                                <i class="ri-hand-heart-line font-20 text-primary"></i>
						                            </span>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div><!-- end col -->
						
						        
						        
						    </div>
						    <!-- end row -->
							<div class="row">
	                            <div class="col-xl-3 col-md-6">
	                                <div class="card">
	                                    <div class="card-body">
	                                        <div class="d-flex justify-content-between align-items-center">
	                                            <div class="knob-chart" dir="ltr">
	                                                <input data-plugin="knob" data-width="70" data-height="70" data-fgColor="#18c984"
	                                                    data-bgColor="#d1f2eb" value="${Math.round(project.doday/project.allday*100 )}"
	                                                    data-skin="tron" data-angleOffset="0" data-readOnly=true
	                                                    data-thickness=".15"/>
	                                            </div>
	                                            <div class="text-end">
	                                                <h3 class="mb-1 mt-0"> <span data-plugin="counterup">${Math.round(project.doday/project.allday*100 )}</span>%</h3>
	                                                <p class="text-muted mb-0">프로젝트 진행도</p>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div><!-- end col -->
	                            
	                            <div class="col-xl-3 col-md-6">
	                                <div class="card">
	                                    <div class="card-body">
	                                        <div class="d-flex justify-content-between align-items-center">
	                                            <div class="knob-chart" dir="ltr">
	                                                <input data-plugin="knob" data-width="70" data-height="70" data-fgColor="#526dee"
	                                                    data-bgColor="#d4dbfd" value="${member.membercnt/member.membercnt*100 }"
	                                                    data-skin="tron" data-angleOffset="0" data-readOnly=true
	                                                    data-thickness=".15"/>
	                                            </div>
	                                            <div class="text-end">
	                                                <h3 class="mb-1 mt-0"> <span data-plugin="counterup">${member.membercnt}</span> </h3>
	                                                <p class="text-muted mb-0">참여인원</p>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div><!-- end col -->
	
	                            <div class="col-xl-3 col-md-6">
	                                <div class="card">
	                                    <div class="card-body">
	                                        <div class="d-flex justify-content-between align-items-center">
	                                            <div class="knob-chart" dir="ltr">
	                                                <input data-plugin="knob" data-width="70" data-height="70" data-fgColor="#f672a7"
	                                                    data-bgColor="#fde3ed" value="${Math.round(task.taskcnt/task.tasktotal*100)}"
	                                                    data-skin="tron" data-angleOffset="0" data-readOnly=true
	                                                    data-thickness=".15"/>
	                                            </div>
	                                            <div class="text-end">
	                                                <h3 class="mb-1 mt-0"> <span data-plugin="counterup">${task.taskcnt}</span> </h3>
	                                                <p class="text-muted mb-0">완료 태스크 수</p>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div><!-- end col -->
	
	                            <div class="col-xl-3 col-md-6">
	                                <div class="card">
	                                    <div class="card-body">
	                                        <div class="d-flex justify-content-between align-items-center">
	                                            <div class="knob-chart" dir="ltr">
	                                                <input data-plugin="knob" data-width="70" data-height="70" data-fgColor="#6c757d"
	                                                    data-bgColor="#e2e3e5" value="${Math.round(risk.riskcnt/risk.riskcnt*100)}"
	                                                    data-skin="tron" data-angleOffset="0" data-readOnly=true
	                                                    data-thickness=".15"/>
	                                            </div>
	                                            <div class="text-end">
	                                                <h3 class="mb-1 mt-0"> <span data-plugin="counterup">${risk.riskcnt}</span> </h3>
	                                                <p class="text-muted mb-1">완료 리스크 수</p>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div><!-- end col -->
	                            
	
	                            
                            </div>
						    <!-- end row -->
							
						    <div class="row">
						    	<div class="col-xl-6">
									<!-- Portlet card -->
		                            <div class="card">
										<div class="card-body">
											<div class="card-widgets">
		                                        <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a>
		                                        <a data-bs-toggle="collapse" href="#cardCollpase21" role="button" aria-expanded="false" aria-controls="cardCollpase21"><i class="mdi mdi-minus"></i></a>
		                                    	<a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
		                                    </div>
		                                    <h4 class="header-title mb-0">프로젝트 진행도</h4>
											<div id="cardCollpase21" class="collapse pt-3 show" dir="ltr">
		                                    	<div id="chart1" class="apex-charts" data-colors="#48c2e7"></div>
		                                	</div> <!-- collapsed end -->
		                            	</div> <!-- end card-body -->
									</div> <!-- end card-->
	                         	</div> <!-- end col-->
	                         	
	                         	<div class="col-xl-3">
									<!-- Portlet card -->
		                            <div class="card">
										<div class="card-body">
											<div class="card-widgets">
		                                        <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a>
		                                        <a data-bs-toggle="collapse" href="#cardCollpase21" role="button" aria-expanded="false" aria-controls="cardCollpase21"><i class="mdi mdi-minus"></i></a>
		                                    	<a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
		                                    </div>
		                                    <h4 class="header-title mb-0">태스크 진행도</h4>
											<div id="cardCollpase21" class="collapse pt-3 show" dir="ltr">
		                                    	<div id="chart2" class="apex-charts" data-colors="#48c2e7"></div>
		                                	</div> <!-- collapsed end -->
		                            	</div> <!-- end card-body -->
									</div> <!-- end card-->
	                         	</div> <!-- end col-->
	                         	
						        <div class="col-xl-3">
									<!-- Portlet card -->
		                            <div class="card">
										<div class="card-body">
											<div class="card-widgets">
		                                        <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a>
		                                        <a data-bs-toggle="collapse" href="#cardCollpase21" role="button" aria-expanded="false" aria-controls="cardCollpase21"><i class="mdi mdi-minus"></i></a>
		                                    	<a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
		                                    </div>
		                                    <h4 class="header-title mb-0">리스크 진행도</h4>
											<div id="cardCollpase21" class="collapse pt-3 show" dir="ltr">
		                                    	<div id="chart3" class="apex-charts" data-colors="#48c2e7"></div>
		                                	</div> <!-- collapsed end -->
		                            	</div> <!-- end card-body -->
									</div> <!-- end card-->
	                         	</div> <!-- end col-->
						        
						        
						        
						    </div>
						    <!-- end row -->
					
							
							
						</div>
					</div>
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
			</div>
        </div>
        <!-- END wrapper -->

		<jsp:include page="right.jsp" flush="false"/>
		
		<!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>
        <!-- KNOB JS -->
        <script src="${path}/Admin/dist/assets/libs/jquery-knob/jquery.knob.min.js"></script>
        <!-- Apex js-->
        <script src="${path}/Admin/dist/assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/moment/min/moment.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/jquery.scrollto/jquery.scrollTo.min.js"></script>
        
        <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
        <script src="https://apexcharts.com/samples/assets/ohlc.js"></script>
        
        <!-- Dashboard init-->
        <script src="${path}/Admin/dist/assets/js/pages/dashboard-crm.init.js"></script>
        <!-- init js -->
        <!-- 
        <script src="${path}/Admin/dist/assets/js/pages/apexcharts.init.js"></script>
         -->
		<!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>        
    </body>
</html>