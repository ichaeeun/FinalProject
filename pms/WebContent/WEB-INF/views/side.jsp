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
	<body>
		<div class="left-side-menu">
		
	        <!-- LOGO -->
	        <div class="logo-box">
	            <a href="${path}/main.do?method=main" class="logo logo-dark text-center">
	                <span class="logo-sm">
	                    <img src="${path}/Admin/dist/assets/images/logo-sm-dark.png" alt="" height="24">
	                    <!-- <span class="logo-lg-text-light">Minton</span> -->
	                </span>
	                <span class="logo-lg">
	                    <img src="${path}/Admin/dist/assets/images/logo-dark.png" alt="" height="20">
	                    <!-- <span class="logo-lg-text-light">M</span> -->
	                </span>
	            </a>
	
	            <a href="${path}/main.do?method=main" class="logo logo-light text-center">
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
	                    <a href="#" class="text-reset dropdown-toggle h5 mt-2 mb-1 d-block"
	                        data-bs-toggle="dropdown">${mem.id}</a>
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
	             	<jsp:include page="side_menu.jsp" flush="false"/> 
	             <!-- End Sidebar -->
	
	            <div class="clearfix"></div>
	
	        </div>
	        <!-- Sidebar -left -->
	
	    </div>
	</body>
</html>