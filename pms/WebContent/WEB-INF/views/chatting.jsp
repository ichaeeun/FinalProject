<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>★☆★채팅★☆★</title>
<style type="text/css">
table#demo-foo-filtering tr:first-child th { background:  rgba(0, 0, 0, 0.075);}
.chatting { display:none!important; }
.conversation-list { overflow:auto!important; }
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">

<!-- App css -->
<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
<link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

<!-- icons -->
<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<%-- j-query --%>
<script type="text/javascript" src="/springweb/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	// 1. 전역변수 웹소켓통신 처리한 변수선언.
var wsocket;
	// 2. 접속시, 처리내용
			var date = new Date().format("hh.mm");
			//ws://192.168.0.47:7080/${path}/chat-ws.do
				// 211.63.89.68
			wsocket = new WebSocket("ws://localhost:7080/${path}/chat-ws.do?no="+"${no}");
			wsocket.onopen=function(evt){
				// 채팅서버에 접속되었을 때, 처리할 내용..
				console.log(evt)
				// 접속메시지 전송..
			var id = "${mem.name}";
			var	show = "<li class='clearfix odd'><div class='chat-avatar'>";
				show += "<c:if test='${empty mem.imgpath}'><img src='${path}/Admin/dist/assets/images/users/default.png'";
				show += "alt='user-image class='rounded-circle' id='img'> </c:if>";
                show += "<c:if test='${not empty mem.imgpath}'>";
                show += "<c:set var = 'length' value = '${fn:length(showprofile.imgpath)}'/>";
                show += "<img src='${path}/${fn:substring(showprofile.imgpath, 48, length)}' alt='user-image' width='160px' height='160px' class='rounded-circle' id='img'></c:if>";		
				show +=	"<i>"+date+"</i>";
				show +="</div><div class='conversation-text'><div class='ctext-wrap'>";
		        show += "<i>"+id+"</i>";
		        show += "<p>접속 되었습니다</p></div></div>";
		        show += "</li>";
	
				wsocket.send("${no}:"+id+":"+date+":연결접속되었습니다");
				
				$("#chatMessageArea").append(show);			
				
			}
			// 2.서버에서 메시지 받기.
			wsocket.onmessage=function(evt){
				var data = evt.data; // 메시지를 받음..
				
				var user = data.split(":");
				if(user[0]=="${no}"){ // 현재그룹과 동일여부 확인
					// 메시지만 전달 처리.
					revMsg(user[1]+":"+user[2]+":"+user[3]);	
					  console.log(user[0]);
					    console.log(user[1]);
					    console.log(user[2]);
					    console.log(user[3]);
				}
				 
	/* 			$("#chatMessageArea").append(data+"<br>"); 
				if(data.substring(0,4)=="msg:"){
					// 메시지만 전달 처리..
					revMsg(data.substring(4));
				} */
							
			}
			// 3. 서버에 종료 처리.
			wsocket.onclose=function(){
				alert("접속을 종료합니다!");
				$("#chatMessageArea").text("");
				$("#sendBtn").val("").focus();
			}
		

	// .send()는 서버의 heandleTextMessage와 연동
	$("#sendBtn").click(function(){
		sendMsg();
	});
	$("#msg").keyup(function(e){
		if(e.keyCode==13){
			sendMsg();
		}
	});
	
	$("#exitBtn").click(function(){
		
		wsocket.send("msg:"+"${mem.name}"+":연결을 종료합니다.");
		wsocket.close();
	});
	
	function sendMsg(){
	var date = new Date().format("hh.mm");
	var msg = $("#msg").val();
	var	show = "<li class='clearfix odd'><div class='chat-avatar'>";
		show += "<c:if test='${empty mem.imgpath}'><img src='${path}/Admin/dist/assets/images/users/default.png'";
		show += "alt='user-image class='rounded-circle' id='img'> </c:if>";
        show += "<c:if test='${not empty mem.imgpath}'>";
        show += "<c:set var = 'length' value = '${fn:length(showprofile.imgpath)}'/>";
        show += "<img src='${path}/${fn:substring(showprofile.imgpath, 48, length)}' alt='user-image' width='160px' height='160px' class='rounded-circle' id='img'></c:if>";		
		show +=	"<i>"+date+"</i>";
		show +="</div><div class='conversation-text'><div class='ctext-wrap'>";
        show += "<i>${mem.name}</i>";
        show += "<p>"+msg+"</p></div></div>";
        show += "</li>";
        
   		wsocket.send("${no}:${mem.name}:"+date+":"+msg);
	/* 	alert(show); */
		$("#msg").val("");
		
		 $("#chatMessageArea").append(show);	
		
	}
	
	function revMsg(msg){
 	var msgm = msg.split(":");
	var	show = "<li class='clearfix'><div class='chat-avatar'>";		
		show +=	"<i>"+msgm[1]+"</i>";
		show +="</div><div class='conversation-text'><div class='ctext-wrap'>";
        show += "<i>"+msgm[0]+"</i>";
        show += "<p>"+msgm[2]+"</p></div></div>";
        show += "</li>";
        var mname = "${mem.name}";
       if(mname == msgm[0]){
    	  
       }else{
    	   $("#chatMessageArea").append(show);   	  
       }
       
		
		// 자동 스크롤처리.. (메시지 내용)
		var mx = parseInt($("#chatMessageArea").height());
		$("#chatArea").scrollTop(mx);
	}
});

