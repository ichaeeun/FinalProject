<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<c:if test="${mem.auth == 'ceo' }"><title>최고경영자</title></c:if>
	<c:if test="${mem.auth == 'hp' }"><title>인사담당자</title></c:if>
	<c:if test="${mem.auth == 'pm' }"><title>프로젝트 매니저</title></c:if>
	<c:if test="${mem.auth == 'wk' }"><title>개발자</title></c:if>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
	<meta content="Coderthemes" name="author" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >	
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
		var proc="${proc}";
		if(proc=="insert"){
			if("${mem.auth}" == 'wk'){
				alert("PM 리스크 요청페이지로 전송되었습니다.");
// 				$("#top-modal").modal("show");
			}else{
				alert("등록이 완료되었습니다.");
			}
		};
		
		if(proc=="update"){
				alert("수정이 완료되었습니다.");
				location.href="${path}/risk.do?method=riskBoard&no=${param.no}";
		};
		
		if(proc=="delete"){
			alert("삭제가 완료되었습니다.");
			location.href="${path}/risk.do?method=riskBoard&no=${param.no}";
		}
		
		$('.risk_item').on("dblclick", function(){
			console.log($(this).children().eq(8).children().val());	//배열에서 8번째 값의 안에 있는 input의 value값을 가져온다.
 			var risk_no = $(this).children().eq(8).children().val();
 			$('[name=risk_no]').val(risk_no);
			
 			$('#detail_form').submit();
		})
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
            <!-- Left Sidebar End -->

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
                    <div class="row">
						<div class="row" style="padding-top: 10px;">
							<a href="#"><button
									class="btn btn-primary btn-md">${project.project_name}
								</button></a>
							<%-- ${ViewMem.project_name} --%>
						</div>
						<div class="col-xl-12">
							<ul class="nav nav-tabs nav-bordered" style="padding-top: 10px;">
								<li class="nav-item"><a
									href="${path }/task.do?method=view&no=${param.no}"
									class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-book-open"></i></span> <span
										class="d-none d-sm-inline-block">오버뷰</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/task.do?method=list&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class="bx bx-task"></i></span> <span
										class="d-none d-sm-inline-block">태스크리스트</span>
								</a></li>
								<li class="nav-item"><a href="${path}/dashboard.do?method=list&no=${param.no}" class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bxs-dashboard"></i></span> <span
										class="d-none d-sm-inline-block">대시보드</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/gantt.do?method=gantt&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class=" bx bx-bar-chart-square"></i></span> <span
										class="d-none d-sm-inline-block">간트차트</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/cal.do?method=list&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class="bx bx-calendar"></i></span> <span
										class="d-none d-sm-inline-block">캘린더</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/task.do?method=log&no=${param.no}"
									class="nav-link"> <span class="d-inline-block d-sm-none"><i
											class="bx bx-comment-dots"></i></span> <span
										class="d-none d-sm-inline-block">활동로그</span>
								</a></li>
								<li class="nav-item"><a
									href="${path}/risk.do?method=riskBoard&no=${param.no}" class="nav-link active"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-info-circle"></i></span> <span
										class="d-none d-sm-inline-block">리스크 현황</span>
								</a></li>
								<c:if test="${mem.auth=='pm' }">
								 <li class="nav-item"><a
									href="${path}/risk.do?method=riskRequest&no=${param.no}" class="nav-link"> <span
										class="d-inline-block d-sm-none"><i
											class="bx bx-info-circle"></i></span> <span
										class="d-none d-sm-inline-block">리스크 요청</span>
								</a></li>
								</c:if>
							</ul>
						</div>
					</div>

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">리스크</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="${path}/main.do?method=main">메인</a></li>
                                            <li class="breadcrumb-item active">리스크 보드</li>
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
                            			<c:if test="${mem.auth == 'wk' || mem.auth == 'pm'}">
                                        <div class="row mb-2">
                                            <div class="col-sm-6">
                                                <a href="${path}/risk.do?method=riskBoardCreate&no=${param.no}" class="btn btn-danger mb-2" id="regBtn">리스크 작성하기</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="float-sm-end">
                                                    <button type="button" class="btn btn-success mb-2 mb-sm-0"><i class="mdi mdi-cog"></i></button>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
                          				</c:if>
                                        <!-- end row -->
                                        
                
                                        <div class="table-responsive">
                                            <form action="${path}/risk.do?method=riskDetail&no=${param.no}" id="detail_form" method="post">
                                            <input type="hidden" value="" name="risk_no">
                                            <table class="table table-centered w-100 dt-responsive nowrap" 
                                            	id="products-datatable" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="all" style="width: 20px;">
                                                            <div class="form-check mb-0 font-16">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck">
                                                                <label class="form-check-label" for="productlistCheck">&nbsp;</label>
                                                            </div>
                                                        </th>
                                                        <th class="all">번호</th>
                                                        <th>제목</th>
                                                        <th>내용</th>
                                                        <th>리스크 카테고리</th>
                                                        <th>등록일</th>
                                                        <th>리스크 상태</th>
                                                        <th>작성자</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="rl" items="${risklist}">
                                                    <tr class="risk_item">
                                                        <td>
                                                            <div class="form-check mb-0 font-16">
                                                                <input class="form-check-input" type="checkbox" id="productlistCheck1">
                                                                <label class="form-check-label" for="productlistCheck1">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                 			${rl.rnum}
                                                        </td>
                                                        <td>   
                                             				<c:forEach varStatus="sts" begin="1" end="${rl.level}">
																<c:if test="${rl.level>1}">&nbsp;&nbsp;&nbsp;</c:if>
																<c:if test="${rl.level>1 and sts.last}">
											                  </c:if>
											      			</c:forEach>
											               <h5 class="m-0 d-inline-block align-middle">${rl.risk_title}</h5>
                                                        </td>
                                                        <td>
                                                            <div>${fn:substring(rl.risk_content, 0, 10)}...</div>
                                                        </td>
                                                        <td>
                                                   			[${rl.risk_category}]
                                                        </td>
                                                        <td>
                                                   			<fmt:formatDate value="${rl.regdte}"/>
                                                        </td>
                                                        <td>
                                                            ${rl.risk_status}
                                                        </td>
                                                        <td>
                                                            <div>
                                                     			${rl.risk_writer}
                                                            </div>
                                                        </td>
                                                        <td>
                                                        	<input type="hidden" value="${rl.risk_no}">
                                                        </td>
                                                    </tr>
                                              		</c:forEach>
                                                    <!-- 복붙해야할부분 -->
                                                </tbody>
                                            </table>
                                    		</form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->
                <!-- Footer Start -->
                <jsp:include page="footer.jsp"/>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <jsp:include page="right.jsp"></jsp:include>
        
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
        <script type="text/javascript">
        </script>
        
        
                 <!-- Top modal content -->
         <div id="top-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
             <div class="modal-dialog modal-top">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h4 class="modal-title" id="topModalLabel">Modal Heading</h4>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                         <h5>Text in a modal</h5>
                         <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
                     </div>
                     <div class="modal-footer">
                         <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                         <button type="button" class="btn btn-primary">Save changes</button>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
        
    </body>
</html>