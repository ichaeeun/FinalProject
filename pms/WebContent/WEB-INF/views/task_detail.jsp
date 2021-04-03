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