</script>
</head>
<body class="loading">
        <!-- Begin page -->
        <div id="wrapper">

          <!-- Topbar Start -->
          <jsp:include page="top.jsp"></jsp:include>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
  			<jsp:include page="side.jsp"></jsp:include>
            <!-- End Sidebar -->

            <!--<div class="clearfix"></div> -->

             
                <!-- Sidebar -left -->

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
                                    <h4 class="page-title">Chat</h4>
                                    <div class="page-title-right" style="display:none;">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Apps</a></li>
                                            <li class="breadcrumb-item active">Chat</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <!-- start chat users-->
                            <div class="col-xl-3 col-lg-4" style="display:none;">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start align-items-start mb-3">
                                            <img src="${path}/Admin/dist/assets/images/users/avatar-1.jpg" class="me-2 rounded-circle" height="42" alt="Brandon Smith">
                                            <div class="flex-1">
                                                <h5 class="mt-0 mb-0 font-15">
                                                    <a href="contacts-profile.html" class="text-reset">Nik Patel</a>
                                                </h5>
                                                <p class="mt-1 mb-0 text-muted font-14">
                                                    <small class="mdi mdi-circle text-success"></small> Online
                                                </p>
                                            </div>
                                            <div>
                                                <a href="javascript: void(0);" class="text-reset font-20">
                                                    <i class="mdi mdi-cog-outline"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <!-- start search box -->
                               
                                            <div class="position-relative">
                                                <input type="text" class="form-control form-control-light" placeholder="People, groups & messages${path}/Admin/dist.">
                                                <span class="mdi mdi-magnify"></span>
                                            </div>
                             
                                        <!-- end search box -->

                                        <h6 class="font-13 text-muted text-uppercase mb-2">Contacts</h6>

                                        <!-- users -->
                                        <div class="row">
                                            <div class="col">
                                                <div data-simplebar style="max-height: 498px">
                                                    <a href="javascript:void(0);" class="text-body">
                                                        <div class="d-flex align-items-start p-2">
                                                            <div class="position-relative">
                                                                <span class="user-status"></span>
                                                                <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" class="me-2 rounded-circle" height="42" alt="user" />
                                                            </div>
                                                            <div class="flex-1">
                                                                <h5 class="mt-0 mb-0 font-14">
                                                                    <span class="float-end text-muted fw-normal font-12">4:30am</span>
                                                                    Brandon Smith
                                                                </h5>
                                                                <p class="mt-1 mb-0 text-muted font-14">
                                                                    <span class="w-25 float-end text-end"><span class="badge badge-soft-danger">3</span></span>
                                                                    <span class="w-75">How are you today?</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </a>

                                 

                                                    <a href="javascript:void(0);" class="text-body">
                                                        <div class="d-flex align-items-start p-2">
                                                            <div class="position-relative">
                                                                <span class="user-status busy"></span>
                                                                <img src="${path}/Admin/dist/assets/images/users/avatar-7.jpg" class="me-2 rounded-circle" height="42" alt="user" />
                                                            </div>
                                                            <div class="flex-1">
                                                                <h5 class="mt-0 mb-0 font-14">
                                                                    <span class="float-end text-muted fw-normal font-12">Thu</span>
                                                                    Maria C
                                                                </h5>
                                                                <p class="mt-1 mb-0 text-muted font-14">
                                                                    <span class="w-25 float-end text-end"><span class="badge badge-soft-danger">2</span></span>
                                                                    <span class="w-75">Are we going to have this week's planning meeting today?</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </a>

                                                    <a href="javascript:void(0);" class="text-body">
                                                        <div class="d-flex align-items-start p-2">
                                                            <div class="position-relative">
                                                                <span class="user-status online"></span>
                                                                <img src="${path}/Admin/dist/assets/images/users/avatar-8.jpg" class="me-2 rounded-circle" height="42" alt="user" />
                                                            </div>
                                                            <div class="flex-1">
                                                                <h5 class="mt-0 mb-0 font-14">
                                                                    <span class="float-end text-muted fw-normal font-12">Wed</span>
                                                                    Rhonda D
                                                                </h5>
                                                                <p class="mt-1 mb-0 text-muted font-14">
                                                                    <span class="w-75">Please check these design assets${path}/Admin/dist.</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </a>

                                               



                                                </div> <!-- end slimscroll-->
                                            </div> <!-- End col -->
                                        </div>
                                        <!-- end users -->
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div>
                            <!-- end chat users-->

                            <!-- chat area -->
                            <div class="col-xl-9 col-lg-8" id="">
                                <div class="card">                              
                                    <div class="card-body" id="chatArea">
                                        <ul id="chatMessageArea" class="conversation-list chat-app-conversation" style="max-height: 460px">
                                          <%--   <li class="clearfix">
                                                <div class="chat-avatar">
                                                    <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" class="rounded" alt="James Z" />
                                                    <i>10:00</i>
                                                </div>
                                                <div class="conversation-text">
                                                    <div class="ctext-wrap">
                                                        <i>James Zavel</i>
                                                        <p>
                                                            Hello!
                                                        </p>
                                                    </div>
                                                </div>                                          
                                            </li> --%>
                                         
                                     
                                              
                                        </ul>

                                        <div class="row">
                                            <div class="col">
                                                <div class="mt-2 bg-light p-3 rounded">

                                                        <div class="row">
                                                            <div class="col mb-2 mb-sm-0">
                                                                <input type="text" class="form-control border-0" placeholder="Enter your text" id="msg" required="">
                                                                <div class="invalid-feedback mt-2">
                                                                    Please enter your messsage
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="btn-group">
                                                                    <a href="#" class="btn btn-light"><i class="fe-paperclip"></i></a>
                                                                    <div class="d-grid">
                                                                        <button type="button" id="sendBtn" class="btn btn-success chat-send"><i class='fe-send'></i></button>
                                                                    </div>
                                                                </div>
                                                            </div> <!-- end col -->
                                                        </div> <!-- end row-->
                                                  
                                                </div> 
                                            </div> <!-- end col-->
                                        </div>
                                        <!-- end row -->
                                    </div> <!-- end card-body -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end chat area-->

                        </div> <!-- end row-->
                        
                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
                <jsp:include page="footer.jsp"></jsp:include>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- Right Sidebar -->
       <jsp:include page="right.jsp"></jsp:include>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script> 

        <!-- App js -->
      <script src="${path}/Admin/dist/assets/js/app.min.js"></script>  

        
    </body>
<script type="text/javascript">
    Date.prototype.format = function (f) {
        if (!this.valueOf()) return " ";
        var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
        var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
        var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        var d = this;
        return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
           switch ($1) {
                case "yyyy": return d.getFullYear(); // 년 (4자리)
                case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
                case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
                case "dd": return d.getDate().zf(2); // 일 (2자리)
                case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
                case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
                case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
                case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
                case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
                case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
                case "mm": return d.getMinutes().zf(2); // 분 (2자리)
                case "ss": return d.getSeconds().zf(2); // 초 (2자리)
                case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
                default: return $1;
            }
        });
    };
    String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
    String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
    Number.prototype.zf = function (len) { return this.toString().zf(len); };
    </script>
</html>