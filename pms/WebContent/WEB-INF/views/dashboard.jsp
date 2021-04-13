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
<%--
 
 
--%>

   $(document).ready(function(){
      
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
														<a href="${path }/task.do?method=view"><button class="btn btn-primary btn-md">${detail.project_name }</button></a>
														</div> 
							<div class="col-xl-12">
									 <ul class="nav nav-tabs nav-bordered" style="padding-top:10px;">
							            <li class="nav-item">
							                      <a href="${path }/task.do?method=view"  class="nav-link">
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
							                <a href="${path}/dashboard.do?method=list"  class="nav-link active">
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
							                <a href="${path}/main.do?method=riskBoard"  class="nav-link">
							                           <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                           <span class="d-none d-sm-inline-block">리스크</span>
							                </a>
							            </li>
							         </ul> 
								</div>
							</div>
							
							
							<div class="row">
						        <div class="col-xl-3 col-md-6">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <div>
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Campaign Sent">Campaign Sent</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">865</span></h3>
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
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="New Leads">New Leads</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">384</span></h3>
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
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Deals">Deals</h5>
						                            <h3 class="my-2 py-1"><span data-plugin="counterup">34,521</span></h3>
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
						                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Booked Revenue">Booked Revenue</h5>
						                            <h3 class="my-2 py-1">$<span data-plugin="counterup">89,357</span></h3>
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
						        <div class="col-xl-4">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <h4 class="header-title">Campaigns</h4>
						                        <div class="btn-group mb-2">
						                            <button type="button" class="btn btn-xs btn-light active">Today</button>
						                            <button type="button" class="btn btn-xs btn-light">Weekly</button>
						                            <button type="button" class="btn btn-xs btn-light">Monthly</button>
						                        </div>
						                    </div>
						                    <div class="mt-3" dir="ltr">
						                        <div id="campaigns-chart" class="apex-charts" data-colors="#f7b84b,#1abc9c,#3bafda"></div>
						                    </div>
						                    <div class="row text-center mt-2">
						                        <div class="col-sm-4">
						                            <h4 class="fw-normal mt-3">
						                                <span>6,510</span>
						                            </h4>
						                            <p class="text-muted mb-0 mb-2"><i class="mdi mdi-checkbox-blank-circle text-warning"></i> Total Sent</p>
						                        </div>
						                        <div class="col-sm-4">
						                            <h4 class="fw-normal mt-3">
						                                <span>3,487</span>
						                            </h4>
						                            <p class="text-muted mb-0 mb-2"><i class="mdi mdi-checkbox-blank-circle text-success"></i> Reached</p>
						                        </div>
						                        <div class="col-sm-4">
						                            <h4 class="fw-normal mt-3">
						                                <span>1,568</span>
						                            </h4>
						                            <p class="text-muted mb-0 mb-2"><i class="mdi mdi-checkbox-blank-circle text-primary"></i> Opened</p>
						                        </div>
						                    </div>
						                </div>
						            </div> <!-- end card-->
						        </div> <!-- end col -->
						
						        <div class="col-xl-8">
						            <div class="card">
						                <div class="card-body">
						                    <div class="d-flex justify-content-between">
						                        <h4 class="header-title">Revenue</h4>
						                        <div class="btn-group mb-2">
						                            <button type="button" class="btn btn-xs btn-light active">Today</button>
						                            <button type="button" class="btn btn-xs btn-light">Weekly</button>
						                            <button type="button" class="btn btn-xs btn-light">Monthly</button>
						                        </div>
						                    </div>
						
						                    <div class="row mt-4 text-center">
						                        <div class="col-4">
						                            <p class="text-muted font-15 mb-1 text-truncate">Current Month</p>
						                            <h4><i class="fe-arrow-up text-success me-1"></i>$1.4k</h4>
						                        </div>
						                        <div class="col-4">
						                            <p class="text-muted font-15 mb-1 text-truncate">Previous Month</p>
						                            <h4><i class="fe-arrow-down text-danger me-1"></i>$15k</h4>
						                        </div>
						                        <div class="col-4">
						                            <p class="text-muted font-15 mb-1 text-truncate">Target</p>
						                            <h4><i class="fe-arrow-down text-danger me-1"></i>$7.8k</h4>
						                        </div>
						                    </div>
						                    
						                    <div class="mt-3" dir="ltr">
						                        <div id="revenue-chart" class="apex-charts" data-colors="#3bafda,#ced4dc"></div>
						                    </div>
						                </div> <!-- end card-body-->
						            </div> <!-- end card-->
						        </div> <!-- end col -->
						    </div>
						    <!-- end row -->
						
						    <div class="row">
						        <div class="col-xl-5">
						            <div class="card">
						                <div class="card-body">
						                    <div class="dropdown float-end">
						                        <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
						                            <i class="mdi mdi-dots-vertical"></i>
						                        </a>
						                        <div class="dropdown-menu dropdown-menu-end">
						                            <!-- item-->
						                            <a href="javascript:void(0);" class="dropdown-item">Settings</a>
						                            <!-- item-->
						                            <a href="javascript:void(0);" class="dropdown-item">Action</a>
						                        </div>
						                    </div>
						                    <h4 class="header-title mb-3">Top Performing</h4>
						
						                    <div class="table-responsive">
						                        <table class="table table-striped table-nowrap table-centered mb-0">
						                            <thead>
						                                <tr>
						                                    <th>User</th>
						                                    <th>Leads</th>
						                                    <th>Deals</th>
						                                    <th>Tasks</th>
						                                    <th></th>
						                                </tr>
						                            </thead>
						                            <tbody>
						                                <tr>
						                                    <td>
						                                        <h5 class="font-14 mt-0 mb-1 fw-normal">Jeremy Young</h5>
						                                        <span class="text-muted font-13">Senior Sales Executive</span>
						                                    </td>
						                                    <td>187</td>
						                                    <td>154</td>
						                                    <td>49</td>
						                                    <td class="table-action">
						                                        <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
						                                    </td>
						                                </tr>
						                                <tr>
						                                    <td>
						                                        <h5 class="font-14 mt-0 mb-1 fw-normal">Thomas Krueger</h5>
						                                        <span class="text-muted font-13">Senior Sales Executive</span>
						                                    </td>
						                                    <td>235</td>
						                                    <td>127</td>
						                                    <td>83</td>
						                                    <td class="table-action">
						                                        <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
						                                    </td>
						                                </tr>
						                                <tr>
						                                    <td>
						                                        <h5 class="font-14 mt-0 mb-1 fw-normal">Pete Burdine</h5>
						                                        <span class="text-muted font-13">Senior Sales Executive</span>
						                                    </td>
						                                    <td>365</td>
						                                    <td>148</td>
						                                    <td>62</td>
						                                    <td class="table-action">
						                                        <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
						                                    </td>
						                                </tr>
						                                <tr>
						                                    <td>
						                                        <h5 class="font-14 mt-0 mb-1 fw-normal">Mary Nelson</h5>
						                                        <span class="text-muted font-13">Senior Sales Executive</span>
						                                    </td>
						                                    <td>753</td>
						                                    <td>159</td>
						                                    <td>258</td>
						                                    <td class="table-action">
						                                        <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
						                                    </td>
						                                </tr>
						                                <tr>
						                                    <td>
						                                        <h5 class="font-14 mt-0 mb-1 fw-normal">Kevin Grove</h5>
						                                        <span class="text-muted font-13">Senior Sales Executive</span>
						                                    </td>
						                                    <td>458</td>
						                                    <td>126</td>
						                                    <td>73</td>
						                                    <td class="table-action">
						                                        <a href="javascript: void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
						                                    </td>
						                                </tr>
						                            </tbody>
						                        </table>
						                    </div> <!-- end table-responsive-->
						
						                </div> <!-- end card-body-->
						            </div> <!-- end card-->
						        </div>
						        <!-- end col-->
						
						        <div class="col-xl-7">
						            <div class="row">
						                <div class="col-lg-6">
						                    <div class="card">
						                        <div class="card-body">
						                            <div class="dropdown float-end">
						                                <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
						                                    <i class="mdi mdi-dots-vertical"></i>
						                                </a>
						                                <div class="dropdown-menu dropdown-menu-end">
						                                    <!-- item-->
						                                    <a href="javascript:void(0);" class="dropdown-item">Settings</a>
						                                    <!-- item-->
						                                    <a href="javascript:void(0);" class="dropdown-item">Action</a>
						                                </div>
						                            </div>
						                            <h4 class="header-title mb-4">Recent Leads</h4>
						
						                            <div class="d-flex">
						                                <img class="avatar-sm align-self-center me-3 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" alt="Generic placeholder image">
						                                <div class="flex-1">
						                                    <span class="badge badge-soft-warning float-end">Cold lead</span>
						                                    <h5 class="mt-0 mb-1">Risa Pearson</h5>
						                                    <span class="text-muted font-13">richard.john@mail.com</span>
						                                </div>
						                            </div>
						
						                            <div class="d-flex mt-3">
						                                <img class="avatar-sm align-self-center me-3 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-3.jpg" alt="Generic placeholder image">
						                                <div class="flex-1">
						                                    <span class="badge badge-soft-danger float-end">Lost lead</span>
						                                    <h5 class="mt-0 mb-1">Margaret D. Evans</h5>
						                                    <span class="text-muted font-13">margaret.evans@rhyta.com</span>
						                                </div>
						                            </div>
						
						                            <div class="d-flex mt-3">
						                                <img class="avatar-sm align-self-center me-3 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" alt="Generic placeholder image">
						                                <div class="flex-1">
						                                    <span class="badge badge-soft-success float-end">Won lead</span>
						                                    <h5 class="mt-0 mb-1">Bryan J. Luellen</h5>
						                                    <span class="text-muted font-13">bryuellen@dayrep.com</span>
						                                </div>
						                            </div>
						
						                            <div class="d-flex mt-3">
						                                <img class="avatar-sm align-self-center me-3 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" alt="Generic placeholder image">
						                                <div class="flex-1">
						                                    <span class="badge badge-soft-warning float-end">Cold lead</span>
						                                    <h5 class="mt-0 mb-1">Kathryn S. Collier</h5>
						                                    <span class="text-muted font-13">collier@jourrapide.com</span>
						                                </div>
						                            </div>
						
						                            <div class="d-flex mt-3">
						                                <img class="avatar-sm align-self-center me-3 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-1.jpg" alt="Generic placeholder image">
						                                <div class="flex-1">
						                                    <span class="badge badge-soft-warning float-end">Cold lead</span>
						                                    <h5 class="mt-0 mb-1">Timothy Kauper</h5>
						                                    <span class="text-muted font-13">thykauper@rhyta.com</span>
						                                </div>
						                            </div>
						
						                            <div class="d-flex mt-3">
						                                <img class="avatar-sm align-self-center me-3 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-6.jpg" alt="Generic placeholder image">
						                                <div class="flex-1">
						                                    <span class="badge badge-soft-success float-end">Won lead</span>
						                                    <h5 class="mt-0 mb-1">Zara Raws</h5>
						                                    <span class="text-muted font-13">austin@dayrep.com</span>
						                                </div>
						                            </div>
						                               
						                        </div>
						                        <!-- end card-body -->
						                    </div>
						                    <!-- end card-->
						                </div>
						                <!-- end col -->  
						                
						                <div class="col-lg-6">
						                    <!-- Todo-->
						                    <div class="card">
						                        <div class="card-body">
						                            <div class="dropdown float-end">
						                                <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
						                                    <i class="mdi mdi-dots-vertical"></i>
						                                </a>
						                                <div class="dropdown-menu dropdown-menu-end">
						                                    <!-- item-->
						                                    <a href="javascript:void(0);" class="dropdown-item">Settings</a>
						                                    <!-- item-->
						                                    <a href="javascript:void(0);" class="dropdown-item">Action</a>
						                                </div>
						                            </div>
						                            <h4 class="header-title mb-3">Todo</h4>
						
						                            <div class="todoapp">
						                                <div class="row">
						                                    <div class="col">
						                                        <h5 id="todo-message"><span id="todo-remaining"></span> of <span id="todo-total"></span> remaining</h5>
						                                    </div>
						                                    <div class="col-auto">
						                                        <a href="" class="float-end btn btn-light btn-sm" id="btn-archive">Archive</a>
						                                    </div>
						                                </div>
						
						                                <div style="max-height: 292px;" data-simplebar>
						                                    <ul class="list-group list-group-flush todo-list" id="todo-list"></ul>
						                                </div>
						
						                                <form name="todo-form" id="todo-form" class="needs-validation mt-3" novalidate>
						                                    <div class="row">
						                                        <div class="col">
						                                            <input type="text" id="todo-input-text" name="todo-input-text" class="form-control" 
						                                                placeholder="Add new todo" required>
						                                            <div class="invalid-feedback">
						                                                Please enter your task name
						                                            </div>
						                                        </div>
						                                        <div class="col-auto d-grid">
						                                            <button class="btn btn-primary btn-md width-sm waves-effect waves-light" type="submit" id="todo-btn-submit">Add</button>
						                                        </div>
						                                    </div>
						                                </form>
						                            </div> <!-- end .todoapp-->
						
						                        </div> <!-- end card-body -->
						                    </div> <!-- end card-->
						
						                </div><!-- end col --> 
						            </div><!-- end row-->
						        </div>
						        <!-- end col-->
						    </div>
							
							
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
		<!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>        
    </body>
</html>