<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

	/* jQuery.noConflict();   */
   	  $(document).ready(function(){ 
	 /*   $("time.timeago").timeago(); */
	   var mem = "${mem.id}";
	   if(mem=="") location.href="${path}/main.do?method=loginform"; // 세션값 없을 때 바로 로그인폼 이동 
	   
	   document.getElementById('addTask_startdte').value = new Date().toISOString().substring(0, 10); // 날짜 디폴트 오늘 
	   document.getElementById('addTask_enddte').value = new Date().toISOString().substring(0, 10); // 날짜 디폴트 오늘 
	   
	   var approval = "${approval}";
	   if(approval=="Y"){
		   $("#success-alert-modal").modal("show");
	   }
	   
	   
	   $("#subtaskList").load("${path}/taskdetail.do?method=sub&task_no="+${detail.task_no});
	   $("#commentList").load("${path}/taskdetail.do?method=commentList&task_no="+${detail.task_no});
	   $("#fileList").load("${path}/taskdetail.do?method=taskFileList&task_no="+${detail.task_no});
	   
	 
	   $("#insertComment_content").keypress(function(event){
		  if(event.keyCode==13){
			  $("#insertComment").click();
		  }
	   });
	   	
	   $("#insertComment").click(function(){
		   commentAjax();
	   	});
	   
	  
	   
		var tasknextval = "${taskcurrval}";	// 현재 task_no sequence 받아옴 
		$("#addSubtaskBtn").click(function(){ //  서브태스크 추가 화면단 처리 
			var task_no = "${detail.task_no}";
			var addTask_name = $("#addTask_name").val();
			if(addTask_name==""){
				alert("사원을 선택하세요");
				return false;
			} 
			/* 
			var sublengththis = $("#sublength").text();	// 서브태스크 갯수 
			var addTask_taskName = $("#addTask_task_name").val();
			var addTask_pName = $("#addTask_name option:checked").text();
			var addTask_taskPriority = $("#addTask_task_priority").val();
			var addTask_taskDate=$("#addTask_enddte").val();
			var addTask_taskContent=$("#addTask_task_content").val(); */
            
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
					  $("#subtaskList").load("${path}/taskdetail.do?method=sub&task_no="+${detail.task_no});
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
			 // 추가 후 모달 창 클리어 
			  $("#addTask_task_name").val("");
			  $("#addTask_name").val(""); 
			  $("#addTask_task_priority").val("");
			  $("#addTask_enddte").val(new Date().toISOString().substring(0, 10));
			  $("#addTask_startdte").val(new Date().toISOString().substring(0, 10));
			  $("#addTask_task_content").val("");
		});
	    
		
		
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
			 sch.startdte=$("#addTask_startdte").val()+"T00:00:00.000Z";
			 sch.enddte=$("#addTask_enddte").val()+"T15:00:00.000Z";
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
			upt.startdte = $("#updateTask_startdte").val()+"T00:00:00.000Z";
			upt.enddte = $("#updateTask_enddte").val()+"T15:00:00.000Z";
			upt.task_content = $("#updateTask_task_content").val();
			upt.task_no = Number(task_no);
			return upt; 
		 }
		 
		 
		
		 $("#subtaskList").on("click",".updatesub",function(){
			 // alert("서브태스크수정")
			 var item=$(this).closest(".upt");
			 var task_no = item.find(".task_no").text();
			 var task_name = item.find(".task_name").text();
			 var pno = item.find(".pno").val();
			 var name = item.find(".name").text();
			 var enddte = item.find(".enddte").text();
			 var startdte = item.find(".startdte").val();
			 var task_priority = item.find(".task_priority").text();
			// alert(task_no+" "+task_name+" "+name+" "+enddte+" "+task_priority+" ");
			//   updateSub_task_no  updateSub_task_name updateSub_name updateSub_task_priority updateSub_startdte updateSub_enddte	
			 $("#updateSub_task_no").val(task_no);
			 $("#noinmodal").text(task_no);
			 $("#updateSub_task_name").val(task_name);
			 $("#updateSub_name").val(pno);
			 $("#updateSub_task_priority").val(task_priority);
			 $("#updateSub_enddte").val(enddte);
			 $("#updateSub_startdte").val(startdte);
			 $("#updateSubtaskModal").modal("show");
		 });
		 
		 $("#updateSubtaskBtn").click(function(){
			 var updatesub={};
			 updatesub.task_no= $("#updateSub_task_no").val();
			 updatesub.pno= $("#updateSub_name").val();
			 updatesub.task_name= $("#updateSub_task_name").val();
			 updatesub.enddte= $("#updateSub_enddte").val()+"T15:00:00.000Z";
			 updatesub.startdte= $("#updateSub_startdte").val()+"T00:00:00.000Z";
			 updatesub.task_priority= $("#updateSub_task_priority").val();
			 updatesub.task_parent_no= ${detail.task_no};
			 $.ajax({
				  type:"post",
				  url:"${path}/taskdetail.do?method=updateSub",
				  data:updatesub,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  console.log(data);
					  $("#updateSubtaskModal").modal("hide");
					  $("#subtaskList").load("${path}/taskdetail.do?method=sub&task_no="+${detail.task_no});
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
			 
		 });
		 $("#commentList").on("click",".deleteCommentBtn",function(){
			 var item=$(this).closest(".commList");
			 var comment_no = item.find(".deletecomment_no").val();
			 var task_no = item.find(".task_no").val();
		//	 alert(comment_no);
			 var delcomm={
				 comment_no:comment_no,
				 task_no:task_no
			};
			 console.log(delcomm);
			 $.ajax({
				  type:"post",
				  url:"${path}/taskdetail.do?method=deletecomm",
				  data:delcomm,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  console.log(data);
					  $("#commentList").load("${path}/taskdetail.do?method=commentList&task_no="+${detail.task_no});
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
			 
		 });
		 
		 
		 $("#subtaskList").on("click",".deletesub",function(){
			 var item=$(this).closest(".upt");
			 var task_no = item.find(".task_no").text();
			 $("#deleteSub_task_no").val(task_no);
			 $("#deleteSubtaskModal").modal("show");
		 });
		 
		 $("#deleteSubtaskBtn").click(function(){
			 var deletesub={};
			 deletesub.task_no= Number($("#deleteSub_task_no").val());
			 console.log(deletesub.task_no);
			 $.ajax({
				  type:"post",
				  url:"${path}/taskdetail.do?method=deleteSub",
				  data:deletesub,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  console.log(data);
					  $("#deleteSubtaskModal").modal("hide");
					  $("#subtaskList").load("${path}/taskdetail.do?method=sub&task_no="+${detail.task_no});
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
		 });
		 
		 $("#deleteTaskBtn").click(function(){
			 var deletetask={};
			 deletetask.task_no= "${detail.task_no}";
			 console.log(deletetask.task_no);
			 $.ajax({
				  type:"post",
				  url:"${path}/taskdetail.do?method=deleteSub",
				  data:deletetask,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  console.log(data);
					 /*  $("#deleteSubtaskModal").modal("hide");
					  $("#warning-alert-modal").modal("show"); */
					  location.href="${path}/task.do?method=list&no="+${detail.project_no};

				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
		 });
		 
		 $("#requestBtn").click(function(){
			 var request={};
			 request.task_no= "${detail.task_no}";
			 console.log(request.task_no);
			 $.ajax({
				  type:"post",
				  url:"${path}/taskdetail.do?method=requestApp",
				  data:request,
				  dataType:"json",
				  success:function(data){
					  if(data.request=="Y")
					  console.log(data);
					  $("#requestModal").modal("hide");
					  $("#success-alert-modal2").modal("show");
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
		 });
		
		 $("#subtaskList").on("click","#tasktodayCheck",function(){
			 var status={};
			 var item=$(this).closest(".form-check");
			 var task_no = item.find(".task_no").text();
			 var taskNo = "${detail.task_no}";
			 var task_status = item.find(".task_status").val();
			 status.task_no =task_no;
			 // alert(task_no+" "+task_status);
			 if(task_status=="진행") url = "${path}/taskdetail.do?method=statusToDone";
			 if(task_status=="완료") url = "${path}/taskdetail.do?method=statusFromDone";
			 $.ajax({
				  type:"post",
				  url:url,
				  data:status,
				  dataType:"json",
				  success:function(data){
					  if(data.success=="Y")
					  console.log(data);
					 // $("#subtaskList").load("${path}/taskdetail.do?method=sub&task_no="+${detail.task_no});
				 	  location.href="${path}/taskdetail.do?method=list&task_no="+taskNo;
				  },
				  error:function(err){
					  alert("에러발생: "+err);
					  console.log(err);
				  }
			}); 
		 });
		 
		 $("#uploadFile").click(function(){
				//폼객체를 불러와서
				var report = $("#uploadform")[0];
				var task_no="${detail.task_no}";
				var name="${detail.name}";
				//FormData parameter에 담아줌
				var formData = new FormData(report);
				console.log(formData);
				 $.ajax({
					  type:"post",
					  enctype: 'multipart/form-data',
					  url:"${path}/taskdetail.do?method=insertTaskFile",
					  data:formData,
					  processData:false,
					  contentType:false,
					  dataType:"json",
					  success:function(data){
						  if(data.success=="Y")
						  console.log(data);
						  $("#report").val("");
						  $("#fileList").load("${path}/taskdetail.do?method=taskFileList&task_no="+${detail.task_no});
					  },
					  error:function(request,status,error){
						    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					  }

				}); 
			 }); 
			 
		 $("#fileList").on("click","#downloadBtn",function(){
				var item = $(this).closest(".fileList");
				var filename = item.find(".fileName").text();
				var task_no = "${detail.task_no}";
				// alert(filename);
			 	location.href="${path}/taskdetail.do?method=download&task_no="+task_no+"&filename="+filename;
		 });
		 $("#fileList").on("click","#deleteFileBtn",function(){
				var item = $(this).closest(".fileList");
				var fileno = item.find(".fileno").val();
				var deletefile={};
				deletefile.fileno=fileno;
				deletefile.task_no="${detail.task_no}";
				// alert(fileno);
				$.ajax({
					type:"post",
					  url:"${path}/taskdetail.do?method=deleteTaskFile",
					  data:deletefile,
					  dataType:"json",
					  success:function(data){
						  if(data.success=="Y")
						  console.log(data);
						  $("#fileList").load("${path}/taskdetail.do?method=taskFileList&task_no="+${detail.task_no});
					  },
					  error:function(err){
						  alert("에러발생: "+err);
						  console.log(err);
					  }
				});
		 });
		 
		 function commentVal(){
			   var inscom={};
			   inscom.pno="${mem.pno}"; //임시  "${mem.pno}";
			   inscom.content= $("#insertComment_content").val();
			   inscom.task_no="${detail.task_no}";
			   return inscom;
		  }
		 
		   function commentAjax(){
			   var inscom = commentVal();
			   console.log(inscom);
			   $.ajax({
					  type:"post",
					  url:"taskdetail.do?method=insertComment",
					  data:inscom,
					  dataType:"json",
					  success:function(data){
						  if(data.success=="Y")
						  	console.log(data);
						  $("#commentList").load("${path}/taskdetail.do?method=commentList&task_no="+${detail.task_no});
					  },
					  error:function(err){
						  alert("에러발생: "+err);
						  console.log(err);
					  }
				});
				$("#insertComment_content").val("");
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
						                      <a href="${path }/task.do?method=view&no=${detail.project_no }"  class="nav-link ">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-book-open"></i></span>
						                    <span class="d-none d-sm-inline-block">오버뷰</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/task.do?method=list&no=${detail.project_no }" class="nav-link active">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-task"></i></span>
						                    <span class="d-none d-sm-inline-block">태스크리스트</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/dashboard.do?method=list&no=${detail.project_no }"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bxs-dashboard"></i></span>
						                    <span class="d-none d-sm-inline-block">대시보드</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/gantt.do?method=gantt&no=${detail.project_no }"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class=" bx bx-bar-chart-square"></i></span>
						                    <span class="d-none d-sm-inline-block">간트차트</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/cal.do?method=list&no=${detail.project_no }"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-calendar"></i></span>
						                    <span class="d-none d-sm-inline-block">캘린더</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/task.do?method=log&no=${detail.project_no }"  class="nav-link">
						                    <span class="d-inline-block d-sm-none"><i class="bx bx-comment-dots"></i></span>
						                    <span class="d-none d-sm-inline-block">활동로그</span>
						                </a>
						            </li>
						            <li class="nav-item">
						                <a href="${path}/risk.do?method=riskBoard&no=${detail.project_no }"  class="nav-link">
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
                                                <div  id="noing">
                                                <a href="javascript:void(0);" class="dropdown-item <c:if test='${!(mem.pno==detail.pno || mem.auth=="pm")||detail.task_status=="완료"}'>disabled</c:if>">
                                                    <div data-bs-toggle="modal" data-bs-target="#RequestModal"><i class='mdi mdi-check-circle-outline me-1'></i>승인요청</div>
                                                </a>
                                                </div>
                                                <!-- item-->
                                               <a href="javascript:void(0);" class="dropdown-item <c:if test='${!(mem.pno==detail.pno || mem.auth=="pm")||detail.task_status=="완료"}'>disabled</c:if>">
                                                    <div data-bs-toggle="modal" data-bs-target="#updateTaskModal"><i class='mdi mdi-pencil-outline me-1'></i>수정</div>
                                                </a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item <c:if test='${!(mem.pno==detail.pno || mem.auth=="pm")||detail.task_status=="완료"}'>disabled</c:if>">
                                                    <div data-bs-toggle="modal" data-bs-target="#addSubTaskModal"><i class='mdi mdi-briefcase-plus me-1'></i>서브태스크 추가</div>
                                                </a>
                                                <c:if test="${mem.auth=='pm' }"> <!-- pm일때만 승인버튼 보이기 -->
                                                <div class="dropdown-divider"></div>
                                                 <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item <c:if test='${detail.task_status=="완료"}'>disabled</c:if>">
                                                    <div data-bs-toggle="modal" data-bs-target="#approvalModal"><i class='mdi mdi-check-circle-outline me-1'></i>완료 승인</div>
                                                </a>
                                                </c:if>
                                                <div class="dropdown-divider"></div>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item text-danger <c:if test='${!(mem.pno==detail.pno || mem.auth=="pm")||detail.task_status=="완료"}'>disabled</c:if>">
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
                                        <c:if test="${detail.task_status=='완료' }">&nbsp;&nbsp;<span class="badge badge-soft-danger p-1" id="task_priority">${detail.task_status }</span></c:if>
                                        <c:if test="${detail.task_status=='진행' }">&nbsp;&nbsp;<span class="badge badge-soft-success p-1" id="task_priority">${detail.task_status }</span></c:if>
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
                                                            ${fn:substring(detail.startdte,0,10)}
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
                                                                ${fn:substring(detail.enddte,0,10)}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>
                                        </div>

                                        <div class="mt-4">
                                            <div class="mt-4" id="subtaskList">
												 <!-- 여기에 서브태스크 리스트 출력  -->   
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
                                                <form method="post"  enctype="multipart/form-data" id="uploadform">
                                                <div class="fileupload btn btn-success waves-effect waves-light mb-3">
		                                            <span><i class="mdi mdi-cloud-upload me-1"></i> Upload Files</span>
		                                            <input type="file" name="report" id="report"> <!-- class="upload" -->
		                                            <input type="hidden" name="task_no" value="${detail.task_no }"/>
		                                            <input type="hidden" name="name" value="${mem.name }"/>
		                                            <button type="button" class="btn btn-light" id="uploadFile">Upload</button>
		                                        </div>
		                                        </form>
		                                          <!-- Preview -->
                                                 <div class="dropzone-previews mt-2" id="file-previews"></div>
                                                 
		                                        <div class="table-responsive">
		                                        <!-- fileList -->
		                                        <div id="fileList"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
                            <div class="col-xl-4">
                                <div class="card">
                                    <div class="card-body">

										<div id="commentList">
                                        	<!-- comment 리스트 여기에 출력 -->
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

				<!-- 서브태스크 삭제 모달 -->
                <div id="deleteSubtaskModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-danger">
                            <div class="modal-body p-4">
                            	 <input type="hidden" id="deleteSub_task_no" />
                                <div class="text-center">
                                    <i class="bx bx-aperture h1 text-white"></i>
                                    <h4 class="mt-2 text-white">태스크 삭제</h4>
                                    <p class="mt-3 text-white">태스크를 삭제하시겠습니까?</p>
                                    <button type="button" class="btn btn-light my-2"  data-bs-toggle="modal" id="deleteSubtaskBtn">삭제</button>
                                    <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->


			<!--  서브태스크 수정 모달  -->
						<div class="modal fade" id="updateSubtaskModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		                    <div class="modal-dialog modal-lg">
		                        <div class="modal-content">
		                            <div class="modal-header"> 
		                                <h4 class="modal-title" id="myLargeModalLabel">[#<span id="noinmodal"></span>] 태스크 수정</h4>
		                                <input type="hidden"  id="updateSub_task_no" name="task_no"/>
		                                <input type="hidden" value="${detail.task_no }" id="updateSub_task_parent_no" name="task_parent_no"/>
		                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                            </div>
		                            <div class="modal-body">
		                            	<div class="row">
		                                    <div class="col-md-12">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_task_name" class="form-label">태스크</label>
		                                            <input type="text" class="form-control" name="task_name" id="updateSub_task_name">
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                             <label for="updateSubtask_name" class="form-label">담당자</label>
		                                            <select class="form-control" id="updateSub_name" name="pno">
		                                            	  <option value=""></option>
		                                            	<c:forEach var="showm" items="${showMember }">
		                                                   <option value="${showm.pno }">${showm.name }</option>
		                                                 </c:forEach>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_task_priority" class="form-label">중요도</label>
		                                            <select class="form-control" id="updateSub_task_priority" name="task_priority">
		                                            	<option value="High" <c:if test="${sub.task_priority=='High'}">selected</c:if>>High</option>
		                                            	<option value="Medium" <c:if test="${sub.task_priority=='Medium'}">selected</c:if>>Medium</option>
		                                            	<option value="Low" <c:if test="${sub.task_priority=='Low'}">selected</c:if>>Low</option>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_startdte" class="form-label">시작일</label>
		                                            <input type="date" class="form-control" name="startdte" id="updateSub_startdte" value="">
		                                        </div> 
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="mb-3">
		                                            <label for="updateSubtask_enddte" class="form-label">종료일</label>
		                                            <input type="date" class="form-control" name="enddte" id="updateSub_enddte" value="">
		                                        </div> 
		                                    </div>
		                                </div>
		                            </div>
		                             <div class="modal-footer">
		                                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
		                              
		                                <input type="button" class="btn btn-info waves-effect waves-light" data-bs-dismiss="modal" id="updateSubtaskBtn" value="수정"/>
		                            </div>
		                        </div><!-- /.modal-content -->
		                    </div><!-- /.modal-dialog -->
		                </div><!-- /.modal -->
				 
				




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
                                            <input type="date" class="form-control" id="updateTask_startdte" value="${fn:substring(detail.startdte,0,10)}">
                                        </div> 
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="updateTask_enddte" class="form-label">종료일</label>
                                            <input type="date" class="form-control" id="updateTask_enddte" value="${fn:substring(detail.enddte,0,10)}">
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
                <div id="RequestModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                    <i class="bx bx-task h1 text-info"></i>
                                    <h4 class="mt-2">승인요청</h4>
                                    <p class="mt-3">태스크 승인 요청하시겠습니까?</p>
                                    <button type="button" class="btn btn-info my-2" id="requestBtn" data-bs-dismiss="modal"  data-bs-target="#success-alert-modal2">승인요청</button>
                                     <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                
                 <!-- Info Alert Modal -->
                 <form method="post" action="${path }/taskdetail.do?method=approval">
                <div id="approvalModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                <input type="hidden" value="${detail.task_no }" name="task_no"/>
                                    <i class="bx bx-task h1 text-info"></i>
                                    <h4 class="mt-2">태스크 승인</h4>
                                    <p class="mt-3">태스크 완료 승인하시겠습니까?</p>
                                    <button type="submit" class="btn btn-info my-2" data-bs-toggle="modal" data-bs-target="#success-alert-modal">완료</button>
                                     <button type="button" class="btn btn-secondary my-2" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                </form>
                
                
				 <!-- Danger Alert Modal -->
                <div id="danger-alert-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-danger">
                            <div class="modal-body p-4">
                                <div class="text-center">
                                	<input type="hidden" value="${detail.task_no }"/>
                                    <i class="bx bx-aperture h1 text-white"></i>
                                    <h4 class="mt-2 text-white">태스크 삭제</h4>
                                    <p class="mt-3 text-white">태스크를 삭제하시겠습니까?</p>
                                    <button type="button" class="btn btn-light my-2" id="deleteTaskBtn" data-bs-toggle="modal" data-bs-target="#warning-alert-modal">삭제</button>
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
                <jsp:include page="footer.jsp"/>
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

        <script src="${path}/Admin/dist/assets/js/pages/form-advanced.init.js"></script>
        
</body>
</html>