<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>overview</title>
        <style type="text/css">
        .project-body { text-align:left!important; }
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

      <!-- App css -->
      <link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
      <link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

      <link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
      <link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

      <!-- icons -->
      <link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

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
					<!-- 상단 탭바 시작 -->
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
					<!-- 상단 탭바 끝 -->
					
                    <!--  start page title -->
                        <div class="row">
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
                        </div>     
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
                                                        <h3 class="text-warning">프로젝트 명: ${pms_project.project_name}</h3>
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

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100 table01" cellspacing="0" id="tickets-table">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="fw-medium">ID</th>
                                                <th class="fw-medium">팀원명</th>
                                                <th class="fw-medium">태스크 진행율</th>
                                                <th class="fw-medium">태스크 개수</th>
                                            </tr>
                                            </thead>
    
                                            <tbody class="font-14">
                                            
                                                <tr>
                                                    <td><b>#1256</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">George A. Lianes</span>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        Support for theme
                                                    </td>
                                                    <td>
                                                        2
                                                    </td>                                            
                                                </tr>
    
                                                <tr>
                                                    <td><b>#2542</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-3.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Jose D. Delacruz</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        New submission on your website
                                                    </td>
    
                                                    <td>             
                                                           1   
                                                    </td>                                        
                                                </tr>
    
                                                <tr>
                                                    <td><b>#320</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Phyllis K. Maciel</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Verify your new email address!
                                                    </td>
    
                                                    <td>
                                                       3
                                                    </td>
    
                                            
                                                </tr>
    
                                                <tr>
                                                    <td><b>#1254</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-8.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Margeret V. Ligon</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Your application has been received!
                                                    </td>
    
                                                    <td>
                                                   3
                                                    </td>
    
                                                </tr>
    
                                                <tr>
                                                    <td><b>#1020</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-9.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Erwin E. Brown</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        A new rating has been received
                                                    </td>
    
                                                    <td>
                                                       4
                                                    </td>
    
                                                </tr>
    
                                                <tr>
                                                    <td><b>#854</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">William L. Trent</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Your Profile has been accepted
                                                    </td>
    
                                                    <td>
                                                        2
                                                    </td>                                     
                                                </tr>
    
                                                <tr>
                                                    <td><b>#9501</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-10.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Amy R. Barnaby</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Homeworth for your property increased
                                                    </td>
    
                                                    <td>
                                                        4
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td><b>#3652</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-3.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Jessica T. Phillips</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Item Support Message sent
                                                    </td>
    
                                                    <td>
                                                       3
                                                    </td>
    
                                                </tr>
    
                                                <tr>
                                                    <td><b>#9852</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Debra J. Wilson</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Your item has been updated!
                                                    </td>
    
                                                    <td>
                                                       2
                                                    </td>
    
                                                </tr>
    
                                                <tr>
                                                    <td><b>#3652</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Luke J. Sain</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Your password has been reset
                                                    </td>
    
                                                    <td>
                                                        5
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td><b>#1352</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Karen R. Doyle</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Question regarding your Bootstrap Theme
                                                    </td>
    
                                                    <td>
                                                        3
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td><b>#3562</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-8.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Freddie J. Plourde</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Security alert for my account
                                                    </td>
    
                                                    <td>
                                                        4
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td><b>#3658</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-9.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Darrell J. Cook</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Christopher S. Ahmad
                                                    </td>
    
                                                    <td>
                                                        2
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td><b>#2251</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-8.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Mark C. Diaz</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Verify your new email address!
                                                    </td>
    
                                                    <td>
                                                        3
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td><b>#3654</b></td>
                                                    <td>
                                                        <a href="javascript: void(0);" class="text-dark">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" alt="contact-img" title="contact-img" class="avatar-sm rounded-circle img-thumbnail" />
                                                            <span class="ms-2">Robert K. Joseph</span>
                                                        </a>
                                                    </td>
    
                                                    <td>
                                                        Support for theme
                                                    </td>
    
                                                    <td>
                                                    2
                                                    </td>
                                                </tr>
    
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div><!-- end col -->
                        </div>
                        
                        <!-- end row -->
                        
                        <!-- start row -->
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
        <jsp:include page="right.jsp"></jsp:include>
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
        <!-- third party js ends -->

        <script src="${path}/Admin/dist/assets/js/pages/tickets.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>
				