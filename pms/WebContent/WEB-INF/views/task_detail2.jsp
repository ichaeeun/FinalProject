<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- App favicon -->
<link rel="shortcut icon" href="${path }/Admin/dist/assets/images/favicon.ico">

<!-- plugin css -->
<link href="${path }/Admin/dist/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
 <!-- Plugins css -->
 <link href="${path }/Admin/dist/assets/libs/mohithg-switchery/switchery.min.css" rel="stylesheet" type="text/css" />
 <link href="${path }/Admin/dist/assets/libs/multiselect/css/multi-select.css" rel="stylesheet" type="text/css" />
 <link href="${path }/Admin/dist/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
 <link href="${path }/Admin/dist/assets/libs/selectize/css/selectize.bootstrap3.css" rel="stylesheet" type="text/css" />
 <link href="${path }/Admin/dist/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css" />

<!-- App css -->
<link href="${path }/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
<link href="${path }/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

<link href="${path }/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
<link href="${path }/Admin/dist//assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

<!-- icons -->
<link href="${path }/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>


<script type="text/javascript">
<%--
 
 
--%>
   $(document).ready(function(){

		$("#addSubtaskBtn").click(function(){
			var addTask_taskName = $("#addTask_taskName").val();
			var addTask_pName = $("#addTask_pName").val();
			var addTask_taskPriority = $("#addTask_taskPriority").val();
			var addTask_taskDate=$("#addTask_taskDate").val();
			var addTask_taskContent=$("#addTask_taskContent").val();
			var show="";
			show+="<tr>";
            show+="<td><div class='form-check'> <input class='form-check-input' type='checkbox' id='tasktodayCheck01'> <div id='subtaskId'><label class='form-check-label' for='tasktodayCheck01'>#MN2045</label></div>  </div></td>";
			show+="<td id='subtaskName'>"+addTask_taskName+"</td>";
            show+="<td id='subtaskpName'>"+addTask_pName+" </td>";
            show+=" <td>"+addTask_taskDate+"</td>"; 
            if(addTask_taskPriority=="High"){
            	show+=" <td><span class='badge badge-soft-danger p-1' id='subtaskPriority'>"+addTask_taskPriority+"</span></td>";
            }
            if(addTask_taskPriority=="Medium"){
            	show+=" <td><span class='badge badge-soft-info p-1' id='subtaskPriority'>"+addTask_taskPriority+"</span></td>";
            }
            if(addTask_taskPriority=="Low"){
            	show+=" <td><span class='badge badge-soft-success p-1' id='subtaskPriority'>"+addTask_taskPriority+"</span></td>";
            }
            
            show+=" <td>  <ul class='list-inline table-action m-0'>  <li class='list-inline-item'>  <a href='javascript:void(0);' class='action-icon px-1'><div data-bs-toggle='modal' data-bs-target='#updateTaskModal'> <i class='mdi mdi-square-edit-outline'></i></div></a> </li><li class='list-inline-item'>  <a href='javascript:void(0);' class='action-icon px-1 text-danger'> <div data-bs-toggle='modal' data-bs-target='#danger-alert-modal'><i class='mdi mdi-delete-outline me-1'></i></div></a> </li></ul> </td></tr>";
          	$("#subtaskTableBody").append(show);
		});
   });
