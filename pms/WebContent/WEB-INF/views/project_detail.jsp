<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세</title>
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
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	
	
	$("#updateProject").click(function(){
		// 유효성검사 추가(모든값을 입력하세요)
		var project_name = $("#project_name").val();
		var project_content = $("#project_content").val();
		var start1 = $("#start1").val();
		var end1 = $("#end1").val();	
		var pm_pno = $("#pm_pno").val();
		var project_status = $("#project_status").val();
		
		if(project_name =="" || project_content==""||start1==""||end1==""||pm_pno==""||project_status=="" ){// 유효성검사 추가
			alert("모든 값을 입력하세요!!");
			return false;
		}
		if(start1>=end1){// 유효성검사 추가(종료일이 시작일보다 앞서면)
			alert("종료일은 시작일보다 이후로 입력하세요!!");
			return false;
		}
		// 프로젝트 상태를 완료로 수정시 태스크도 완료로 설정.
		if(project_status == "완료"){
			if(confirm("주의! 프로젝트를 완료하시겠습니까??") == true){ // 확인
				location.href="${path}/project.do?method=update2&no="+${pms_project.project_no};		
				alert("프로젝트가 완료되었습니다.");
				location.href="${path}/main.do?method=main";
	    	  }else{										
	    		  return false;
	    	  }
		}

		
		
		
		var sch = ProV();
		console.log("##등록할 데이터 확인 ##");
		console.log(sch);
		
		// ajax 통신 시작
		$.ajax({
			type:"post",
			url:"project.do?method=update",
			data: sch,
			dataType: "json",
			success:function(data){
				if(data.success=="Y"){
					console.log(data);
					alert("수정 성공");
					
					location.href="${path}/project.do?method=list&pno="+${mem.pno};
				}
			},
			error:function(err){
				alert("에러발생: "+err);
				console.log(err);
			}
		});
	});
	
	function ProV(){
		var sch = {};
		sch.project_no = $("#project_no").val();
		sch.project_name = $("#project_name").val();
		sch.project_content = $("#project_content").val();
		sch.start1 = $("#start1").val()+"T00:00:00.000Z";
		sch.end1 = $("#end1").val()+"T18:00:00.000Z";
		sch.pm_pno = $("#pm_pno").val();
		sch.project_status = $("#project_status").val();
		
		return sch;
	}
	
});

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
                                    <h4 class="page-title">프로젝트 상세(수정)</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Main</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Project</a></li>
                                            <li class="breadcrumb-item active">Project Detail</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title -->
                        <form method="post">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="text">
                                            <div class="row">
                                            	<div class="col-md-12">
													<div class="mb-3">
                                                    	<label for="project_no" class="form-label">프로젝트번호</label>
                                                        <input type="hidden" value="${pms_project.project_no}" id="project_no" class="form-control" readonly>
													</div>
													<div class="mb-3">
                                                    	<label for="project_name" class="form-label">프로젝트이름</label>
                                                        <input type="text" value="${pms_project.project_name}" id="project_name" class="form-control">
													</div>
													<div class="mb-3">
                                                    	<label for="project_content" class="form-label">프로젝트내용</label>
                                                        <input type="text" value="${pms_project.project_content}" id="project_content" class="form-control">
													</div>
												</div>
												<div class="col-md-6">
													<div class="mb-3">
                                                    	<label for="start1" class="form-label">시작일</label>
                                                        <input type="date" value="${fn:substring(pms_project.start1,0,10)}" id="start1" class="form-control">
													</div> 
													<div class="mb-3">
                                                    	<label for="end1" class="form-label">종료일</label>
                                                        <input type="date" value="${fn:substring(pms_project.end1,0,10)}" id="end1" class="form-control">
													</div>
												</div>
												<div class="col-md-6">
													<div class="mb-3">
                                                    	<label for="pm_pno" class="form-label">PM</label>
                                                        <input type="text" value="${pms_project.pm_pno}" id="pm_pno" class="form-control">
													</div>
													<div class="mb-3">
                                                    	<label for="project_status" class="form-label">프로젝트상태</label>
                                                        	<select class="form-control" id="project_status">
																<option value="진행">진행</option>	
                                                                <option value="완료">완료</option>
                                                        	</select>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-info waves-effect waves-light" id="updateProject">프로젝트 수정</button>
												</div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
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