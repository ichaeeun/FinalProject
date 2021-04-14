<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	   	$("#insertComment").click(function(){
	 	  	var commentlength = $("#commentlength").text();
	 	  	commentlength++;
	   		var inscom = commentVal();
	   		var name = "${mem.name}";
	   		var today = new Date().toLocaleTimeString();
	   		console.log(inscom);
	   		var show="";
	   		show+="<div class='d-flex align-items-start mt-3'>";
	   		show+="<div class='flex-1'>";
            show+=" <h5 class='mt-0'><i class='bx bx-face'></i>&nbsp;"+name+"<small class='text-muted fw-normal float-end'>"+today;
            show+="<div class='action-icon px-1' id='deleteComment'><i class='fe-x-square'></i></div></small></h5>";
            show+=inscom.content+"<br/></div><br></div>";
            $("#commentlength").text(commentlength);
	   		$("#appendComment").append(show);
	   		
   			$.ajax({
				  type:"post",
				  url:"taskdetail.do?method=insertComment",
				  data:inscom,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  	console.log(data);
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			});
   			
   			$("#insertComment_content").val("");
	   	});
	  
	   
	<%--   console.log($("label[for = 'tasktodayCheck1001']").text()); --%>
		var tasknextval = "${taskcurrval}";	// 현재 task_no sequence 받아옴 
		$("#addSubtaskBtn").click(function(){ //  서브태스크 추가 화면단 처리 
			var task_no = "${detail.task_no}";
			var addTask_name = $("#addTask_name").val();
			if(addTask_name==""){
				alert("사원을 선택하세요");
				return false;
			} 
			
			var sublengththis = $("#sublength").text();	// 서브태스크 갯수 
			
			var addTask_taskName = $("#addTask_task_name").val();
			var addTask_pName = $("#addTask_name option:checked").text();
			var addTask_taskPriority = $("#addTask_task_priority").val();
			var addTask_taskDate=$("#addTask_enddte").val();
			var addTask_taskContent=$("#addTask_task_content").val();
			var show="";
			show+="<tr>";
            show+="<td><div class='form-check'> <input class='form-check-input' type='checkbox' id='tasktodayCheck"+tasknextval+"'> <div id='subtaskId'><label class='form-check-label' for='tasktodayCheck"+tasknextval+"'>"+tasknextval+"</label></div>  </div></td>";
			show+="<td id='subtaskName'>"+addTask_taskName+"</td>";
            show+="<td id='subtaskpName'>"+addTask_pName+" </td>";
            show+=" <td>"+addTask_taskDate+"</td>"; 
            if(addTask_taskPriority=="High"){
            	show+=" <td><span class='badge badge-soft-danger p-1' id='subtaskPriority'>"+addTask_taskPriority+"</span></td>";
            }
            if(addTask_taskPriority=="Medium"){
            	show+=" <td><span class='badge badge-soft-primary p-1' id='subtaskPriority'>"+addTask_taskPriority+"</span></td>";
            }
            if(addTask_taskPriority=="Low"){
            	show+=" <td><span class='badge badge-soft-success p-1' id='subtaskPriority'>"+addTask_taskPriority+"</span></td>";
            }
            show+=" <td>  <ul class='list-inline table-action m-0'>  <li class='list-inline-item'>  <a href='javascript:void(0);' class='action-icon px-1'><div data-bs-toggle='modal' data-bs-target='#updateSubtaskModal"+tasknextval+"'> <i class='mdi mdi-square-edit-outline'></i></div></a> </li><li class='list-inline-item'>  <a href='javascript:void(0);' class='action-icon px-1 text-danger'> <div data-bs-toggle='modal' data-bs-target='#deleteSubtask"+tasknextval+"'><i class='mdi mdi-delete-outline me-1'></i></div></a> </li></ul> </td></tr>";
            $("#subtaskTableBody").append(show);
          	$("#sublength").text(Number(sublengththis)+1);
          	var showdelmodal = "";
          	showdelmodal+="<form method='post' action='${path }/taskdetail.do?method=deleteSub'>"; <%--tabindex='-1' role='dialog'  aria-hidden='true'--%>
          	showdelmodal+="<div id='deleteSubtask"+tasknextval+"' class='modal fade' >";   
          	showdelmodal+="<div class='modal-dialog modal-sm'> <div class='modal-content modal-filled bg-danger'>";
          	showdelmodal+="<div class='modal-body p-4'>";
          	showdelmodal+=" <input type='hidden' value='"+tasknextval+"' name='task_no'/>";
          	showdelmodal+=" <input type='hidden' value='"+task_no+"' name='task_parent_no'/>";
          	showdelmodal+="<div class='text-center'>";
          	showdelmodal+="<i class='bx bx-aperture h1 text-white'></i>";
          	showdelmodal+="<h4 class='mt-2 text-white'>태스크 삭제"+tasknextval+"</h4>";
          	showdelmodal+="<p class='mt-3 text-white'>태스크를 삭제하시겠습니까?</p>";
          	showdelmodal+=" <button type='submit' class='btn btn-light my-2'  data-bs-toggle='modal'>삭제</button>";
          	showdelmodal+="<button type='button' class='btn btn-secondary my-2' data-bs-dismiss='modal'>취소</button>";
          	showdelmodal+=" </div></div></div></div> </div> </form>";         
            $(".container-fluid").append(showdelmodal);
            tasknextval++;
            
			var sch = taskVal();
			console.log(sch);
			$.ajax({
				  type:"post",
				  url:"${path}/taskdetail.do?method=insert",
				  data:sch,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  console.log(data);
					  $("#addSubTaskModal").modal("hide");
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
			$("#addTask_task_name").val("");
			$("#addTask_name").val("");
			$("#addTask_task_priority").val("");
			$("#addTask_enddte").val("");
			$("#addTask_task_content").val("");
          	
		});
	    
		
		/* $("#addSubtaskBtn").click(function(){ // 서브태스크추가 DB ajax 
			
		}); */
		
		$("#updateTaskBtn").click(function(){
			var updateTask_task_priority = $("#updateTask_task_priority").val();
			var updateTask_task_name = $("#updateTask_task_name").val();
			var updateTask_name = $("#updateTask_name option:checked").text();
			var updateTask_task_priority = $("#updateTask_task_priority").val();
			var updateTask_startdte = $("#updateTask_startdte").val();
			var updateTask_enddte = $("#updateTask_enddte").val();
			var updateTask_task_content = $("#updateTask_task_content").val();
			$("#task_priority").text(updateTask_task_priority);
			$("#task_name").text(updateTask_task_name);
			$("#task_content").text(updateTask_task_content);
			$("#name").text(updateTask_name);
			$("#enddte").text(updateTask_enddte);
			$("#startdte").text(updateTask_startdte);
			var task_priority_or = "${detail.task_priority}";
			var task_priority = document.getElementById('task_priority');
			if(task_priority_or=='High'){
				if(updateTask_task_priority=='Medium') {
					task_priority.classList.remove('badge-soft-danger');
					task_priority.classList.add('badge-soft-primary');
				}
				if(updateTask_task_priority=='Low') {
					task_priority.classList.remove('badge-soft-danger');
					task_priority.classList.add('badge-soft-success');
				}
			}
			if(task_priority_or=='Medium'){
				if(updateTask_task_priority=='High') {
					task_priority.classList.remove('badge-soft-primary');
					task_priority.classList.add('badge-soft-danger');
				}
				if(updateTask_task_priority=='Low') {
					task_priority.classList.remove('badge-soft-primary');
					task_priority.classList.add('badge-soft-success');
				}
			}
			if(task_priority_or=='Low'){
				if(updateTask_task_priority=='Medium') {
					task_priority.classList.remove('badge-soft-success');
					task_priority.classList.add('badge-soft-primary');
				}
				if(updateTask_task_priority=='High') {
					task_priority.classList.remove('badge-soft-success');
					task_priority.classList.add('badge-soft-danger');
				}
			}
			var upt = updateTaskVal();
			$.ajax({
				  type:"post",
				  url:"taskdetail.do?method=update",
				  data:upt,
				  dataType:"json",
				  success:function(data){
					  // data.모델명
					  if(data.success=="Y")
					  	console.log(data);
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
			
			
		});
		
		var task_parent_no = "${detail.task_no }";
		var project_no = "${detail.project_no }";
		
		
		function taskVal(){  // 서브태스크 추가 모달창 input값 받아오기 
			 var sch = {};
			 sch.task_no=1;
			 sch.task_name=$("#addTask_task_name").val();
			 sch.task_priority=$("#addTask_task_priority").val();
			 sch.startdte=$("#addTask_startdte").val();
			 sch.enddte=$("#addTask_enddte").val();
			 sch.task_parent_no = Number(task_parent_no);  
			 sch.project_no= Number(project_no); 
			 sch.pno = Number($("#addTask_name").val());
			 return sch;
		 }
		
		
		
		 var task_no = "${detail.task_no}";
		 function updateTaskVal(){
			var upt={};
			upt.task_priority = $("#updateTask_task_priority").val();
			upt.task_name = $("#updateTask_task_name").val();
			upt.pno = $("#updateTask_name").val();
			upt.startdte = $("#updateTask_startdte").val();
			upt.enddte = $("#updateTask_enddte").val();
			upt.task_content = $("#updateTask_task_content").val();
			upt.task_no = Number(task_no);
			return upt; 
		 }
		 
		 function commentVal(){
			   var inscom={};
			   inscom.pno=4; //임시  "${mem.pno}";
			   inscom.content= $("#insertComment_content").val();
			   inscom.task_no=task_no;
			   return inscom;
		 }
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
						                      <a href="${path }/task.do?method=view"  class="nav-link ">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-book-open"></i></span>
						                    <span class="d-none d-sm-inline-block">오버뷰</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/task.do?method=list" class="nav-link active">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-task"></i></span>
						                    <span class="d-none d-sm-inline-block">태스크리스트</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="#"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bxs-dashboard"></i></span>
						                    <span class="d-none d-sm-inline-block">대시보드</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/gantt.do?method=gantt"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class=" bx bx-bar-chart-square"></i></span>
						                    <span class="d-none d-sm-inline-block">간트차트</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="#"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-calendar"></i></span>
						                    <span class="d-none d-sm-inline-block">캘린더</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/task.do?method=log"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-comment-dots"></i></span>
						                    <span class="d-none d-sm-inline-block">활동로그</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/main.do?method=riskBoard"  class="nav-link">
						                           <span class="d-inline-block d-sm-none"><i class="bx bx-info-circle"></i></span>
						                           <span class="d-none d-sm-inline-block">리스크</span>
						                </a>
						            </li>
						         </ul> 
							</div>
						</div>
                        <!-- start page title -->
                        <!-- <div class="row">
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
                        </div>      -->
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-xl-8">
                                <div class="card">
                                    <div class="card-body">
                                    <h4 class="page-title">Task Detail&nbsp;&nbsp;&nbsp;</h4>
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none text-muted"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class='fe-menu font-18'></i>
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
                                                    <div data-bs-toggle="modal" data-bs-target="#addSubTaskModal"><i class='mdi mdi-briefcase-plus me-1'></i>서브태스크 추가</div>
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
                                        <p class="text-primary" id="taskId1">#${detail.task_no }</p>
                                        <c:if test="${detail.task_priority=='High'}">
                                        <span class="badge badge-soft-danger p-1" id="task_priority">${detail.task_priority }</span>
                                        </c:if>
                                        <c:if test="${detail.task_priority=='Medium'}">
                                        <span class="badge badge-soft-primary p-1" id="task_priority">${detail.task_priority }</span>
                                        </c:if>
                                        <c:if test="${detail.task_priority=='Low'}">
                                        <span class="badge badge-soft-success p-1" id="task_priority">${detail.task_priority }</span>
                                        </c:if>
                                        <h4 class="mb-1" id="task_name">${detail.task_name }</h4>
                                        <div class="mt-4">
                                        <h5>Description:</h5>
                                                <p class="text-muted" id="task_content">${detail.task_content } </p>
                                        </div>
                                        <div class="text-muted">
                                             <div class="row">
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <i class="ri-hashtag h2 m-0 text-muted"></i>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">태스크ID</p>
                                                            <h5 class="mt-0 text-truncate" id="taskId2">
                                                                ${detail.task_no }
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                        	<i class="fas fa-portrait fa-2x"></i>
                                                            <%-- <img src="${path }/Admin/dist/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded-circle"> --%>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">담당자</p>
                                                            <h5 class="mt-0 text-truncate" id="name">
                                                                ${detail.name }
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <i class="ri-calendar-event-line h2 m-0 text-muted"></i>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">시작일</p>
                                                            <h5 class="mt-0 text-truncate" id="startdte">
                                                                ${detail.startdte }
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <i class="ri-calendar-event-line h2 m-0 text-muted"></i>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">종료일</p>
                                                            <h5 class="mt-0 text-truncate" id="enddte">
                                                                ${detail.enddte }
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>
                                        </div>

                                        <div class="mt-4">
                                            <div class="mt-4">
                                            	<h5 class="position-relative mb-0"><a href="#taskcollapse1" class="text-dark d-block" data-bs-toggle="collapse">서브태스크 <span class="text-muted">(<c:if test="${fn:length(subdetail)<10}">0</c:if><span id="sublength">${fn:length(subdetail)}</span>)</span> <i class="mdi mdi-chevron-down accordion-arrow"></i></a></h5>
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
                                                                    	<c:forEach var="sub" items="${subdetail }">
                                                                    		 <tr> 
                                                                            <td> 
                                                                                <div class="form-check">
                                                                                    <input class="form-check-input" type="checkbox" id="tasktodayCheck${sub.task_no }">
                                                                                    <div id="subtaskId"><label class="form-check-label" for="tasktodayCheck${sub.task_no }">${sub.task_no }</label></div>
                                                                                </div>
                                                                            </td>
                                                                            <td id="subtaskName">${sub.task_name }</td>
                                                                            <td id="subtaskpName">
                                                                                	${sub.name }
                                                                            </td>
                                                                            <td>${sub.enddte }</td>
                                                                            <td>
                                                                            	<c:if test="${sub.task_priority=='High' }">
                                                                            	<span class="badge badge-soft-danger p-1" id="subtaskPriority">${sub.task_priority }</span>
                                                                            	</c:if>
                                                                            	<c:if test="${sub.task_priority=='Medium' }">
                                                                            	<span class="badge badge-soft-primary p-1" id="subtaskPriority">${sub.task_priority }</span>
                                                                            	</c:if>
                                                                            	<c:if test="${sub.task_priority=='Low' }">
                                                                            	<span class="badge badge-soft-success p-1" id="subtaskPriority">${sub.task_priority }</span>
                                                                            	</c:if>
                                                                            </td>
                                                                            <td>
                                                                                <ul class="list-inline table-action m-0">
                                                                                    <li class="list-inline-item"> 	
                                                                                        <a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#updateSubtaskModal${sub.task_no }"> <i class="mdi mdi-square-edit-outline"></i></div></a>
                                                                                    </li>
                                                                                    <li class="list-inline-item"> 
                                                                                        <a href="javascript:void(0);" class="action-icon px-1 text-danger"> <div data-bs-toggle="modal" data-bs-target="#deleteSubtask${sub.task_no }"><i class='mdi mdi-delete-outline me-1'></i></div></a>
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    	</c:forEach>
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


                                        <h4 class="mb-4 mt-0 font-16">Comments(<span id="commentlength">${fn:length(comment) }</span>)</h4>
                                        <div class="clerfix"></div>
                                        <div id="appendComment">
                                         <jsp:useBean id="today" class="java.util.Date"/> 
                                         <fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var="todayDate"/>
                                        <c:forEach var="comm" items="${comment }">
									    <%-- 현재날짜의 고유값 가져오기 : 1970.1.1  --%>
									<%--     <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="toFmt"/>
									    <fmt:formatDate value="${comm.regdte }" pattern="yyyyMMdd" var="regdte"/> --%>
									    <fmt:parseDate value="${comm.regdte }" pattern="yyyy-MM-dd HH:mm:ss" var="commregdte"/>
									    <fmt:formatDate value="${commregdte }"  pattern="yyyy-MM-dd" var="commregdteDate"/>
									    <fmt:formatDate value="${commregdte }"  pattern="HH:mm:ss" var="commregdteTime"/>
                                        <div class="d-flex align-items-start mt-3">
                                            <%-- <img class="me-2 rounded-circle" src="${path }/Admin/dist/assets/images/users/avatar-2.jpg"
                                                alt="Generic placeholder image" height="32"> --%>
                                            <div class="flex-1">
                                                <h5 class="mt-0"><i class=" bx bx-face"></i>&nbsp;${comm.name } <small class="text-muted fw-normal float-end">
                                                	<c:if test="${todayDate==commregdteDate}">${commregdteTime }</c:if>
                                                	<c:if test="${todayDate!=commregdteDate }">${commregdteDate}</c:if>
                                                <c:if test="${mem.pno==comm.pno }"><div class="action-icon px-1" id="deleteComment"><i class="fe-x-square"></i></div></c:if></small></h5>
                                                ${comm.content } 
                                                <br/>
                                            </div>
                                            <br>
                                        </div>
                                        </c:forEach>
                                        </div>

                                        <!-- <div class="text-center mt-2">
                                            <a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-spin mdi-loading me-1"></i> Load more </a>
                                        </div> -->

                                        <div class="border rounded mt-4">
                                           <%--  <form action="#" class="comment-area-box"> --%>
                                                <textarea rows="3" class="form-control border-0 resize-none" placeholder="Your comment..." id="insertComment_content"></textarea>
                                                <div class="p-2 bg-light d-flex justify-content-between align-items-center">
                                                    <div>
                                                    </div>
                                                    <button type="button" class="btn btn-sm btn-success" id="insertComment"><i class="fe-send me-1"></i>Submit</button>
                                                </div>
                                            <%-- </form> --%>
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

				<c:forEach var="sub" items="${subdetail }">
				<!-- 서브태스크 삭제 모달 -->
				<form method="post" action="${path }/taskdetail.do?method=deleteSub">
                <div id="deleteSubtask${sub.task_no }" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-danger">
                            <div class="modal-body p-4">
                            	 <input type="hidden" value="${sub.task_no }" name="task_no"/>
                            	 <input type="hidden" value="${sub.task_parent_no }" name="task_parent_no"/>
                                <div class="text-center">
                                    <i class="bx bx-aperture h1 text-white"></i>
                                    <h4 class="mt-2 text-white">태스크 삭제</h4>
                                    <p class="mt-3 text-white">태스크를 삭제하시겠습니까?</p><%--data-bs-dismiss="modal" data-bs-target="#warning-alert-modal" --%>
                                    <button type="submit" class="btn btn-light my-2"  data-bs-toggle="modal">삭제</button>
                                    <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                </form>
				</c:forEach>


				<!--  서브태스크 수정 모달  -->
				<c:forEach var="sub" items="${subdetail }">
					 <form method="post" action="${path }/taskdetail.do?method=updateSub">
						<div class="modal fade" id="updateSubtaskModal${sub.task_no}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		                    <div class="modal-dialog modal-lg">
		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <h4 class="modal-title" id="myLargeModalLabel">[#${sub.task_no}] 태스크 수정</h4>
		                                <input type="hidden" value="${sub.task_no }" id="updateSub_task_no${sub.task_no}" name="task_no"/>
		                                <input type="hidden" value="${detail.task_no }" id="updateSub_task_parent_no${sub.task_no}" name="task_parent_no"/>
		                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                            </div>
		                            <div class="modal-body">
		                            	<div class="row">
		                                    <div class="col-md-12">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_task_name" class="form-label">태스크</label>
		                                            <input type="text" class="form-control" name="task_name" id="updateSub_task_name${sub.task_no}" value="${sub.task_name }">
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                             <label for="updateSubtask_name" class="form-label">담당자</label>
		                                            <select class="form-control" id="updateSub_name${sub.task_no}" name="pno">
		                                            	  <option value="${sub.pno}">${sub.name}</option>
		                                            	<c:forEach var="showm" items="${showMember }">
		                                                   <option value="${showm.pno }">${showm.name }</option>
		                                                 </c:forEach>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_task_priority" class="form-label">중요도</label>
		                                            <select class="form-control" id="updateSub_task_priority${sub.task_no}" name="task_priority">
		                                            	<option value="High" <c:if test="${sub.task_priority=='High'}">selected</c:if>>High</option>
		                                            	<option value="Medium" <c:if test="${sub.task_priority=='Medium'}">selected</c:if>>Medium</option>
		                                            	<option value="Low" <c:if test="${sub.task_priority=='Low'}">selected</c:if>>Low</option>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_startdte" class="form-label">시작일</label>
		                                            <input type="date" class="form-control" name="startdte" id="updateSub_startdte${sub.task_no}" value="${sub.startdte}">
		                                        </div> 
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_enddte" class="form-label">종료일</label>
		                                            <input type="date" class="form-control" name="enddte" id="updateSub_enddte${sub.task_no}" value="${sub.enddte}">
		                                        </div> 
		                                    </div>
		                                </div>
		                            </div>
		                             <div class="modal-footer">
		                                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
		                                <%--data-bs-dismiss="modal" --%>
		                                <input type="submit" class="btn btn-info waves-effect waves-light"  id="updateSubtaskBtn${sub.task_no}" value="수정"/>
		                            </div>
		                        </div><!-- /.modal-content -->
		                    </div><!-- /.modal-dialog -->
		                </div><!-- /.modal -->
						</form>
				 
				</c:forEach>
				




				<!--  태스크 수정 모달  -->
				 <!--  Modal content for the Large example -->
                <div class="modal fade" id="updateTaskModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myLargeModalLabel">[#${detail.task_no}] 태스크 수정</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                            	<div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="updateTask_task_name" class="form-label">태스크</label>
                                            <input type="text" class="form-control" id="updateTask_task_name" value="${detail.task_name }">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                             <label for="updateTask_name" class="form-label">담당자</label>
                                            <select class="form-control" id="updateTask_name">
                                            	  <option value="${detail.pno}">${detail.name}</option>
                                            	<c:forEach var="showm" items="${showMember }">
                                                   <option value="${showm.pno }">${showm.name }</option>
                                                 </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="updateTask_task_priority" class="form-label">중요도</label>
                                            <select class="form-control" id="updateTask_task_priority">
                                            	<option value="High" <c:if test="${detail.task_priority=='High'}">selected</c:if>>High</option>
                                            	<option value="Medium" <c:if test="${detail.task_priority=='Medium'}">selected</c:if>>Medium</option>
                                            	<option value="Low" <c:if test="${detail.task_priority=='Low'}">selected</c:if>>Low</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="updateTask_startdte" class="form-label">시작일</label>
                                            <input type="date" class="form-control" id="updateTask_startdte" value="${detail.startdte}">
                                        </div> 
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="updateTask_enddte" class="form-label">종료일</label>
                                            <input type="date" class="form-control" id="updateTask_enddte" value="${detail.enddte}">
                                        </div> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3 no-margin">
                                            <label for="updateTask_task_content" class="form-label">태스크 내용</label>
                                            <textarea class="form-control" id="updateTask_task_content">${detail.task_content}</textarea>
                                        </div>
                                    </div>
                                </div>            
                            </div>
                             <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-info waves-effect waves-light" data-bs-dismiss="modal" id="updateTaskBtn">수정</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
				
				
				 <!-- 서브태스크 추가 모달  -->
				 <!--  Modal content for the Large example   tabindex="-1"-->
                <div class="modal fade" id="addSubTaskModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myLargeModalLabel">서브태스크 추가</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
								
                            	<div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="addTask_task_name" class="form-label">태스크</label>
                                            <input type="text" class="form-control" id="addTask_task_name" placeholder="태스크명">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="addTask_name" class="form-label">담당자</label>
                                            <select class="form-control" id="addTask_name">
                                            	  <option value="">사원선택</option>
                                            	<c:forEach var="showm" items="${showMember }">
                                                   <option value="${showm.pno }">${showm.name }</option>
                                                 </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="addTask_task_priority" class="form-label">중요도</label>
                                            <select class="form-control" id="addTask_task_priority">
                                            	<option value="High">High</option>
                                            	<option value="Medium">Medium</option>
                                            	<option value="Low">Low</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="addTask_startdte" class="form-label">시작일</label>
                                            <input type="date" class="form-control" id="addTask_startdte">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="addTask_enddte" class="form-label">종료일</label>
                                            <input type="date" class="form-control" id="addTask_enddte">
                                        </div>
                                    </div>
                                </div>
                               <div class="modal-footer"><%--data-bs-dismiss="modal" --%>
                                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-info waves-effect waves-light"  id="addSubtaskBtn">추가</button>
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

       <jsp:include page="right.jsp" flush="false"/>

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