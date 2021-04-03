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
		<div id="sidebar-menu">
	
            <ul id="side-menu">
                <li class="menu-title">Navigation</li>
				<c:if test="${mem.auth == 'ceo' || mem.auth == 'hp'}">
                <li>
                	<a href="#sidebarEmail" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEmail">
                    	<i class="ri-dashboard-line"></i>
                        <span> Dashboards </span>
                    </a>
                </li>
                <li>
                    <a href="#sidebarTasks" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
                        <i class="ri-task-line"></i>
                        <span> 프로젝트 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarTasks">
                    	<ul class="nav-second-level">
                            <li>
                                <a href="#sidebarTasks2" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
		                           <span id="list"> 진행 프로젝트 </span>
		                        </a>
                            </li>
                            <li>
                                <a href="#sidebarTasks2" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
                           <span> 완료 프로젝트 </span>
                       			</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <c:if test="${mem.auth == 'ceo'}">
 				<li>
                    <a href="#sidebarEmail" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEmail">
                        <i class="ri-shield-user-line"></i>
                        <span> 인력 현황 </span>
                    </a>
                </li>
                </c:if>
                <c:if test="${mem.auth == 'hp'}">
 				<li>
                    <a href="#sidebarEmail" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEmail">
                        <i class="ri-shield-user-line"></i>
                        <span> 인력 관리 </span>
                    </a>
                </li>
                </c:if>
 				<li>
                    <a href="#sidebarEmail" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEmail">
                        <i class="ri-profile-line"></i>
                        <span> 리스크 현황 </span>
                    </a>
                </li>
                </c:if>
                
                <c:if test="${mem.auth == 'pm'}">
                	<li>
	                    <a href="#sidebarTasks" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
	                        <i class="ri-task-line"></i>
	                        <span> 프로젝트 </span>
	                        <span class="menu-arrow"></span>
	                    </a>
	                    <div class="collapse" id="sidebarTasks">
	                    	<ul class="nav-second-level">
	                            <li>
	                                <a href="#sidebarTasks2" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
	                           <span id="list"> 진행 프로젝트 </span>
	                       </a>
	                       	
	                            </li>
	                            <li>
	                                <a href="#sidebarTasks2" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
	                           <span> 완료 프로젝트 </span>
	                       </a>
	                            </li>
	                        </ul>
	                    
	                    </div>
	                </li>
	    			<li>
	                    <a href="#sidebarEmail" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEmail">
	                        <i class="ri-shield-user-line"></i>
	                        <span> 인력 관리 </span>
	                    </a>
	                </li>
	                <li>
	                    <a href="#sidebarEcommerce" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEcommerce">
	                        <i class="ri-mail-lock-line"></i>
	                        <span> 요청 관리 </span>
	                        <span class="menu-arrow"></span>
	                    </a>
	                    <div class="collapse" id="sidebarEcommerce">
	                        <ul class="nav-second-level">
	                            <li>
	                                <a href="ecommerce-products.html">테스크 요청</a>
	                            </li>
	                            <li>
	                                <a href="ecommerce-products-grid.html">리스크 요청</a>
	                            </li>
	                            
	                        </ul>
	                    </div>
	                </li>
                </c:if>
                
                <c:if test="${mem.auth == 'wk'}">
                <li>
                    <a href="#sidebarEmail" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEmail">
                        <i class="ri-task-line"></i>
                        <span> My Task </span>
                    </a>
                </li>
    			<li>
                    <a href="#sidebarTasks" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
                        <i class="ri-task-line"></i>
                        <span> 프로젝트 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarTasks">
                    	<ul class="nav-second-level">
                            <li>
                                <a href="#sidebarTasks2" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
                           <span id="list"> 진행 프로젝트 </span>
                       </a>
                       	
                            </li>
                            <li>
                                <a href="#sidebarTasks2" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarTasks">
                           <span> 완료 프로젝트 </span>
                       </a>
                            </li>
                        </ul>
                    
                    </div>
                </li>
                <li>
                    <a href="#sidebarEcommerce" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sidebarEcommerce">
                        <i class="ri-mail-lock-line"></i>
                        <span> 요청 현황 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarEcommerce">
                        <ul class="nav-second-level">
                            <li>
                                <a href="ecommerce-products.html">테스크 요청</a>
                            </li>
                            <li>
                                <a href="ecommerce-products-grid.html">리스크 요청</a>
                            </li>
                            
                        </ul>
                    </div>
                </li>
                </c:if>
            </ul>

        </div>      
	</body>
</html>