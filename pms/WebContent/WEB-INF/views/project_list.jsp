<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <title>Products List</title>
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
		
<script type="text/javascript">
	$(document).ready(function(){
		
	});
function goPage(page){
		$("[name=curPage]").val(page);
		$("form").submit();
	};
</script>
    </head>

<body class="loading" data-layout-mode="detached" data-layout='{"mode": "light", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "light", "size": "default", "showuser": true}, "topbar": {"color": "dark"}, "showRightSidebarOnPageLoad": true}'>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Topbar Start -->
            <jsp:include page="top.jsp"/>
            <!-- end Topbar -->

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
							                <a href="${path}/task.do?method=list" class="nav-link active">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
							                    <span class="d-none d-sm-inline-block">태스크리스트</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="#"  class="nav-link">
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
							                <a href="#"  class="nav-link">
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
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">프로젝트 리스트</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">eCommerce</a></li>
                                            <li class="breadcrumb-item active">Products List</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-sm-6">
                                            <!-- 멤버의 권한이 pm 일때만 프로젝트 추가 버튼 활성화 -->
                                            <c:if test="${mem.auth == 'pm'}">
                                                <a href="#" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-1"></i>프로젝트 추가</a>
                                            </c:if>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="float-sm-end">
                                                    
                                                    <button type="button" class="btn btn-success mb-2 mb-sm-0"><i class="mdi mdi-cog"></i></button>
                                                    
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                                        <!-- end row -->
                
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="all" style="width: 20px;">
                                                            <div class="form-check font-16 mb-0">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck">
                                                                <label class="form-check-label" for="productlistCheck">&nbsp;</label>
                                                            </div>
                                                        </th>
                                                        <th class="all">프로젝트명</th>
                                                        <th>프로젝트번호</th>
                                                        <th>시작일</th>
                                                        <th>종료일</th>
                                                        <th>담당PM</th>
                                                        <th></th>
                                                        <th>현재상태</th>
                                                        <th style="width: 85px;">Action</th>
                                                    </tr>
                                                </thead>
                                                <!-- ---------------------------------------------------- -->
                                                <!-- 테이블 몸통 시작(데이터베이스에 있는 목록 출력) -->
                                                <!-- ---------------------------------------------------- -->
                                                <form:form modelAttribute="sch" method="post">
                                                <div class="input-group-prepend">
									  				<span class="btn btn-info">총 : ${sch.count} 건</span>
									  			</div>
	                                                <%--현재 클릭한 페이지번호 --%>
											     	<form:hidden path="curPage"/>
													<form:input path="project_name" placeholder="제목" />
											
													<button class="btn btn-success" type="submit">Search</button>

                                                </form:form>
                                                <tbody>
                                                
                                                	<c:forEach var="bd" items="${boardList}">
                                                    <tr>
                                                        <td>
                                                            <div class="form-check font-16 mb-0">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck1">
                                                                <label class="form-check-label" for="productlistCheck1">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="m-0 d-inline-block align-middle"><a href="${path}/project.do?method=project_detail&no=${bd.project_no}" class="text-dark">${bd.project_name}</a></h5>
                                                        </td>
                                                        <td>
                                                            ${bd.project_no}
                                                        </td>
                                                        <td>
                                                            ${bd.start1}
                                                        </td>
                                                        <td>
                                                            ${bd.end1}
                                                        </td>
                                                        <td>
                                                            ${bd.pm_pno}
                                                        </td>
                                                        <td>
                                                            
                                                        </td>
                                                        <td>
                                                        	<c:choose>
                                                            <c:when test="${bd.project_status == '완료'}">
                                                            	<span class="badge badge-soft-success">
                                                            </c:when>
                                                            <c:otherwise>
                                                            	<span class="badge badge-soft-danger">
                                                            </c:otherwise>
                                                            </c:choose>${bd.project_status}</span>
                                                        </td>
                    
                                                        <td>
                                                            <ul class="list-inline table-action m-0">
                                                                <li class="list-inline-item"> 
                                                                    <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
                                                                </li>
                                                                <li class="list-inline-item"> 
                                                                    <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                                                                </li>
                                                                <li class="list-inline-item"> 
                                                                    <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>
													</c:forEach>
                                                    

                                                </tbody>
                                            	<!-- ---------------------------------------------------- -->
                                                <!-- 테이블 몸통 끝-->
                                                <!-- ---------------------------------------------------- -->
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        
                    </div> <!-- container -->
					<!-- 페이지 번호 관련 코드 start -->
			<ul class="pagination justify-content-center"> 
			  	<li class="page-item">
			  	<!-- 이전(previous)을 클릭시, 기본적으로 현재블럭의 시작번호 -1로 처리되게 한다. -->
			  	<a class="page-link" 
			  		href="javascript:goPage(${sch.startBlock-1})">Previous</a>
			  	</li>
			  	<!-- 블럭은 시작블럭과 마지막 블럭번호를 반복문으로 수행하게 한다. -->
			  	<c:forEach var="cnt" begin="${sch.startBlock}" 
			  						 end="${sch.endBlock}">
			  		<!-- 클릭한 현재 페이지번호와 반복되는 페이지 번호가 같으면 active 클래스 적용 -->
			  		<li class="page-item ${sch.curPage==cnt?'active':''}">
				  		<a class="page-link" 
				  		href="javascript:goPage(${cnt})">${cnt}</a></li>
			  	</c:forEach>
			  	<li class="page-item">
			  	<!-- 다음(next)을 클릭시, 현재블럭의 마지막번호 +1로 처리되게 한다. -->
			  	<a class="page-link" 
			  		href="javascript:goPage(${sch.endBlock+1})">Next</a>
			  	</li>
		  	</ul>
		  	<!-- 페이징 번호 관련 코드 end -->
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
        <jsp:include page="right.jsp" flush="false"/>
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
        <script src="${path}/Admin/dist/assets/libs/jquery-datatables-checkboxes/js/dataTables.checkboxes.min.js"></script>
        <!-- third party js ends -->

        <script src="${path}/Admin/dist/assets/js/pages/product-list.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>