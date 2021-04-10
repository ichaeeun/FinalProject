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
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?v=5.2.0">
<script type="text/javascript">
<%--
 
 
--%>

   //$(document).ready(function(){
	document.addEventListener("DOMContentLoaded",function(eve){
		
		// 초기 데이터 가져오기
	   $.ajax({
			type:"post",
			url:"${path}/gantt.do?method=data",
			dataType:"json",
			success:function(data){
				console.log(data.gantt);
				gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
				gantt.init("gantt_here");
				gantt.load("${path}/Admin/dist/assets/data/data2.json", "json");
			},
			error:function(err){
				console.log(err);
			}
		});
	   
		// 화면에 수정, 생성, 삭제 버튼 생성
	   var colHeader = '<div class="gantt_grid_head_cell gantt_grid_head_add" onclick="gantt.createTask()"></div>';

		gantt.config.columns = [
			{name: "text", tree: true, width: '*', resize: true},
			{name: "start_date", align: "center", resize: true},
			{name: "duration", align: "center"},
			{name: "buttons",label: colHeader,width: 75,template: function (task) {
				return (
					'<i class="fa fa-pencil" data-action="edit"></i>' +
					'<i class="fa fa-plus" data-action="add"></i>' +
					'<i class="fa fa-times" data-action="delete"></i>'
					);
			}}
		];
		// 테스크 버튼 클릭 시
		gantt.attachEvent("onTaskClick", function(id, e){
			var button = e.target.closest("[data-action]")
			if(button){
				var action = button.getAttribute("data-action");
				switch (action) {
					case "edit":
						gantt.showLightbox(id);
						break;
					case "add":
						gantt.createTask(null, id);
						break;
					case "delete":
						gantt.confirm({
							title: gantt.locale.labels.confirm_deleting_title,
							text: gantt.locale.labels.confirm_deleting,
							callback: function (res) {
								if (res)
									gantt.deleteTask(id);
							}
						});
						break;
				}
				return false;
			}
			return true;
		});
	   

		var opts = [
			{ key:1 , label: 'High'},
			{ key:2 , label: 'Normal'},
			{ key:3 , label: 'Low'},
		];
		// lightbox 내부 priority 영역 추가
		gantt.config.lightbox.sections = [
		    {name:"description", height:60, map_to:"text", type:"textarea", focus:true},
		    {name:"priority",   height:25, map_to:"priority", type:"select", options:opts, default_value:"Low"},
		    {name:"time",        height:30, map_to:"auto", type:"duration"}
		];
		// undefined ==> Priority 변경 (lightbox)
		gantt.locale.labels.section_priority="Priority";
		gantt.attachEvent("onLightboxSave", function(id, task, is_new){
		    console.log(id);
		    console.log(task);
		    console.log(is_new);
		    
		    // ajax update 처리
		    updateCall(task,is_new);
		 // 갱신된 데이터 호출 필요
		    return true;
		})
		
		
	});// document 끝
	
	// task 생성 및 수정
	function updateCall(gantt,is_new){
		  // callSch() 입력된 수정된 데이터를 요청값으로 전달
		  if(is_new == false){
			  $.ajax({
				  type:"post",
				  url:"${path}/gantt.do?method=update",
				  data:gantt,
				  dataType:"json",
				  success:function(data){
					  // data.모델명
					  if(data.success=="Y")
						  alert("수정완료");
				  },
				  error:function(err){
					  alert("에러발생: " + err);
					  console.log(err);
				  }
			  });
		  } else if(is_new == true){
			  
			  var sch = callSch(gantt);
			  console.log(sch);
			  $.ajax({
				  type:"post",
				  url:"${path}/gantt.do?method=insert",
				  data:sch,
				  dataType:"json",
				  success:function(data){
					  // data.모델명
					  if(data.success=="Y")
						  alert("수정완료");
				  },
				  error:function(err){
					  alert("에러발생: " + err);
					  console.log(err);
				  }
			  });
		  }
		  // 갱신된 데이터 호출 필요
	  } 
	
	// is_new == true 일 때, 빈 데이터 채우기
	function callSch(gantt){
		  var sch = {};
		  sch.duration = gantt.duration;
		  sch.parent = gantt.parent;
		  sch.progress = 0;
		  sch.sortorder = 9999; // id
		  sch.id = 9999;	// id
		  sch.text = gantt.text;
		  sch.open = true;
		  sch.start_date = gantt.start_date;
		  
		  return sch;
	  }
	  
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	function sw(data){
		var sch = {};
		sch.id = data.id;
		//data.start_date = gantt.date.parseDate(data.start_date,"%Y-%m-%d %H:%i:%s");
		//sch.start_date = data.start_date.toISOString();
		sch.start_date = data.start_date;
		sch.duration = data.duration;
		sch.text = data.text;
		sch.progress = data.progress;
		sch.parent = data.parent;
		sch.sortorder = data.sortorder;
		sch.open = true;
		return sch;
	}
	
	
</script>
<script src="${path}/Admin/dist/assets/js/dhtmlxgantt.js?v=7.0.13"></script>
<link rel="stylesheet" href="${path}/Admin/dist/assets/css/dhtmlxgantt.css?v=7.0.13">
<style>
	html, body {
		padding: 0px;
		margin: 0px;
		height: 100%;
	}
	.fa {
  cursor: pointer;
  font-size: 14px;
  text-align: center;
  opacity: 0.2;
  padding: 5px;
}

.fa:hover {
  opacity: 1;
}

.fa-pencil {
  color: #ffa011;
}

.fa-plus {
  color: #328EA0;
}

.fa-times {
  color: red;
}
	
</style>
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
							                <a href="${path}/task.do?method=list" class="nav-link active">
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
							                <a href="${path}/main.do?method=riskBoard"  class="nav-link">
							                           <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                           <span class="d-none d-sm-inline-block">리스크</span>
							                </a>
							            </li>
							         </ul> 
								</div>
							</div>
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
                        <!-- start page title -->
                        <div class="row">
                        	<div class="col-lg-12">
                        		<div class="card">
                                    <div class="card-body">
										<div id="gantt_here" style='width:100%; height:490px;'></div>
									</div>
								</div>
							</div>
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