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
var names = [];
   //$(document).ready(function(){
	document.addEventListener("DOMContentLoaded",function(eve){
		var g;
		// 초기 데이터 가져오기
	   $.ajax({
			type:"post",
			url:"${path}/gantt.do?method=data&no="+'${no}',
			dataType:"json",
			success:function(data){
				//g = data.gantt;
				var tes = data.gantt.substring(8,data.gantt.length-1);
				//console.log(data.gantt);
				console.log(tes);
				
				var arrayList = new Array(tes);
				
				var j = JSON.parse(tes);
				g = j
				for(var i=0;i<j.length;i++){
					holder.push(j[i].holder);
					if("${mem.name}" == j[i].holder){
						tid.push(Number(j[i].id));	
					}
					arrstart_date.push(Convertdate(j[i].start_date));
					arrend_date.push(Convertdate(j[i].end_date));
					
					//leftLimit = getFormatDate(arrstart_date);
					//rightLimit = getFormatDate(arrend_date[0]);
					
					//console.log(arrstart_date[i]);
					//console.log(arrend_date[i]);
				}
				leftLimit = arrstart_date[0];
				rightLimit = arrend_date[0];
				for(var j=0;j<data.names.length;j++) {
					var tmp = {key : data.names[j], label : data.names[j]}
					names.push(tmp);
				}
				
				console.log("####names#####");
				console.log(names);
				gantt.parse(data.gantt);
			},
			error:function(err){
				console.log(err);
			}
		});
	   //gantt.config.order_branch = true;
	   if("${project.project_status}" == "완료")
		   gantt.config.readonly = true;
	   	
	   gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
	   gantt.init("gantt_here");

	   gantt.templates.task_text=function(start, end, task){
		    return task.title;
		};
		gantt.config.columns = [
		    {name:"title",       label:"Task name",  width:"*", tree:true },
		    {name:"start_date", label:"Start time", align:"center" },
		    {name:"duration",   label:"Duration",   align:"center" },
		    {name:"add",        label:"",           width:44 }
		];
		
	   var opts = [
			{ key:1 , label: 'High'},
			{ key:2 , label: 'Medium'},
			{ key:3 , label: 'Low'},
		];
	   /*
	   var name_opts = [
		   for(var i=0;i<names.length;i++){
		   		{ key: names[i] , label: names[i] }
		   }
	   ];
	   */
	   
		// lightbox 내부 priority 영역 추가
		gantt.config.lightbox.sections = [
			{name:"title", height:30, map_to:"title", type:"textarea", focus:true, label:"title"},
		    {name:"description", height:50, map_to:"text", type:"textarea", focus:true},
		    
		    {name:"parent",height:25, type:"parent", map_to:"parent", 
		    	filter:function(id, task){
			        if(task.$level > 1){         
			            return false;     
			        }else{  
			            return true; 
			        }
		    }},
		    {name:"priority",   height:25, map_to:"priority", type:"select", options:opts},
		    //{name:"holder",    height:30, type:"textarea", map_to:"holder"},
		    {name:"holder",    height:30, type:"select", map_to:"holder", options:names, readonly:true},
		    {name:"duration", height:30, map_to:{start_date:"start_date",end_date:"end_date"}, 
		    	type:"time", time_format:["%d","%m","%Y","%H:%i"], autofix_end:false},
		];
		// lightbox 내부 섹션 이름 변경
		/* gantt.locale.labels.section_title="Title";
		gantt.locale.labels.section_priority="Priority";
		gantt.locale.labels.section_holder="holder";
		gantt.locale.labels.section_parent = "Parent task";
		gantt.locale.labels.section_duration = "Duration"; */
		gantt.locale.labels.section_title="태스크 이름";
		gantt.locale.labels.section_description="태스크 내용";
		gantt.locale.labels.section_priority="중요도";
		gantt.locale.labels.section_holder="담당자";
		gantt.locale.labels.section_parent = "부모 태스크";
		gantt.locale.labels.section_duration = "작업 기한";
		
		// 서브태스크의 + 버튼 삭제
		gantt.templates.grid_row_class = function( start, end, task ){
		    if ( task.$level > 1 ){
		        return "nested_task"
		    }
		    return "";
		};
		
		gantt.attachEvent("onLightboxSave", function(id, task, is_new){
			var t = gantt.getTask(id);
			
			if(task.status == "완료"){
				alert("완료 상태의 태스크는 수정할 수 없습니다.");	
				return false;
			}
			
			if(task.$level == 0){
				var child = gantt.getChildren(id);
				
				for(var i=0;i<child.length;i++){
					var c = gantt.getTask(child[i]);
					console.log(c);
					if(task.start_date > c.start_date){
						alert("자식 태스크 중 시작날짜가 더 빠른 것이 있습니다.");
						return false;
					} else if (task.end_date < c.end_date){
						alert("자식 태스크 중 종료날짜가 더 느린 것이 있습니다.");
						return false;
					}
				}
				if(t.parent != task.parent){
					alert("프로젝트의 부모는 변경할 수 없습니다.");
					return false;
				}
				if(t.holder != task.holder){
					alert("프로젝트의 담당자는 변경할 수 없습니다.");
					return false;
				}
			}
			
			// t.parent != task.parent
			if(task.$level == 1){
				var child = gantt.getChildren(id);
				
				for(var i=0;i<child.length;i++){
					var c = gantt.getTask(child[i]);
					console.log(c);
					if(task.start_date > c.start_date){
						alert("자식 태스크 중 시작날짜가 더 빠른 것이 있습니다.");
						return false;
					} else if (task.end_date < c.end_date){
						alert("자식 태스크 중 종료날짜가 더 느린 것이 있습니다.");
						return false;
					}
				}
				if(child == "") {
					return true;
				}
					
				else {
					if(t.parent != task.parent){
						alert("자식이 있는 태스크의 부모는 변경할 수 없습니다.");
						return false;
					}
				}
			}
			
			if(!task.title){
		        alert("태스크 제목 작성!!");
		        return false;
		    }
		    if(!task.text){
		    	alert("태스크 내용 작성!!");
		        return false;
		    }

		    if(id != 1){
			var ptask = gantt.getTask(task.parent);
				if(task.start_date < ptask.start_date) { alert("시작일이 부모태스크보다 빠릅니다"); return false; }
				else if(task.end_date > ptask.end_date) { alert("종료일이 부모태스크보다 느립니다"); return false; }
		    }
			if(task.start_date > task.end_date) { alert("시작일이 종료일보다 느립니다"); return false; }
			else if(task.start_date.toISOString() == task.end_date.toISOString()) { alert("시작일과 종료일이 같습니다"); return false; }
			
			
			
		    return true;
		});
		/*
		gantt.attachEvent("onBeforeTaskChanged", function(id, mode, task){
		    console.log("####onBeforeTaskChanged#####");
			var ptask = gantt.getTask(task.parent);
			console.log(task.start_date);console.log(ptask.start_date);
			console.log(task.end_date);console.log(ptask.end_date);

		    return true;
		});
		*/
		gantt.attachEvent("onBeforeTaskUpdate", function(id,new_item){
			console.log("####onBeforeTaskUpdate#####");
			console.log(id);console.log(new_item);
			
		});
		
		gantt.attachEvent("onBeforeLightbox", function(id){
		  	if(id == 1){
			//gantt.getTask(1).readonly_property = "parent";
		  		//gantt.config.lightbox.readonly_property = "parent";
		  		gantt.config.lightbox.readonly_property = "parent";
		  		gantt.config.readonly_property = "holder";
		  		//gantt.config.readonly_property = "parent";
		  		//gantt.config.lightbox.readonly = "holder";
		  		//gantt.config.lightbox.section_parent.readonly_prop = true;
		  	}
		  	//gantt.config.lightbox.section.readonly = true;
		  	//gantt.config.readonly_property = "parent";
		  return true;
		});
		
		gantt.attachEvent("onLightbox", function (task_id){
			console.log("####onLightbox#####");
			var child = gantt.getChildren(task_id);
			var task = gantt.getTask(task_id);
			console.log(task.status);
			
			/*
		    var start = task.start_date; start.setHours(start.getHours() + 9);
		    var end = task.end_date; end.setHours(end.getHours() + 9);
		    start = start.toISOString().replace(/T/, ' ').replace(/\..+/, '');
		    end = end.toISOString().replace(/T/, ' ').replace(/\..+/, '');
		    console.log(start);console.log(end);
		    
		    var left = leftLimit; console.log(left);
		    var right = rightLimit; console.log(right);
		    */
		});
		
		/*
		gantt.attachEvent("onBeforeTaskDisplay", function(id, task){
		    if (task.priority == "High"){
		        return true;
		    }
		    return false;
		});
		*/
		
		
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
		
		gantt.attachEvent("onAfterTaskAdd", function(id,item){
			console.log("####ins######");
			console.log(id);
			console.log(item);
			gantt.deleteTask(id);
			insertCall(id,item);
			gantt.refreshData();
			//gantt.load("${path}/Admin/dist/assets/data/data2.json", "json");
		});
		
		gantt.attachEvent("onAfterTaskUpdate", function(id,item){
			updateCall(id,item);
			gantt.refreshData();
			//gantt.load("${path}/Admin/dist/assets/data/data2.json", "json");
		});
		
		gantt.attachEvent("onAfterTaskDelete", function(id,item){
			console.log("#####del#####");
			console.log(id);
			console.log(item);
			if(id < 100000000000){
				deleteTask(id);
				gantt.refreshData();
			}
			//gantt.deleteTask(id);
			//gantt.load("${path}/Admin/dist/assets/data/data2.json", "json");
		});
		
		gantt.attachEvent("onAfterLightbox", function (id,task){
			//gantt.load("${path}/Admin/dist/assets/data/data2.json", "json");
		});
		
		gantt.attachEvent("onTaskDrag", function(id, mode, task, original){
			console.log("###onTaskDrag###");
			console.log(id);console.log(mode);console.log(task);console.log(original);
			if(id != 1){
				var ptask = gantt.getTask(task.parent);
			    var modes = gantt.config.drag_mode;
			    if(mode == modes.move || mode == modes.resize){
			    
			    	var diff = original.duration*(1000*60*60*24);
			    	
			    	if(task.start_date < ptask.start_date){
			    		task.start_date = new Date(ptask.start_date);
			            if(mode == modes.move)
			                task.end_date = new Date(task.start_date + diff);
			    	}
			    	if(task.end_date > ptask.end_date){
			    		task.end_date = new Date(ptask.end_date);
			            if(mode == modes.move)
			                task.start_date = new Date(task.end_date - diff);
			    	}
			    	
			    	var diff2 = task.start_date - original.start_date;
			        gantt.eachTask(function(child){
			            child.start_date = new Date(+child.start_date + diff2);
			            child.end_date = new Date(+child.end_date + diff2);
			            gantt.refreshTask(child.id, true);
			        },id );
		    
				}
		    }
		});
		/*
		gantt.attachEvent("onTaskDrag", function(id, mode, task, original){
		    var modes = gantt.config.drag_mode;
		    if(mode == modes.move){
		        var diff = task.start_date - original.start_date;
		        gantt.eachTask(function(child){
		            child.start_date = new Date(+child.start_date + diff);
		            child.end_date = new Date(+child.end_date + diff);
		            gantt.refreshTask(child.id, true);
		        },id );
		    }
		});
		*/
		//rounds positions of the child items to scale
		gantt.attachEvent("onAfterTaskDrag", function(id, mode, e){
		    var modes = gantt.config.drag_mode;
		    if(mode == modes.move ){
		        var state = gantt.getState();
		        gantt.eachTask(function(child){          
		            child.start_date = gantt.roundDate({
		                date:child.start_date, 
		                unit:state.scale_unit, 
		                step:state.scale_step
		            });         
		            child.end_date = gantt.calculateEndDate(child.start_date, 
		                child.duration, gantt.config.duration_unit);
		            gantt.updateTask(child.id);
		        },id );
		    }
		});
		gantt.attachEvent("onBeforeTaskDrag", function(id, mode, e){
			var task = gantt.getTask(id);
		
		    if(task.status == "완료"){
		        return false;      //denies dragging if the global task index is odd
		    }
		    return true;           //allows dragging if the global task index is even
		});
		
		/*
		
		var task = gantt.getTask(id);
	    var child = gantt.getChildren(id);
		if(task.$level == 1){
			var stmp = task.start_date; stmp.setDate(task.start_date.getDate() + 1);
			var etmp = task.end_date; etmp.setDate(task.end_date.getDate() - 1);
			console.log("########test#########");
			console.log(stmp);console.log(etmp);
			for(var i=0;i<child.length;i++){
				if(task.start_date > child[i].start_date){
					if(task.start_date > child[i].end_date){
						child[i].start_date = task.start_date;
						child[i].end_date = stmp;
						console.log("########1#########");
						console.log(child[i].start_date);
						console.log(child[i].end_date);
						gantt.updateTask(child[i].id);
					} else {
						console.log("########2#########");
						child[i].start_date = task.start_date;
						console.log(child[i].start_date);
						gantt.updateTask(child[i].id);
					}
				} else if(task.end_date < child[i].end_date){
					if(task.end_date < child[i].start_date){
						console.log("########3#########");	
					
						child[i].start_date = etmp;
						child[i].end_date = task.end_date;
						console.log(child[i].start_date);
						console.log(child[i].end_date);
						gantt.updateTask(child[i].id);
					} else {
						console.log("########4#########");	
					
						task[i].end_date = task.end_date;
						console.log(child[i].end_date);
						gantt.updateTask(child[i].id);
					}
				}
			}
		}
		
		
		gantt.attachEvent("onAfterTaskMove", function(id, parent, tindex){
			var task = gantt.getTask(id);
			updateCall2(id,parent,task);
			gantt.refreshData();
		});
		
		gantt.attachEvent("onRowDragStart", function(id, target, e) {
		    drag_id = id;
		    return true;
		});
		
		gantt.attachEvent("onRowDragEnd", function(id, target) {
		    drag_id = null;
		    gantt.render();
		});
		 
		gantt.templates.grid_row_class = function(start, end, task){
		    if(drag_id && task.id != drag_id){
		        if(task.$level != gantt.getTask(drag_id).$level)
		            return "cant-drop";
		        }
		    return "";
		};
		*/
		
		// 테스크 버튼 클릭 시
		if("${mem.auth}"=='pm'){
			gantt.config.order_branch = true;
			
			
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
			
			/*			
			gantt.attachEvent("onBeforeTaskDrag", function(id, mode, e){
		        return false;      //denies dragging if the global task index is odd
			});
			*/
			gantt.config.readonly = true;
			gantt.config.columns = [
				{name: "title", tree: true, width: '*', resize: true , label:"title"},
				{name: "start_date", align: "center", resize: true},
				//{name: "duration", align: "center"},
				{name: "holder", align: "center", resize: true, label:"holder"}
			];
			/*
			gantt.attachEvent("onTaskClick", function(id, e){
				alert("프로젝트 매니저만 이용가능한 서비스입니다.");
			});
			*/
		} else if("${mem.auth}"=='ceo' || "${mem.auth}"=='hp'){
			gantt.config.readonly = true;
			/*		
			gantt.attachEvent("onBeforeTaskDrag", function(id, mode, e){
		        return false;      //denies dragging if the global task index is odd
			});
			gantt.templates.progress_text=function(start, end, task){
				  return formatProgress(task)
			};
			*/
			/*
			gantt.config.columns = [
				{name: "title", tree: true, width: '*', resize: true, label:"title"},
				{name: "start_date", align: "center", resize: true},
				{name: "duration", align: "center"},
				{name: "holder", align: "center", resize: true, label:"holder"},
				{name: "progress", align: "center", resize: true, label:"Progress",
					template: function(task){return formatProgress(task);}}
			]
			*/
			gantt.config.columns = [
				{name: "title", tree: true, width: '*', resize: true , label:"title"},
				{name: "start_date", align: "center", resize: true},
				//{name: "duration", align: "center"},
				{name: "holder", align: "center", resize: true, label:"holder"}
			];
			/*
			gantt.attachEvent("onTaskClick", function(id, e){
				alert("프로젝트 매니저만 이용가능한 서비스입니다.");
			});
			*/
		}


		
		
	});// document 끝
	//task 생성 및 수정
	function updateCall(id,item){
		console.log("###updateCall###");	
		console.log(id);
		console.log(item);
			 
	  var sch = callSch(item);
	  console.log("##return upt Sch##");
	  console.log(sch);
	  $.ajax({
		  type:"post",
		  url:"${path}/gantt.do?method=update&no="+'${no}',
		  data:sch,
		  dataType:"json",
		  success:function(data){
			  if(data.success=="Y"){
				  alert("수정 완료");  
				  console.log(data.gantt);
				  g = data.gantt;
					var tes = data.gantt.substring(8,data.gantt.length-1);
					//console.log(data.gantt);
					console.log(tes);
					
					var arrayList = new Array(tes);
					
					var j = JSON.parse(tes);
					for(var i=0;i<j.length;i++){
						holder.push(j[i].holder);
						if("${mem.name}" == j[i].holder){
							tid.push(Number(j[i].id));	
						}
						arrstart_date.push(Convertdate(j[i].start_date));
						arrend_date.push(Convertdate(j[i].end_date));
						//leftLimit = getFormatDate(arrstart_date);
						//rightLimit = getFormatDate(arrend_date[0]);
						
						//console.log(arrstart_date[i]);
						//console.log(arrend_date[i]);
					}
					leftLimit = arrstart_date[0];
					rightLimit = arrend_date[0];
					for(var j=0;j<data.names.length;j++) {
						var tmp = {key : data.names[j], label : data.names[j]}
						names.push(tmp);
					}
					gantt.parse(data.gantt);
			  }
		  },
		  error:function(err){
			  alert("에러발생: " + err);
			  console.log(err);
		  }
	  });
	}
	
	function updateCall2(id,parent,task){
		console.log("###updateCall###");	
		console.log(id);
		console.log(parent);
			 
	  var sch = callSch2(id,parent,task);
	  //console.log("##return upt Sch##");
	  //console.log(sch);
	  $.ajax({
		  type:"post",
		  url:"${path}/gantt.do?method=update&no="+'${no}',
		  data:sch,
		  dataType:"json",
		  success:function(data){
			  if(data.success=="Y"){
				  alert("수정 완료");  
				  console.log(data.gantt);
				  g = data.gantt;
					var tes = data.gantt.substring(8,data.gantt.length-1);
					//console.log(data.gantt);
					console.log(tes);
					
					var arrayList = new Array(tes);
					
					var j = JSON.parse(tes);
					for(var i=0;i<j.length;i++){
						holder.push(j[i].holder);
						if("${mem.name}" == j[i].holder){
							tid.push(Number(j[i].id));	
						}
						arrstart_date.push(Convertdate(j[i].start_date));
						arrend_date.push(Convertdate(j[i].end_date));
						//leftLimit = getFormatDate(arrstart_date);
						//rightLimit = getFormatDate(arrend_date[0]);
						
						//console.log(arrstart_date[i]);
						//console.log(arrend_date[i]);
					}
					leftLimit = arrstart_date[0];
					rightLimit = arrend_date[0];
					for(var j=0;j<data.names.length;j++) {
						var tmp = {key : data.names[j], label : data.names[j]}
						names.push(tmp);
					}
					gantt.parse(data.gantt);
			  }
		  },
		  error:function(err){
			  alert("에러발생: " + err);
			  console.log(err);
		  }
	  });
	}
		
	function insertCall(id,item){
		console.log("###insertCall###");	
		console.log(id);
		console.log(item);
	  	var sch = newSch(item);
	  //console.log("##return ins Sch##");
	  //console.log(sch);
	  
	  $.ajax({
		  type:"post",
		  url:"${path}/gantt.do?method=insert&no="+'${no}',
		  data:sch,
		  dataType:"json",
		  success:function(data){
			  if(data.success=="Y"){
				  alert("등록 완료");  
				  console.log(data.gantt);
				  g = data.gantt;
					var tes = data.gantt.substring(8,data.gantt.length-1);
					//console.log(data.gantt);
					console.log(tes);
					
					var arrayList = new Array(tes);
					
					var j = JSON.parse(tes);
					for(var i=0;i<j.length;i++){
						holder.push(j[i].holder);
						if("${mem.name}" == j[i].holder){
							tid.push(Number(j[i].id));	
						}
						arrstart_date.push(Convertdate(j[i].start_date));
						arrend_date.push(Convertdate(j[i].end_date));
						//leftLimit = getFormatDate(arrstart_date);
						//rightLimit = getFormatDate(arrend_date[0]);
						
						//console.log(arrstart_date[i]);
						//console.log(arrend_date[i]);
					}
					leftLimit = arrstart_date[0];
					rightLimit = arrend_date[0];
					for(var j=0;j<data.names.length;j++) {
						var tmp = {key : data.names[j], label : data.names[j]}
						names.push(tmp);
					}
					gantt.parse(data.gantt);
			  }
		  },
		  error:function(err){
			  alert("에러발생: " + err);
			  console.log(err);
		  }
	  });
	};
	  function deleteTask(id){
		  //var task = gantt.getTask(id);
		  console.log("###delete###");
		  console.log(id);
		  
		  $.ajax({
			  type:"post",
			  url:"gantt.do?method=delete&no="+'${no}',
			  data:{id:id},
			  dataType:"json",
			  success:function(data){
				  if(data.success=="Y"){
					  alert("삭제 완료");  
					  console.log(data.gantt);
					  g = data.gantt;
						var tes = data.gantt.substring(8,data.gantt.length-1);
						//console.log(data.gantt);
						console.log(tes);
						
						var arrayList = new Array(tes);
						
						var j = JSON.parse(tes);
						for(var i=0;i<j.length;i++){
							holder.push(j[i].holder);
							if("${mem.name}" == j[i].holder){
								tid.push(Number(j[i].id));	
							}
							arrstart_date.push(Convertdate(j[i].start_date));
							arrend_date.push(Convertdate(j[i].end_date));
							//leftLimit = getFormatDate(arrstart_date);
							//rightLimit = getFormatDate(arrend_date[0]);
							
							//console.log(arrstart_date[i]);
							//console.log(arrend_date[i]);
						}
						leftLimit = arrstart_date[0];
						rightLimit = arrend_date[0];
						for(var j=0;j<data.names.length;j++) {
							var tmp = {key : data.names[j], label : data.names[j]}
							names.push(tmp);
						}
						gantt.parse(data.gantt);
				  }
			  },
			  error:function(err){
				  alert("에러발생: " + err);
				  console.log(err);
			  }
		  });
	  }
	 
	// is_new == true 일 때, 빈 데이터 채우기
	function newSch(gantt){
		console.log("###newSch###");
		console.log(gantt);
		var sch = {}; var tmp_start; var tmp_end;
	  sch.title = gantt.title;
	  sch.parent = gantt.parent;
	  sch.progress = gantt.progress;
	  sch.sortorder = 0; 
	  sch.id = 0;	
	  sch.text = gantt.text;
	  
	  tmp_start = gantt.start_date; 
	  tmp_start.setHours(tmp_start.getHours() + 9);
	  sch.start_date = tmp_start.toISOString();
	  
	  tmp_end = gantt.end_date;
	  tmp_end.setHours(tmp_end.getHours() + 9);
	  sch.end_date = tmp_end.toISOString();
	  
	  sch.holder = gantt.holder;
	  sch.priority = Number(gantt.priority);
	  sch.status = "진행";
	  
	  return sch;
	}

	function callSch(gantt){
		console.log("###callSch###");
		console.log(gantt);console.log(gantt.id);
	  var sch = {}; var tmp_start; var tmp_end;
	  sch.title = gantt.title;
	  if(gantt.id == 1) sch.parent = "0";
	  else sch.parent = gantt.parent;
	  sch.progress = gantt.progress;
	  sch.sortorder = gantt.sortorder; 
	  sch.id = gantt.id;	
	  sch.text = gantt.text;
	  
	  tmp_start = gantt.start_date; 
	  tmp_start.setHours(tmp_start.getHours() + 9);
	  sch.start_date = tmp_start.toISOString();
	  
	  tmp_end = gantt.end_date;
	  tmp_end.setHours(tmp_end.getHours() + 9);
	  sch.end_date = tmp_end.toISOString();
	  
	  sch.holder = gantt.holder;
	  sch.priority = Number(gantt.priority);
	  sch.status = gantt.status;
	  console.log("#########convert##########");
	  console.log(sch.start_date);
	  console.log(sch.end_date);
	  return sch;
	}
	
	function callSch2(id,parent,task){
		console.log("###2callSch2###");
		console.log(id);console.log(parent);console.log(task);
	  var sch = {}; var tmp_start; var tmp_end;
	  sch.title = task.title;
	  sch.parent = parent;
	  sch.progress = task.progress;
	  sch.sortorder = task.sortorder; 
	  sch.id = task.id;	
	  sch.text = task.text;
	  
	  tmp_start = task.start_date; 
	  tmp_start.setHours(tmp_start.getHours() + 9);
	  sch.start_date = tmp_start.toISOString();
	  
	  tmp_end = task.end_date;
	  tmp_end.setHours(tmp_end.getHours() + 9);
	  sch.end_date = tmp_end.toISOString();
	  
	  sch.holder = task.holder;
	  sch.priority = Number(task.priority);
	  console.log("#########convert##########");
	  console.log(sch.start_date);
	  console.log(sch.end_date);
	  return sch;
	}
	/*
	function formatDate(date){
		var d = new Date(date),
		month = '' + (d.getMonth() + 1),
		day = '' + d.getDate(),
		year = d.getFullYear(),
		hour = d.getHours(),
		min = d.getMinutes(),
		sec = d.getSeconds();
		
		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;
		
		return [year,month,day].join('-') + ' ' + [hour,min,sec].join(':');
	}
	
	function getFormatDate(date){
	    //var year = date.getFullYear();              //yyyy
	    //var month = (1 + date.getMonth());          //M
	    //month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    //var day = date.getDate();                   //d
	    //day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    //return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	    var year2 = date.substring(0,4);
	    var month2 = date.substring(5,7);
	    var day2 = date.substring(8,10);        
	    var limit = new Date(year2,month2-1,day2);
	    console.log("##############");
	    console.log(year2);console.log(month2);console.log(day2);
	    console.log(limit);
	    return limit;
	}
	*/
	function Convertdate(date){
		var d = new Date(date);
		d = new Date(d.getTime() - 3000000);
		var date_format_str = d.getFullYear().toString()+"-"+((d.getMonth()+1).toString().length==2?(d.getMonth()+1).toString():"0"+(d.getMonth()+1).toString())+"-"+(d.getDate().toString().length==2?d.getDate().toString():"0"+d.getDate().toString())+" "+(d.getHours().toString().length==2?d.getHours().toString():"0"+d.getHours().toString())+":"+((parseInt(d.getMinutes()/5)*5).toString().length==2?(parseInt(d.getMinutes()/5)*5).toString():"0"+(parseInt(d.getMinutes()/5)*5).toString())+":00";
		
		return date_format_str;
	}
	
	// ceo, hp progress 표시용
	function formatProgress(task){
		  return Math.round(task.progress * 100) + "%"
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

.gantt_grid_head_add {
	display:none;
}
.gantt_cal_light {
	width:600px;
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
														<a href="#"><button class="btn btn-primary btn-md">${project.project_name}</button></a>
														</div> 
							<div class="col-xl-12">
									 <ul class="nav nav-tabs nav-bordered" style="padding-top:10px;">
							            <li class="nav-item">
							                      <a href="${path}/task.do?method=view&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-home-variant"></i></span>
							                    <span class="d-none d-sm-inline-block">오버뷰</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/task.do?method=list&no=${param.no}" class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
							                    <span class="d-none d-sm-inline-block">태스크리스트</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/dashboard.do?method=list&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
							                    <span class="d-none d-sm-inline-block">대시보드</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/gantt.do?method=gantt&no=${param.no}"  class="nav-link active">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-email-variant"></i></span>
							                    <span class="d-none d-sm-inline-block">간트차트</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/cal.do?method=list&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                    <span class="d-none d-sm-inline-block">캘린더</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/task.do?method=log&no=${param.no}"  class="nav-link">
							                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                    <span class="d-none d-sm-inline-block">활동로그</span>
							                </a>
							            </li>
							            <li class="nav-item">
							                <a href="${path}/risk.do?method=riskBoard&no=${param.no}"  class="nav-link">
							                           <span class="d-inline-block d-sm-none"><i class="mdi mdi-cog"></i></span>
							                           <span class="d-none d-sm-inline-block">리스크 현황</span>
							                </a>
							            </li>
							            <c:if test="${mem.auth=='pm' }">
								 <li class="nav-item"><a
									href="${path}/risk.do?method=riskRequest&no=${param.no}" class="nav-link "> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-info-circle"></i></span> <span
										class="d-none d-sm-inline-block">리스크 요청</span>
								</a></li>
								</c:if>
							         </ul> 
								</div>
							</div>
                        <!--  start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">Gantt</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">${mem.auth}</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">${project.project_name}</a></li>
                                            <li class="breadcrumb-item active">Gantt</li>
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
										<div id="gantt_here" style='width:100%; height:450px;'></div>
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