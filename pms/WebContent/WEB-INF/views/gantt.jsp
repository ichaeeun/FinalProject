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
      <%-- moment 메서드 사용 --%>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>
	.nested_task .gantt_add{
		    display: none !important;
		}
</style>
<script type="text/javascript">


var holder = [];
var tid = [];
var arrstart_date = []; 
var arrend_date = [];
var leftLimit;
var rightLimit;
   //$(document).ready(function(){
	document.addEventListener("DOMContentLoaded",function(eve){
		var g;
		// 초기 데이터 가져오기
	   getdata();
	   var opts = [
			{ key:1 , label: 'High'},
			{ key:2 , label: 'Medium'},
			{ key:3 , label: 'Low'},
		];
		// lightbox 내부 priority 영역 추가
		gantt.config.lightbox.sections = [
		    {name:"description", height:60, map_to:"text", type:"textarea", focus:true},
		    /*
		    {name:"parent",height:25, type:"parent", map_to:"parent", filter:function(id, task){ 
		        if(task.$level > 1){         
		            return false;     
		        }else{  
		            return true; 
		        } 
		    }},
		    */
		    //{name:"parent", type:"parent", allow_root:"false", root_label:"No parent"},
		    {name:"priority",   height:25, map_to:"priority", type:"select", options:opts},
		    {name:"holder",    height:30, type:"textarea", map_to:"holder"},
		    {name:"time",        height:30, map_to:"auto", type:"duration"}
		];
		// undefined ==> Priority 변경 (lightbox)
		gantt.locale.labels.section_priority="Priority";
		gantt.locale.labels.section_holder="holder";
		gantt.locale.labels.section_parent = "Parent task";
		
		//gantt.locale.lightbox.section_priority = "High";
		
		gantt.templates.grid_row_class = function( start, end, task ){
		    if ( task.$level > 1 ){
		        return "nested_task"
		    }
		    return "";
		};
		

		gantt.attachEvent("onLightboxSave", function(id, task, is_new){
		    console.log("after save button");
		    console.log(id);
		    console.log(task);
		    // ajax update 처리
		    updateCall(id,task,is_new);
		 // 갱신된 데이터 호출 필요
		    return true;
		});
		
		gantt.attachEvent("onLightboxDelete", function(id){
			
		    var task = gantt.getTask(id);
		    if (task.$level == 0 ){
		        alert("프로젝트는 삭제할 수 없습니다");
		        return false;
		    }
		    if(gantt.hasChild(id)){
		    	gantt.locale.labels.confirm_deleting= "하위 태스크도 함께 삭제됩니다.<br>계속 진행하시겠습니까?";
		    } else {
		    	gantt.locale.labels.confirm_deleting= "해당 태스크를 삭제하시겠습니까?";	
		    }
		    
		    return true;
		});
		// onaftertaskadd 사용?
		gantt.attachEvent("onAfterTaskDelete", function(id,item){
			var task = gantt.getTask(id);
			deleteTask(id);
		});
		
		gantt.attachEvent("onTaskDrag",function(id,mode,task,original){
			var modes = gantt.config.drag_mode;
			
			if(modes == modes.move || mode == modes.resize){
				var diff = original.duration*(1000*60*60*24);
				
				if(+task.end_date > +rightLimit){
					task.end_date = new Date(rightLimit);
					if(mode == modes.move)
						task.start_date = new Date(task.end_date - diff);
				}
				if(+task.start_date < +leftLimit){
					task.start_date = new Date(leftLimit);
					if(mode == modes.move)
						task.end_date = new Date(+task.start_date + diff);
				}
			}
		});
		
		
		// 테스크 버튼 클릭 시
		if("${mem.auth}"=='pm'){
			// 화면에 수정, 생성, 삭제 버튼 생성
			/*
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
			gantt.attachEvent("onTaskClick", function(id, e){
				var button = e.target.closest("[data-action]")
				if(button){
					var action = button.getAttribute("data-action");
					switch (action) {
						case "edit":
							gantt.showLightbox(id);
							break;
						case "add":
							gantt.createTask({start_date:new Date()},null, id);
							//gantt.addTask({start_date:new Date()},null, id);
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
			*/
		} else if("${mem.auth}"=='wk'){
		
			gantt.config.columns = [
				{name: "text", tree: true, width: '*', resize: true},
				{name: "start_date", align: "center", resize: true},
				{name: "duration", align: "center"},
				{name: "holder", align: "center", resize: true, label:"holder"}
				// 세션 id == holder
				/*
				if("${mem.name}"== "${holder}"){
					{name: "buttons",label: colHeader,width: 75,template: function (task) {
						return (
							'<i class="fa fa-pencil" data-action="edit"></i>'
							);
					}}
				} else {
					{name: "holder", align: "center", resize: true, label:"holder"}
				}
				*/
			];
			
			gantt.attachEvent("onTaskClick", function(id, e){
				if(tid.includes(Number(id))){
					gantt.showLightbox(id);
				}
				else {
					alert("프로젝트 매니저만 이용가능한 서비스입니다.");
				}
			});
		} else if("${mem.auth}"=='ceo' || "${mem.auth}"=='hp'){
			
			gantt.templates.progress_text=function(start, end, task){
				  return formatProgress(task)
			};
			
			gantt.config.columns = [
				{name: "text", tree: true, width: '*', resize: true},
				{name: "start_date", align: "center", resize: true},
				{name: "duration", align: "center"},
				{name: "holder", align: "center", resize: true, label:"holder"},
				{name: "progress", align: "center", resize: true, label:"Progress",
					template: function(task){return formatProgress(task);}}
			]
			gantt.attachEvent("onTaskClick", function(id, e){
				alert("프로젝트 매니저만 이용가능한 서비스입니다.");
			});
		}


		gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
		gantt.init("gantt_here");
		gantt.load("${path}/Admin/dist/assets/data/data2.json", "json");
		
	});// document 끝
	//task 생성 및 수정
	function updateCall(id,gantt,is_new){
		  // callSch() 입력된 수정된 데이터를 요청값으로 전달
		  console.log(is_new);
		  if(is_new == false){
			  console.log("##update##");
			  console.log(gantt);
			  var sch = callSch(gantt);
			  $.ajax({
				  type:"post",
				  url:"${path}/gantt.do?method=update",
				  data:sch,
				  dataType:"json",
				  success:function(data){
					  // data.모델명
					  //if(data.success=="Y")
					  //	  alert("수정완료");
					  	  //getdata();
				  },
				  error:function(err){
					  alert("에러발생: " + err);
					  console.log(err);
				  }
			  });
			  
		  } else if(is_new == true){
			  
			  var sch = newSch(gantt);
			  console.log("##return new Sch##");
			  console.log(sch);
			  
			  $.ajax({
				  type:"post",
				  url:"${path}/gantt.do?method=insert",
				  data:sch,
				  dataType:"json",
				  success:function(data){
					  //getdata();
					  // data.모델명
					  if(data.success=="Y")
						  alert("등록완료");
				  },
				  error:function(err){
					  alert("에러발생: " + err);
					  console.log(err);
				  }
			  });
			  
		  }
	  };
	  function deleteTask(id){
		  //var task = gantt.getTask(id);
		  console.log("###delete###");
		  console.log(id);
		  
		  $.ajax({
			  type:"post",
			  url:"gantt.do?method=delete",
			  data:{id:id},
			  dataType:"json",
			  success:function(data){
				  //getdata();
				  // data.모델명
				  if(data.success=="Y")
					  alert("등록완료");
			  },
			  error:function(err){
				  alert("에러발생: " + err);
				  console.log(err);
			  }
		  });
	  }
	  /*
	  var idVal = $("[name=id]").val();
	  var event = calendar.getEventById(idVal);
	  event.remove();
	  $.ajax({
	  	type:"post",
	  	url:"calendar.do?method=delete",
	  	data:{id:idVal},
	  	dataType:"json",
	  	success:function(data){
	  		if(data.success == "Y"){
	  			alert("삭제 성공");
	  		}
	  	},
	  	error: function(err){
	  		alert("에러 발생");
	  		console.log(err);
	  	}
	  })
	  $("#schDialog").dialog("close");
	*/
	// is_new == true 일 때, 빈 데이터 채우기
	function newSch(gantt){
		  var sch = {};
		  //sch.duration = gantt.duration;
		  sch.parent = gantt.parent;
		  sch.progress = gantt.progress;
		  sch.sortorder = 0; 
		  sch.id = 0;	
		  sch.text = gantt.text;
		  //sch.open = true;
		  //sch.start_date = moment(gantt.start_date).format('YYYY-MM-DD HH:mm:ss');
		  
		  sch.start_date = gantt.start_date.toISOString();
		  sch.end_date = gantt.end_date.toISOString();
		  sch.holder = gantt.holder;
		  
		  //if(gantt.holder == "") sch.holder="no one";
		  //else sch.holder = gantt.holder;
		  
		  //sch.holder = gantt.holder;
		  sch.priority = Number(gantt.priority);
		  
		  return sch;
	}

	function callSch(gantt){
		console.log("###callSch###");
		console.log(gantt);
	  var sch = {};
	  //sch.duration = gantt.duration;
	  sch.parent = gantt.parent;
	  sch.progress = gantt.progress;
	  sch.sortorder = gantt.sortorder; 
	  sch.id = gantt.id;	
	  sch.text = gantt.text;
	  //sch.open = true;
	  //sch.start_date = moment(gantt.start_date).format('YYYY-MM-DD HH:mm:ss');
	  
	  sch.start_date = gantt.start_date.toISOString();
	  sch.end_date = gantt.end_date.toISOString();
	  /*
	  if(gantt.holder == "") sch.holder="no one";
	  else sch.holder = gantt.holder;
	  */
	  sch.holder = gantt.holder;
	  sch.priority = Number(gantt.priority);
	  
	  return sch;
	}
	  
	function getFormatDate(date){
	    //var year = date.getFullYear();              //yyyy
	    var year2 = date.substring(0,4);
	    //var month = (1 + date.getMonth());          //M
	    var month2 = date.substring(5,7);
	    //month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    //var day = date.getDate();                   //d
	    var day2 = date.substring(8,10);        
	    //day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    var limit = new Date(year2,month2,day2);
	    //return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	    return limit;
	}

	function formatProgress(task){
		  return Math.round(task.progress * 100) + "%"
	}

	function getdata(){
		$.ajax({
			type:"post",
			url:"${path}/gantt.do?method=data",
			dataType:"json",
			success:function(data){
				g = data.gantt;
				var tes = data.gantt.substring(8,data.gantt.length-1);
				console.log(data.gantt);
				//console.log(tes);
				
				var arrayList = new Array(tes);
				//console.log(arrayList[1]);
				
				var j = JSON.parse(tes);
				for(var i=0;i<j.length;i++){
					holder.push(j[i].holder);
					if("${mem.name}" == j[i].holder){
						tid.push(Number(j[i].id));	
					}
					arrstart_date.push(j[i].start_date);
					arrend_date.push(j[i].end_date);
					leftLimit = getFormatDate(arrstart_date[0]);
					rightLimit = getFormatDate(arrend_date[0]);
					
					//console.log(holder);
					//console.log(tid);
				}
				console.log(leftLimit);
				console.log(rightLimit);
				//console.log($(".gantt_tree_content").val());
				//console.log(data.gantt.attr('priority'));
				// 수정 시 이전 정보 담기, priority 만 넣으면 됨 
				//gantt.getLightboxSection('Priority').setValue(data.gantt.priority);
			},
			error:function(err){
				console.log(err);
			}
		});
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
							                      <a href="${path}/task.do?method=view"  class="nav-link">
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
							                <a href="${path}/gantt.do?method=gantt"  class="nav-link active">
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