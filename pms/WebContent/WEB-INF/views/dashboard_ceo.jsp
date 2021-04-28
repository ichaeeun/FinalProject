<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<style type="text/css">
.select-wrap { text-align: right; }
#selectLan {width: 200px; display: inline-block; margin-right: 36px; margin-top: 10px; }
</style>
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
<%--
 
 
--%>

   $(document).ready(function(){
	 // 다국어 처리
	 $("#selectLan").val("${param.lang}");
		$("#selectLan").change(function(){
			if($(this).val()!=""){
				location.href="${path}/main.do?method=choiceLan&lang="+$(this).val();
			}
 	});
	   
	   
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
					          fontSize: "15px"
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
				  series: [${Math.round(totdoingday/totallday*100 )}],
				  labels: ['프로젝트진행도(${totdoingday}/${totallday})']
				  
				};
		var chart = new ApexCharts(document.querySelector("#chart1"), options);
		chart.render();
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
					          fontSize: "15px"
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
				  series: [${Math.round(doingtask/alltask*100)}],
				  labels: ['태스크진행도(${doingtask}/${alltask})'],
				};
		var chart = new ApexCharts(document.querySelector("#chart2"), options);
		chart.render();
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
					          fontSize: "15px"
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
				  series: [${Math.round(doingrisk/allrisk*100)}],
				  labels: ['리스크진행도(${doingrisk}/${allrisk})'],
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
                <div class="select-wrap">
				  <select class="form-control" id="selectLan">
				  	<option value=""><spring:message code="chlang"/></option>
				  	<option value="ko"><spring:message code="ko"/></option>
				  	<option value="en"><spring:message code="en"/></option>
				  </select>
				  </div>
                    <!-- Start Content-->
                    <div class="container-fluid">
						<div class="row">
							<div class="md-4"> <h4 class="page-title project_no"> </h4></div>
							
							<div class="row">
						        <div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Campaign Sent"><spring:message code='Total_number_of_projects'/></h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${allproject}</span></h3>
						                            <p class="mb-0 text-muted">
						                                <span class="text-success me-2"><span class="mdi mdi-arrow-up-bold"></span> 5.27%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
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
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="New Leads"><spring:message code='Number_of_projects_in_progress'/></h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${doingproject}</span></h3>
						                            <p class="mb-0 text-muted">
						                                <span class="text-danger me-2"><span class="mdi mdi-arrow-down-bold"></span> 3.27%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
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
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Deals"><spring:message code='Total_number_of_people'/></h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${allmember }</span></h3>
						                            <p class="mb-0 text-muted">
						                                <span class="text-success me-2"><span class="mdi mdi-arrow-up-bold"></span> 8.58%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
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
						
						        <div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Booked Revenue"><spring:message code='Total_number_of_tasks'/></h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">${alltask }</span></h3>
						                            <p class="mb-0 text-muted">
						                                <span class="text-success me-2"><span class="mdi mdi-arrow-up-bold"></span> 34.61%</span>
						                                <span class="text-nowrap">Since last month</span>  
						                            </p>
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
						        
						    </div>
						    <!-- end row -->
						
							<div class="row">
						    	<div class="col-xl-6 col-md-6">
									<!-- Portlet card -->
		                            <div class="card">
										<div class="card-body">
											<div class="card-widgets">
		                                        <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a>
		                                        <a data-bs-toggle="collapse" href="#cardCollpase21" role="button" aria-expanded="false" aria-controls="cardCollpase21"><i class="mdi mdi-minus"></i></a>
		                                    	<a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
		                                    </div>
		                                    <h4 class="header-title mb-0"><spring:message code='Project_Progress'/></h4>
											<div id="cardCollpase21" class="collapse pt-3 show" dir="ltr">
		                                    	<div id="chart1" class="apex-charts" data-colors="#48c2e7"></div>
		                                	</div> <!-- collapsed end -->
		                            	</div> <!-- end card-body -->
									</div> <!-- end card-->
	                         	</div> <!-- end col-->
	                         	
	                         	<div class="col-xl-3 col-md-6">
									<!-- Portlet card -->
		                            <div class="card">
										<div class="card-body">
											<div class="card-widgets">
		                                        <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a>
		                                        <a data-bs-toggle="collapse" href="#cardCollpase21" role="button" aria-expanded="false" aria-controls="cardCollpase21"><i class="mdi mdi-minus"></i></a>
		                                    	<a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
		                                    </div>
		                                    <h4 class="header-title mb-0"><spring:message code='Task_Progress'/></h4>
											<div id="cardCollpase21" class="collapse pt-3 show" dir="ltr">
		                                    	<div id="chart2" class="apex-charts" data-colors="#48c2e7"></div>
		                                	</div> <!-- collapsed end -->
		                            	</div> <!-- end card-body -->
									</div> <!-- end card-->
	                         	</div> <!-- end col-->
	                         	
						        <div class="col-xl-3 col-md-6">
									<!-- Portlet card -->
		                            <div class="card">
										<div class="card-body">
											<div class="card-widgets">
		                                        <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a>
		                                        <a data-bs-toggle="collapse" href="#cardCollpase21" role="button" aria-expanded="false" aria-controls="cardCollpase21"><i class="mdi mdi-minus"></i></a>
		                                    	<a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
		                                    </div>
		                                    <h4 class="header-title mb-0"><spring:message code='Risk_Progress'/></h4>
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
		<!-- Apex js-->
        <script src="${path}/Admin/dist/assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/moment/min/moment.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/jquery.scrollto/jquery.scrollTo.min.js"></script>
        
        <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
        <script src="https://apexcharts.com/samples/assets/ohlc.js"></script>
        
        <!-- Dashboard init-->
        <script src="${path}/Admin/dist/assets/js/pages/dashboard-crm.init.js"></script>
		<!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>
		<!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>        
    </body>
</html>