</script>
</head>
 <body class="loading">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Topbar Start -->
            <div class="navbar-custom">
                <div class="container-fluid">
    
                    <ul class="list-unstyled topnav-menu float-end mb-0">

                        <li class="d-none d-lg-block">
                            <form class="app-search">
                                <div class="app-search-box dropdown">
                                    <div class="input-group">
                                        <input type="search" class="form-control" placeholder="Search..." id="top-search">
                           
                                        <button class="btn" type="submit">
                                            <i class="fe-search"></i>
                                        </button>
                                    </div>
                                    <div class="dropdown-menu dropdown-lg" id="search-dropdown">
                                        <!-- item-->
                                        <div class="dropdown-header noti-title">
                                            <h5 class="text-overflow mb-2">Found <span class="text-danger">09</span> results</h5>
                                        </div>
            
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <i class="fe-home me-1"></i>
                                            <span>Analytics Report</span>
                                        </a>
            
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <i class="fe-aperture me-1"></i>
                                            <span>How can I help you?</span>
                                        </a>
                            
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <i class="fe-settings me-1"></i>
                                            <span>User profile settings</span>
                                        </a>

                                        <!-- item-->
                                        <div class="dropdown-header noti-title">
                                            <h6 class="text-overflow mb-2 text-uppercase">Users</h6>
                                        </div>

                                        <div class="notification-list">
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                                <div class="d-flex">
                                                    <img class="d-flex me-2 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" alt="Generic placeholder image" height="32">
                                                    <div>
                                                        <h5 class="m-0 font-14">Erwin E. Brown</h5>
                                                        <span class="font-12 mb-0">UI Designer</span>
                                                    </div>
                                                </div>
                                            </a>

                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                                <div class="d-flex">
                                                    <img class="d-flex me-2 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" alt="Generic placeholder image" height="32">
                                                    <div>
                                                        <h5 class="m-0 font-14">Jacob Deo</h5>
                                                        <span class="font-12 mb-0">Developer</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
            
                                    </div>  
                                </div>
                            </form>
                        </li>
    
                        <li class="dropdown d-inline-block d-lg-none">
                            <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="fe-search noti-icon"></i>
                            </a>
                            <div class="dropdown-menu dropdown-lg dropdown-menu-end p-0">
                                <form class="p-3">
                                    <input type="text" class="form-control" placeholder="Search ..." aria-label="Search">
                                </form>
                            </div>
                        </li>
    
                        <li class="dropdown d-none d-lg-inline-block">
                            <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-toggle="fullscreen" href="#">
                                <i class="fe-maximize noti-icon"></i>
                            </a>
                        </li>
    
                        <li class="dropdown d-none d-lg-inline-block topbar-dropdown">
                            <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="fe-grid noti-icon"></i>
                            </a>
                            <div class="dropdown-menu dropdown-lg dropdown-menu-end p-0">
    
                                <div class="p-2">
                                    <div class="row g-0">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="${path}/Admin/dist/assets/images/brands/github.png" alt="Github">
                                                <span>GitHub</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="${path}/Admin/dist/assets/images/brands/dribbble.png" alt="dribbble">
                                                <span>Dribbble</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="${path}/Admin/dist/assets/images/brands/slack.png" alt="slack">
                                                <span>Slack</span>
                                            </a>
                                        </div>
                                    </div>
    
                                    <div class="row g-0">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="${path}/Admin/dist/assets/images/brands/g-suite.png" alt="G Suite">
                                                <span>G Suite</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="${path}/Admin/dist/assets/images/brands/bitbucket.png" alt="bitbucket">
                                                <span>Bitbucket</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="${path}/Admin/dist/assets/images/brands/dropbox.png" alt="dropbox">
                                                <span>Dropbox</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
    
                            </div>
                        </li>
    
                        <li class="dropdown d-none d-lg-inline-block topbar-dropdown">
                            <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="${path}/Admin/dist/assets/images/flags/us.jpg" alt="user-image" height="14">
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <img src="${path}/Admin/dist/assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">German</span>
                                </a>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <img src="${path}/Admin/dist/assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Italian</span>
                                </a>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <img src="${path}/Admin/dist/assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Spanish</span>
                                </a>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <img src="${path}/Admin/dist/assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Russian</span>
                                </a>
    
                            </div>
                        </li>
            
                        <li class="dropdown notification-list topbar-dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="fe-bell noti-icon"></i>
                                <span class="badge bg-danger rounded-circle noti-icon-badge">5</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end dropdown-lg">
    
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="m-0">
                                        <span class="float-end">
                                            <a href="" class="text-dark">
                                                <small>Clear All</small>
                                            </a>
                                        </span>Notification
                                    </h5>
                                </div>
    
                                <div class="noti-scroll" data-simplebar>
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item active">
                                        <div class="notify-icon bg-soft-primary text-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                        <p class="notify-details">Doug Dukes commented on Admin Dashboard
                                            <small class="text-muted">1 min ago</small>
                                        </p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon">
                                            <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Mario Drummond</p>
                                        <p class="text-muted mb-0 user-msg">
                                            <small>Hi, How are you? What about our next meeting</small>
                                        </p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon">
                                            <img src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Karen Robinson</p>
                                        <p class="text-muted mb-0 user-msg">
                                            <small>Wow ! this admin looks good and awesome design</small>
                                        </p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-soft-warning text-warning">
                                            <i class="mdi mdi-account-plus"></i>
                                        </div>
                                        <p class="notify-details">New user registered.
                                            <small class="text-muted">5 hours ago</small>
                                        </p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-info">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                        <p class="notify-details">Caleb Flakelar commented on Admin
                                            <small class="text-muted">4 days ago</small>
                                        </p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-secondary">
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                        <p class="notify-details">Carlos Crouch liked
                                            <b>Admin</b>
                                            <small class="text-muted">13 days ago</small>
                                        </p>
                                    </a>
                                </div>
    
                                <!-- All-->
                                <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                                    View all
                                    <i class="fe-arrow-right"></i>
                                </a>
    
                            </div>
                        </li>
    
                        <li class="dropdown notification-list topbar-dropdown">
                            <a class="nav-link dropdown-toggle nav-user me-0 waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="${path}/Admin/dist/assets/images/users/avatar-1.jpg" alt="user-image" class="rounded-circle">
                                <span class="pro-user-name ms-1">
                                    홍길동 <i class="mdi mdi-chevron-down"></i> 
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-header noti-title">
                                    <h6 class="text-overflow m-0">Welcome !</h6>
                                </div>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="ri-account-circle-line"></i>
                                    <span>My Account</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="ri-settings-3-line"></i>
                                    <span>Settings</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="ri-wallet-line"></i>
                                    <span>My Wallet <span class="badge bg-success float-end">3</span> </span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="ri-lock-line"></i>
                                    <span>Lock Screen</span>
                                </a>

                                <div class="dropdown-divider"></div>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="ri-logout-box-line"></i>
                                    <span>Logout</span>
                                </a>
    
                            </div>
                        </li>
    
                        <li class="dropdown notification-list">
                            <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect waves-light">
                                <i class="fe-settings noti-icon"></i>
                            </a>
                        </li>
    
                    </ul>

                    <!-- LOGO -->
                    <div class="logo-box">
                        <a href="index.html" class="logo logo-dark text-center">
                            <span class="logo-sm">
                                <img src="${path}/Admin/dist/assets/images/logo-sm-dark.png" alt="" height="24">
                                <!-- <span class="logo-lg-text-light">Minton</span> -->
                            </span>
                            <span class="logo-lg">
                                <img src="${path}/Admin/dist/assets/images/logo-dark.png" alt="" height="20">
                                <!-- <span class="logo-lg-text-light">M</span> -->
                            </span>
                        </a>

                        <a href="index.html" class="logo logo-light text-center">
                            <span class="logo-sm">
                                <img src="${path}/Admin/dist/assets/images/logo-sm.png" alt="" height="24">
                            </span>
                            <span class="logo-lg">
                                <img src="${path}/Admin/dist/assets/images/logo-light.png" alt="" height="20">
                            </span>
                        </a>
                    </div>
    
                    <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
                        <li>
                            <button class="button-menu-mobile waves-effect waves-light">
                                <i class="fe-menu"></i>
                            </button>
                        </li>

                        <li>
                            <!-- Mobile menu toggle (Horizontal Layout)-->
                            <a class="navbar-toggle nav-link" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
                                <div class="lines">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            </a>
                            <!-- End mobile menu toggle-->
                        </li>   
            
                        <li class="dropdown d-none d-xl-block">
                            <a class="nav-link dropdown-toggle waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                Create New
                                <i class="mdi mdi-chevron-down"></i> 
                            </a>
                            <div class="dropdown-menu">
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="fe-briefcase me-1"></i>
                                    <span>New Projects</span>
                                </a>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="fe-user me-1"></i>
                                    <span>Create Users</span>
                                </a>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="fe-bar-chart-line- me-1"></i>
                                    <span>Revenue Report</span>
                                </a>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="fe-settings me-1"></i>
                                    <span>Settings</span>
                                </a>
    
                                <div class="dropdown-divider"></div>
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item">
                                    <i class="fe-headphones me-1"></i>
                                    <span>Help & Support</span>
                                </a>
    
                            </div>
                        </li>
    
                    </ul>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
            <div class="left-side-menu">

                <!-- LOGO -->
                <div class="logo-box">
                    <a href="index.html" class="logo logo-dark text-center">
                        <span class="logo-sm">
                            <img src="${path}/Admin/dist/assets/images/logo-sm-dark.png" alt="" height="24">
                            <!-- <span class="logo-lg-text-light">Minton</span> -->
                        </span>
                        <span class="logo-lg">
                            <img src="${path}/Admin/dist/assets/images/logo-dark.png" alt="" height="20">
                            <!-- <span class="logo-lg-text-light">M</span> -->
                        </span>
                    </a>

                    <a href="index.html" class="logo logo-light text-center">
                        <span class="logo-sm">
                            <img src="${path}/Admin/dist/assets/images/logo-sm.png" alt="" height="24">
                        </span>
                        <span class="logo-lg">
                            <img src="${path}/Admin/dist/assets/images/logo-light.png" alt="" height="20">
                        </span>
                    </a>
                </div>

                <div class="h-100" data-simplebar>

                    <!-- User box -->
                    <div class="user-box text-center">
                        <img src="${path}/Admin/dist/assets/images/users/avatar-1.jpg" alt="user-img" title="Mat Helme"
                            class="rounded-circle avatar-md">
                        <div class="dropdown">
                            <a href="#" class="text-reset dropdown-toggle h5 mt-2 mb-1 d-block fw-medium"
                                data-bs-toggle="dropdown">HONG GIL DONG</a>
                            <div class="dropdown-menu user-pro-dropdown">

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-user me-1"></i>
                                    <span>My Account</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-settings me-1"></i>
                                    <span>Settings</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-lock me-1"></i>
                                    <span>Lock Screen</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-log-out me-1"></i>
                                    <span>Logout</span>
                                </a>

                            </div>
                        </div>
                        <p class="text-reset">Admin Head</p>
                    </div>

                    <!--- Sidemenu -->
                   <div id="sidebar-menu">

                        <ul id="side-menu">
                            <li class="menu-title"><i class="bx bx-home"></i> Home</li>
                
                            <li>
                                <a href="#sidebarDashboards" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarDashboards" class="waves-effect">
                                    <i class="mdi mdi-view-dashboard"></i>
                                    <span class="badge bg-success rounded-pill float-end">3</span>
                                    <span> Dashboards </span>
                                </a>
                                <div class="collapse" id="sidebarDashboards">
                                    <ul class="nav-second-level">
                                        <li>
                                            <a href="index.html">Sales</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-crm.html">CRM</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-analytics.html">Analytics</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
							
							  <li>
                                <a href="#sidebarTasks" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks" class="waves-effect">
                                    <i class="mdi mdi-briefcase-check-outline"></i>
                                    <span class="badge bg-success rounded-pill float-end">6</span>
                                    <span> Tasks </span>
                                </a>
                                <div class="collapse" id="sidebarTasks">
                                    <ul class="nav-second-level">
                                        <li>
                                            <a href="starter.jsp">Overview</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-crm.html">Task List</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-analytics.html">Task Board</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-analytics.html">Calendar</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-analytics.html">Gantt Chart</a>
                                        </li>
                                        <li>
                                            <a href="dashboard-analytics.html">DashBoard</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="email-inbox.html">
                                    <i class="mdi mdi-email-outline"></i>
                                    <span> Inbox </span>
                                </a>
                            </li>
                             <li>
                                <a href="contacts-list.html">
                                    <i class="mdi mdi-book-account-outline"></i>
                                    <span> 인력관리 </span>
                                </a>
                            </li>
                             <li>
                                <a href="email-inbox.html">
                                    <i class="fe-alert-octagon"></i>
                                    <span> 리스크관리 </span>
                                </a>
                            </li>


                    </div>
                    <!-- End Sidebar -->

                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
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
                                    <h4 class="page-title"><a href="#"><button class="btn btn-purple btn-sm">PMS Project</button></a>&nbsp;&nbsp;&nbsp;Task Detail</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Project</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Tasks</a></li>
                                            <li class="breadcrumb-item active">Task Detail</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-xl-8">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none text-muted"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class='mdi mdi-dots-horizontal font-18'></i>
                                            </a>
                                        
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <div data-bs-toggle="modal" data-bs-target="#info-alert-modal"><i class='mdi mdi-check-circle-outline me-1'></i>승인요청</div>
                                                </a>
                                                <!-- item-->
                                               <a href="javascript:void(0);" class="dropdown-item">
                                                    <div data-bs-toggle="modal" data-bs-target="#updateTaskModal"><i class='mdi mdi-pencil-outline me-1'></i>수정</div>
                                                </a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <div data-bs-toggle="modal" data-bs-target="#addSubTaskModal"><i class='mdi mdi-briefcase-plus me-1'></i>세부태스크 추가</div>
                                                </a>
                                                <div class="dropdown-divider"></div>
                                                 <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <div data-bs-toggle="modal" data-bs-target="#info-alert-modal2"><i class='mdi mdi-check-circle-outline me-1'></i>완료 승인</div>
                                                </a>
                                                <div class="dropdown-divider"></div>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item text-danger">
                                                    <div data-bs-toggle="modal" data-bs-target="#danger-alert-modal"><i class='mdi mdi-delete-outline me-1'></i>삭제</div>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="text-primary" id="taskId1">#MN2048</p>
                                        <span class="badge badge-soft-danger p-1" id="taskPriority">High</span>
                                        <h4 class="mb-1">태스크 세부사항 화면 구현</h4>
                                        
                                        <div class="mt-4">
                                        <h5>Description:</h5>
                                                <p class="text-muted" id="taskContent">태스크리스트에서 각 태스크 클릭 시 나오는 세부사항 화면을 구현한다. </p>
                                        </div>
                                        <div class="text-muted">
                                             <div class="row">
                                                <div class="col-lg-4 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <i class="ri-hashtag h2 m-0 text-muted"></i>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">태스크ID</p>
                                                            <h5 class="mt-0 text-truncate" id="taskId2">
                                                                #MN2048
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <img src="${path }/Admin/dist/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded-circle">
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">담당자</p>
                                                            <h5 class="mt-0 text-truncate" id="pname">
                                                                홍길동
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <i class="ri-calendar-event-line h2 m-0 text-muted"></i>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">기한</p>
                                                            <h5 class="mt-0 text-truncate" id="dueDate">
                                                                2021-04-10 
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>
                                        </div>

                                        <div class="mt-4">
                                            <div class="mt-4">
                                            	<h5 class="position-relative mb-0"><a href="#taskcollapse1" class="text-dark d-block" data-bs-toggle="collapse">세부태스크 <span class="text-muted">(04)</span> <i class="mdi mdi-chevron-down accordion-arrow"></i></a></h5>
                                                <div class="collapse show" id="taskcollapse1">
                                                            <div class="table-responsive mt-3">
                                                                <table class="table table-centered table-nowrap table-borderless table-sm">
                                                                    <thead class="table-light">
                                                                        <tr class="">
                                                                            <th scope="col">
                                                                                <div class="form-check">
                                                                                    <!-- <input class="form-check-input" type="checkbox" id="tasktodayCheck"> -->
                                                                                    <label class="form-check-label" for="tasktodayCheck">태스크ID</label>
                                                                                </div>
                                                                            </th>
                                                                            <th scope="col">태스크</th>
                                                                            <th scope="col">담당자</th>
                                                                            <th scope="col">기한</th>
                                                                            <th scope="col">중요도</th>
                                                                            <th scope="col" style="width: 85px;"> &nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="subtaskTableBody">
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" id="tasktodayCheck01">
                                                                                    <div id="subtaskId"><label class="form-check-label" for="tasktodayCheck01">#MN2045</label></div>
                                                                                </div>
                                                                            </td>
                                                                            <td id="subtaskName">세부태스크 리스트 만들기</td>
                                                                            <td id="subtaskpName">
                                                                                	홍길동
                                                                            </td>
                                                                            <td>2021-04-10</td>
                                                                            <td><span class="badge badge-soft-danger p-1" id="subtaskPriority">High</span></td>
                                                                            <td>
                                                                                <ul class="list-inline table-action m-0">
                                                                                    <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#updateTaskModal"> <i class="mdi mdi-square-edit-outline"></i></div></a>
                                                                                    </li>
                                                                                    <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1 text-danger"> <div data-bs-toggle="modal" data-bs-target="#danger-alert-modal"><i class='mdi mdi-delete-outline me-1'></i></div></a>
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" id="tasktodayCheck02">
                                                                                    <label class="form-check-label" for="tasktodayCheck02">#MN2044</label>
                                                                                </div>
                                                                            </td>
                                                                            <td>커멘트창 만들기</td>
                                                                            <td>
                                                                                <div>
                                                                                	홍길동
                                                                                </div>
                                                                            </td>
                                                                            <td>2021-04-15</td>
                                                                            <td><span class="badge badge-soft-info p-1">Medium</span></td>
                                                                            <td>
                                                                                <ul class="list-inline table-action m-0">
                                                                                    <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#updateTaskModal"><i class="mdi mdi-square-edit-outline"></i></div></a>
                                                                                    </li>
                                                                                     <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1 text-danger"> <div data-bs-toggle="modal" data-bs-target="#danger-alert-modal"><i class='mdi mdi-delete-outline me-1'></i></div></a>
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" id="tasktodayCheck03">
                                                                                    <label class="form-check-label" for="tasktodayCheck03">#MN2043</label>
                                                                                </div>
                                                                            </td>
                                                                            <td>태스크 수정삭제 기능 구현</td>
                                                                            <td>
                                                                                <div>
                                                                                	김길동
                                                                                </div>
                                                                            </td>
                                                                            <td>2021-04-20</td>
                                                                            <td><span class="badge badge-soft-danger p-1">High</span></td>
                                                                            <td>
                                                                                <ul class="list-inline table-action m-0">
                                                                                    <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#updateTaskModal"><i class="mdi mdi-square-edit-outline"></i></div></a>
                                                                                    </li>
                                                                                     <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1 text-danger"> <div data-bs-toggle="modal" data-bs-target="#danger-alert-modal"><i class='mdi mdi-delete-outline me-1'></i></div></a>
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" id="tasktodayCheck04">
                                                                                    <label class="form-check-label" for="tasktodayCheck04">#MN2042</label>
                                                                                </div>
                                                                            </td>
                                                                            <td>첨부파일 업로드 처리하기</td>
                                                                            <td>
                                                                                <div>
                                                                                	김길동
                                                                                </div>
                                                                            </td>
                                                                            <td>2021-04-25</td>
                                                                            <td><span class="badge badge-soft-success p-1">Low</span></td>
                                                                            <td>
                                                                                <ul class="list-inline table-action m-0">
                                                                                    <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#updateTaskModal"><i class="mdi mdi-square-edit-outline"></i></div></a>
                                                                                    </li>
                                                                                     <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1 text-danger"> <div data-bs-toggle="modal" data-bs-target="#danger-alert-modal"><i class='mdi mdi-delete-outline me-1'></i></div></a>
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                     </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
        
                                                
                                            </div> <!-- end sub tasks -->
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="header-title mb-3">첨부파일</h5>

                                        <div class="row">
                                            <div class="col-md-12">
                                               <%--  <div>
                                                    <form action="/" method="post" class="dropzone" id="myAwesomeDropzone" data-plugin="dropzone" data-previews-container="#file-previews"
                                                        data-upload-preview-template="#uploadPreviewTemplate">
                                                        <div class="fallback">
                                                            <input name="file" type="file" />
                                                        </div>

                                                        <div class="dz-message needsclick">
                                                            <i class="h2 text-muted ri-upload-2-line d-inline-block"></i>
                                                            <h4>Drop files here or click to upload.</h4>
                                                        </div>
                                                    </form>
                                                </div> --%>
                                                <div class="fileupload btn btn-success waves-effect waves-light mb-3">
		                                            <span><i class="mdi mdi-cloud-upload me-1"></i> Upload Files</span>
		                                            <input type="file" class="upload">
		                                        </div>
		                                        <div class="table-responsive">
		                                            <table class="table table-centered  table-nowrap mb-0">
		                                                <thead class="table-light">
		                                                    <tr>
		                                                        <th scope="col">파일명</th>
		                                                        <th scope="col">업로드일</th>
		                                                        <th scope="col">담당자</th>
		                                                        <th scope="col" class="text-center" style="width: 90px;">파일변경</th>
		                                                        <th scope="col" class="text-center" style="width: 25px;">삭제</th>
		                                                    </tr>
		                                                </thead>
		                                                <tbody>
		                                                    <tr>
		                                                        <td>
		                                                            <a href="javascript:void(0);" class="text-dark">Invoice-project.pdf</a>
		                                                        </td>
		                                                        <td class="font-13">2021-04-10 2:55 PM</td>
		                                                        <td>
		                                                        	홍길동
		                                                        </td>
		                                                        <td>
		                                                        	<div class="fileupload btn btn-info waves-effect waves-light mt-1">
							                                            <span><i class="mdi mdi-cloud-upload me-1"></i>Edit</span>
							                                            <input type="file" class="upload">
							                                        </div>
		                                                        </td>
		                                                        <td>
		                                                        	<a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#deleteFileModal"> <i class="mdi mdi-delete"></i></a>
		                                                        </td>
		                                                    </tr>
		                                                     <tr>
		                                                        <td>
		                                                            <a href="javascript:void(0);" class="text-dark">Dashboard-design.png</a>
		                                                        </td>
		                                                        <td class="font-13">2021-04-13 2:55 PM</td>
		                                                        <td>
		                                                        	김길동
		                                                        </td>
		                                                        <td>
		                                                        	<div class="fileupload btn btn-info waves-effect waves-light mt-1">
							                                            <span><i class="mdi mdi-cloud-upload me-1"></i>Edit</span>
							                                            <input type="file" class="upload">
							                                        </div>
		                                                        </td>
		                                                        <td>
		                                                        	<a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#deleteFileModal"> <i class="mdi mdi-delete"></i></a>
		                                                        </td>
		                                                    </tr>
		                                                 </tbody>
		                                            </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
                            <div class="col-xl-4">
                                <div class="card">
                                    <div class="card-body">


                                        <h4 class="mb-4 mt-0 font-16">Comments (5)</h4>

                                        <div class="clerfix"></div>
                                        
                                        <div class="d-flex">
                                            <img class="me-2 rounded-circle" src="${path }/Admin/dist/assets/images/users/avatar-3.jpg"
                                                alt="Generic placeholder image" height="32">
                                            <div class="flex-1">
                                                <h5 class="mt-0">김길동<small class="text-muted fw-normal float-end">5 hours ago</small></h5>
                                                태스크 디비 설계 해주세요 
                                                <br/>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-start mt-3">
                                            <img class="me-2 rounded-circle" src="${path }/Admin/dist/assets/images/users/avatar-5.jpg"
                                                alt="Generic placeholder image" height="32">
                                            <div class="flex-1">
                                                <h5 class="mt-0">강길동 <small class="text-muted fw-normal float-end">1 day ago</small></h5>
                                                잘하셨네요

                                                <br/>
                                            </div>
                                        </div>
										<div class="d-flex align-items-start mt-3">
                                            <img class="me-2 rounded-circle" src="${path }/Admin/dist/assets/images/users/avatar-6.jpg"
                                                alt="Generic placeholder image" height="32">
                                            <div class="flex-1">
                                                <h5 class="mt-0">이길동 <small class="text-muted fw-normal float-end">1 day ago</small></h5>
                                                굿잡

                                                <br/>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start mt-3">
                                            <img class="me-2 rounded-circle" src="${path }/Admin/dist/assets/images/users/avatar-6.jpg"
                                                alt="Generic placeholder image" height="32">
                                            <div class="flex-1">
                                                <h5 class="mt-0">이길동 <small class="text-muted fw-normal float-end">1 day ago</small></h5>
                                                소스코드 올려주세요

                                                <br/>
                                            </div>
                                        </div>
                                        <!-- <div class="text-center mt-2">
                                            <a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-spin mdi-loading me-1"></i> Load more </a>
                                        </div> -->

                                        <div class="border rounded mt-4">
                                            <form action="#" class="comment-area-box">
                                                <textarea rows="3" class="form-control border-0 resize-none" placeholder="Your comment..."></textarea>
                                                <div class="p-2 bg-light d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <!-- <a href="#" class="btn btn-sm px-1 btn-light"><i class='mdi mdi-upload'></i></a>
                                                        <a href="#" class="btn btn-sm px-1 btn-light"><i class='mdi mdi-at'></i></a> -->
                                                    </div>
                                                    <button type="submit" class="btn btn-sm btn-success"><i class="fe-send me-1"></i>Submit</button>
                                                </div>
                                            </form>
                                        </div> <!-- end .border-->

                                    </div> <!-- end card-body-->
                                </div>
                                <!-- end card-->
                            </div>
                        </div>
                        <!-- end row -->

                        <!-- file preview template -->
                        <div class="d-none" id="uploadPreviewTemplate">
                            <div class="card mb-2 shadow-none border">
                                <div class="p-2">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light" alt="">
                                        </div>
                                        <div class="col ps-0">
                                            <a href="javascript:void(0);" class="text-muted fw-bold" data-dz-name></a>
                                            <p class="mb-0" data-dz-size></p>
                                        </div>
                                        <div class="col-auto">
                                            <!-- Button -->
                                            <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove>
                                                <i class="fe-x"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div> <!-- container-fluid -->

                </div> <!-- content -->


				 <!--  Modal content for the Large example -->
                <div class="modal fade" id="updateTaskModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myLargeModalLabel">[#MN2048] 태스크 수정</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                            	<div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="field-1" class="form-label">태스크</label>
                                            <input type="text" class="form-control" id="field-1" value="태스크 세부사항 화면구현">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="field-4" class="form-label">담당자</label>
                                            <input type="text" class="form-control" id="field-4" value="홍길동">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="field-5" class="form-label">중요도</label>
                                            <select class="form-control" id="field-5">
                                            	<option value="High">High</option>
                                            	<option value="Medium">Medium</option>
                                            	<option value="Low">Low</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="field-4" class="form-label">기한</label>
                                            <input type="date" class="form-control" id="date1" value="2021-04-20">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3 no-margin">
                                            <label for="field-7" class="form-label">태스크 내용</label>
                                            <textarea class="form-control" id="field-7">태스크리스트에서 각 태스크 클릭 시 나오는 세부사항 화면을 구현한다.</textarea>
                                        </div>
                                    </div>
                                </div>            
                            </div>
                             <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-info waves-effect waves-light" data-bs-dismiss="modal">수정</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
				
				 <!--  Modal content for the Large example   tabindex="-1"-->
                <div class="modal fade" id="addSubTaskModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myLargeModalLabel">세부태스크 추가</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
								
                            	<div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="field-1" class="form-label">태스크</label>
                                            <input type="text" class="form-control" id="addTask_taskName" placeholder="태스크명">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="field-4" class="form-label">담당자</label>
                                            <input type="text" class="form-control" id="addTask_pName" placeholder="홍길동">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="field-5" class="form-label">중요도</label>
                                            <select class="form-control" id="addTask_taskPriority">
                                            	<option value="High">High</option>
                                            	<option value="Medium">Medium</option>
                                            	<option value="Low">Low</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="field-4" class="form-label">기한</label>
                                            <input type="date" class="form-control" id="addTask_taskDate">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3 no-margin">
                                            <label for="field-7" class="form-label">태스크 내용</label>
                                            <textarea class="form-control" id="addTask_taskContent" placeholder="태스크 설명"></textarea>
                                        </div>
                                    </div>
                                </div>   
                               <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-info waves-effect waves-light" data-bs-dismiss="modal" id="addSubtaskBtn">추가</button>
                              </div>       
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
				
				
				 <!-- Info Alert Modal -->
                <div id="info-alert-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                    <i class="bx bx-task h1 text-info"></i>
                                    <h4 class="mt-2">승인요청</h4>
                                    <p class="mt-3">태스크 승인 요청하시겠습니까?</p>
                                    <button type="button" class="btn btn-info my-2" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#success-alert-modal2">승인요청</button>
                                     <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                
                 <!-- Info Alert Modal -->
                <div id="info-alert-modal2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                    <i class="bx bx-task h1 text-info"></i>
                                    <h4 class="mt-2">태스크 승인</h4>
                                    <p class="mt-3">태스크 완료 승인하시겠습니까?</p>
                                    <button type="button" class="btn btn-info my-2" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#success-alert-modal">완료</button>
                                     <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                
                
                
				 <!-- Danger Alert Modal -->
                <div id="danger-alert-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-danger">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                    <i class="bx bx-aperture h1 text-white"></i>
                                    <h4 class="mt-2 text-white">태스크 삭제</h4>
                                    <p class="mt-3 text-white">태스크를 삭제하시겠습니까?</p>
                                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#warning-alert-modal">삭제</button>
                                    <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                
                 <!-- Danger Alert Modal -->
                <div id="deleteFileModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-danger">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                    <i class="bx bx-aperture h1 text-white"></i>
                                    <h4 class="mt-2 text-white">파일 삭제</h4>
                                    <p class="mt-3 text-white">파일을 삭제하시겠습니까?</p>
                                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#warning-alert-modal">삭제</button>
                                    <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                
               <!-- Warning Alert Modal -->
               <div id="warning-alert-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                   <div class="modal-dialog modal-sm">
                       <div class="modal-content">
                           <div class="modal-body p-4">
                               <div class="text-center">
                                   <i class="bx bx-check-circle h1 text-info"></i>
                                  <!--  <h4 class="mt-2">태스크 삭제</h4> -->
                                   <p class="mt-3">삭제되었습니다.</p>
                                   <button type="button" class="btn btn-info my-2" data-bs-dismiss="modal">확인</button>
                               </div>
                           </div>
                       </div><!-- /.modal-content -->
                   </div><!-- /.modal-dialog -->
               </div><!-- /.modal -->
                
                
                <!-- Success Alert Modal -->
              <div id="success-alert-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog modal-sm">
                      <div class="modal-content modal-filled bg-success">
                          <div class="modal-body p-4">
                              <div class="text-center">
                                  <i class="bx bx-check-double h1 text-white"></i>
                                  <h4 class="mt-2 text-white">Well Done!</h4>
                                  <p class="mt-3 text-white">태스크가 완료되었습니다!</p>
                                  <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">Continue</button>
                              </div>
                          </div>
                      </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
              </div><!-- /.modal -->
                
               <div id="success-alert-modal2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog modal-sm">
                      <div class="modal-content modal-filled bg-success">
                          <div class="modal-body p-4">
                              <div class="text-center">
                                  <i class="bx bx-check-double h1 text-white"></i>
                                  <h4 class="mt-2 text-white">Well Done!</h4>
                                  <p class="mt-3 text-white">태스크 승인요청되었습니다!</p>
                                  <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">Continue</button>
                              </div>
                          </div>
                      </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
              </div><!-- /.modal -->
              
              
             


                
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
        <div class="right-bar">
            <div data-simplebar class="h-100">
    
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-bordered nav-justified" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#chat-tab" role="tab">
                            <i class="mdi mdi-message-text-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#tasks-tab" role="tab">
                            <i class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2 active" data-bs-toggle="tab" href="#settings-tab" role="tab">
                            <i class="mdi mdi-cog-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content pt-0">
                    <div class="tab-pane" id="chat-tab" role="tabpanel">
                
                        <form class="search-bar p-3">
                            <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="mdi mdi-magnify"></span>
                            </div>
                        </form>

                        <h6 class="fw-medium px-3 mt-2 text-uppercase">Group Chats</h6>

                        <div class="p-2">
                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
                                <span class="mb-0 mt-1">App Development</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
                                <span class="mb-0 mt-1">Office Work</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
                                <span class="mb-0 mt-1">Personal Group</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1"></i>
                                <span class="mb-0 mt-1">Freelance</span>
                            </a>
                        </div>

                        <h6 class="fw-medium px-3 mt-3 text-uppercase">Favourites <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="p-2">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To an English person, it will seem like simplified</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status busy"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To achieve this, it would be necessary.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium px-3 mt-3 text-uppercase">Other Chats <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="p-2 pb-4">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status online"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">Everyone realizes why a new common language.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status away"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The languages only differ in their grammar.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status online"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">If several languages coalesce the grammar of the resulting.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status online"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status busy"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The new common language will be more simple.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status away"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Hayley East</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">One could refuse to pay expensive translators.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <div class="text-center mt-3">
                                <a href="javascript:void(0);" class="btn btn-sm btn-white">
                                    <i class="mdi mdi-spin mdi-loading me-2"></i>
                                    Load more
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane" id="tasks-tab" role="tabpanel">
                        <h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
                        <div class="px-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">App Development<span class="float-end">75%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Database Repair<span class="float-end">37%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Backup Create<span class="float-end">52%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 52%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium px-3 mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

                        <div class="p-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Sales Reporting<span class="float-end">12%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Redesign Website<span class="float-end">67%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">New Admin Design<span class="float-end">84%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 84%" aria-valuenow="84" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <div class="d-grid p-3 mt-2">
                            <a href="javascript: void(0);" class="btn btn-success waves-effect waves-light">Create Task</a>
                        </div>

                    </div>
                    <div class="tab-pane active" id="settings-tab" role="tabpanel">
                        <h6 class="fw-medium px-3 m-0 py-2 font-13 text-uppercase bg-light">
                            <span class="d-block py-1">Theme Settings</span>
                        </h6>

                        <div class="p-3">
                            <div class="alert alert-warning" role="alert">
                                <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
                            </div>

                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="color-scheme-mode" value="light" id="light-mode-check" checked>
                                <label class="form-check-label" for="light-mode-check">Light Mode</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="color-scheme-mode" value="dark" id="dark-mode-check">
                                <label class="form-check-label" for="dark-mode-check">Dark Mode</label>
                            </div>

                            <!-- Topbar -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="topbar-color" value="dark" id="darktopbar-check" checked>
                                <label class="form-check-label" for="darktopbar-check">Dark</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="topbar-color" value="light" id="lighttopbar-check">
                                <label class="form-check-label" for="lighttopbar-check">Light</label>
                            </div>

                            <!-- Left Sidebar-->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Left Sidebar Color</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="light" id="light-check" checked>
                                <label class="form-check-label" for="light-check">Light</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="dark" id="dark-check">
                                <label class="form-check-label" for="dark-check">Dark</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="brand" id="brand-check">
                                <label class="form-check-label" for="brand-check">Brand</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="gradient" id="gradient-check">
                                <label class="form-check-label" for="gradient-check">Gradient</label>
                            </div>
                    

                            <!-- size -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Left Sidebar Size</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-size" value="default" id="default-size-check" checked>
                                <label class="form-check-label" for="default-size-check">Default</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-size" value="condensed" id="condensed-check">
                                <label class="form-check-label" for="condensed-check">Condensed <small>(Extra Small size)</small></label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-size" value="compact" id="compact-check">
                                <label class="form-check-label" for="compact-check">Compact <small>(Small size)</small></label>
                            </div>
                    

                            <!-- User info -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User Info</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-user" value="fixed" id="sidebaruser-check">
                                <label class="form-check-label" for="sidebaruser-check">Enable</label>
                            </div>

                            <div class="d-grid mt-4">
                                <button class="btn btn-primary" id="resetBtn">Reset to Default</button>

                            <a href="https://wrapbootstrap.com/theme/minton-admin-dashboard-landing-template-WB0858DB6?ref=coderthemes"
                                class="btn btn-danger mt-2" target="_blank"><i class="mdi mdi-basket me-1"></i> Purchase Now</a>
                            </div>

                        </div>

                    </div>
                </div>

            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>


        <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>

        <!-- Plugins js -->
        <script src="${path}/Admin/dist/assets/libs/dropzone/min/dropzone.min.js"></script>

        <!-- Init js-->
        <script src="${path}/Admin/dist/assets/js/pages/form-fileuploads.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        <!-- Plugins Js -->
        <script src="${path}/Admin/dist/assets/libs/selectize/js/standalone/selectize.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/mohithg-switchery/switchery.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/multiselect/js/jquery.multi-select.js"></script>
        <script src="${path}/Admin/dist/assets/libs/jquery.quicksearch/jquery.quicksearch.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/select2/js/select2.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
        <script src="${path}/Admin/dist/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

        <!-- init js -->
        <script src="${path}/Admin/dist/assets/js/pages/form-advanced.init.js"></script>
        
</body>
</html>