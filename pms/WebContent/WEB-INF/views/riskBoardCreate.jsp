<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form"
      uri="http://www.springframework.org/tags/form"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
      <style>
         footer .chatting{display:none;}
         .uptTextarea{resize:none;
                  width:1560px;
                  height:500px;
                  border-color:"light-grey";}
      </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">
        <!-- Plugins css-->
        <link href="${path}/Admin/dist/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/Admin/dist/assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/Admin/dist/assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
        <link href="${path}/Admin/dist/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />
        
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
      
      console.log("${riskboard.fileInfo}");
      
         $(document).ready(function(){
            $("#mainBtn").click(function(){
               location.href="${path}/risk.do?method=riskBoard&no=${param.no}";
            });
            
            $("#sndBtn").click(function(){
            	if($("[name=risk_title]").val() != "" && $("[name=risk_content]").val() != ""){
		               $("[name=risk_writer]").val("${mem.name}");
		               var mem = "${mem.auth}";
		               $("[name=risk_no]").val(0);
		               if(mem=='pm') $("[name=risk_status]").val("승인");
		               if(mem=='wk') $("[name=risk_status]").val("미승인");
		               $("form").attr("action", "${path}/risk.do?method=insert&no=${param.no}");
		               $("#riskboard").submit();
	        	}else{
	        		alert("제목/내용을 모두 입력해주세요.");
	        	}
            });
            $("#uptBtn").click(function(){
            		if(confirm("수정하시겠습니까?")){
		               $("[name=risk_no]").val("${riskboard.risk_no}");
		               $("[name=risk_status]").val("승인");
		               $("[name=risk_writer]").val("${mem.name}");
		               $("#riskboard").attr("action", "${path}/risk.do?method=update&no=${param.no}");
		               $("#riskboard").submit();
            		}
            });
            
            
            
            $("#addFun").click(function(){
               $("#fileArea").append($(".custom-file").eq(0).clone());
            });
            
            
         });
            function rm(obj){
            var len=$("[type=file]").length;
               if(len>1){
                  $(obj).parent().remove();
               }
            }
            
            function rmOriginFile(fno, rmBtn){
            	$(fno).val("");
            	console.log(rmBtn);            	
            }
</script>
</head>
	<body class="loading">
		<!-- Begin page -->
		<div id="wrapper">
			<jsp:include page="top.jsp" flush="false"/>
			<!-- ========== Left Sidebar Start ========== -->         
			<jsp:include page="side.jsp" flush="false"/>
			
            <!-- Start Page Content here -->

			<div class="content-page">
				<div class="content">

					<!-- Start Content-->
					<div class="container-fluid">

						<!-- start page title -->
						<div class="row">
 							<div class="col-12">
 								<div class="page-title-box page-title-box-alt">
 									<c:if test="${reply != 'Y'}">
										<h4 class="page-title">리스크 작성 페이지</h4>
 									</c:if>
 									<c:if test="${reply == 'Y'}">
 										<h4 class="page-title">리스크 답글 페이지</h4>
 									</c:if>
 									<div class="page-title-right">
 										<ol class="breadcrumb m-0">
											<li class="breadcrumb-item"><a href="${path}/main.do?method=main">메인</a></li>
											<li class="breadcrumb-item"><a href="${path}/risk.do?method=riskBoard&no=${param.no}">리스크 목록</a></li>
											<li class="breadcrumb-item active">리스크 작성</li>
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
 										<div id="addproduct-nav-pills-wizard" class="twitter-bs-wizard form-wizard-header">
	 										<c:if test="${reply != 'Y'}">
	 											<ul class="twitter-bs-wizard-nav mb-2">
	 												<li class="nav-item">
	 													<a href="#general-info" class="nav-link" data-bs-toggle="tab" data-toggle="tab">
	 														<span class="d-none d-sm-inline">리스크 작성</span>
	 													</a>
	 												</li>
	 											</ul>
	 										</c:if>
	 										<c:if test="${reply == 'Y'}">
	 											<ul class="twitter-bs-wizard-nav mb-2">
	 												<li class="nav-item">
	 													<a href="#general-info" class="nav-link" data-bs-toggle="tab" data-toggle="tab">
	 														<span class="d-none d-sm-inline">리스크 답글 작성</span>
	 													</a>
	 												</li>
	 											</ul>
	 										</c:if>
 											<div class="tab-content twitter-bs-wizard-tab-content">
 												<div class="tab-pane" id="general-info">
 													<h4 class="header-title">리스크 작성 형식</h4>
 													<p class="sub-header">내용을 모두 채워주세요.</p>
 												<form:form id="riskboard" modelAttribute="riskboard" method="post" enctype="multipart/form-data">
 													<input type="hidden" name="risk_writer" />
 													<input type="hidden" name="risk_status" />
 													<input type="hidden" name="risk_no" value=""/>
 													<c:if test="${reply == 'Y'}">
 														<form:input type="hidden" path="risk_parent_no"/>
 													</c:if>
 													<div>
 														<div class="row">
 															<div class="col-lg-6">
 																<div class="mb-3">
																	<label for="product-name" class="form-label">제목 <span class="text-danger">*</span></label>
																		<form:input path="risk_title" type="text" id="product-name" class="form-control" placeholder="제목을 입력해주세요"/>
																</div>
                                                            </div>
														</div>

													<div class="mb-3">
<!-- form: <--이걸로 하는 방법을 모름-->						<label for="product-description" class="form-label">리스크 내용<span class="text-danger">*</span></label><br>
														<textarea class="uptTextarea" name="risk_content">${riskboard.risk_content}</textarea>
														<%--<form:input path="risk_content" type="hidden"/> --%>
														<c:if test="${reply != 'Y'}">
															<div class="row">
																<div class="col-lg-6">
																	<div class="mb-3">
																		<label for="product-category" class="form-label">리스크 카테고리<span class="text-danger">*</span></label>
																		<form:select path="risk_category" class="form-control select2" id="product-category">
																			<option value="결제">결제</option>
																			<option value="커뮤니케이션">커뮤니케이션</option>
																			<option value="프로젝트 기간">프로젝트 기간</option>
																			<option value="기타">기타</option>                       
																		</form:select>
																	</div>
																</div>
															</div>
														</c:if>
														<c:if test="${reply == 'Y'}">
															<div class="row">
																<div class="col-lg-6">
																	<div class="mb-3">
																		<label for="product-category" class="form-label">리스크 카테고리<span class="text-danger">*</span></label>
																		<form:select path="risk_category" class="form-control select2" id="product-category">
																			<option value="답글">답글</option>
																			<option value="기타">기타</option>                       
																		</form:select>
																	</div>
																</div>
															</div>
														</c:if>
													</div>
                                                    
													<div class="tab-pane" id="product-img">
                                                   	<!-- 기존 파일 -->
														<c:if test="${update == 'Y'}">
															<div class="row mb-5">
		                                              			<h4 class="header-title">기존 업로드 파일</h4>
		                                                		<c:forEach var="finf" items="${riskboard.fileInfo}" varStatus="sts">
			                                            			<div id="fileArea">
			                                                  			<div class="custom-file">
			                                                     			<div class="row">
				                                            					<div class="col-3 ml-3">
				                                                  	        		<input type="text" value="${finf.filename}" style="border: none" readonly
				                                                  	        			id="org${finf.fno}">
				                                                          		</div>
				                                                   				<div class="col-3">
				                                                        			<span onclick="rmOriginFile(org${finf.fno}, this)"> [X] </span>
				                                                     			</div>
			                                                    			</div>
			                                                    		</div>
			                                            			</div>
		                                                        </c:forEach>
		                                             		</div>
	                                             		</c:if>

													<!-- 업데이트 파일 -->
														<h4 class="header-title">첨부 파일<span id="addFun">[추가]</span></h4>
                                                   		<div id="fileArea">
                                                   			<div class="custom-file">
                                                   				<input name="report" type="file"/>
                                                   				<span onclick="rm(this)"> [X] </span><br>
                                                   			</div>
                                                   		</div>

													<!-- Preview -->
														<div class="dropzone-previews mt-3" id="file-previews">
															<ul class="pager wizard mb-0 list-inline text-end mt-3">
																<li class="previous list-inline-item">
																	<button id="mainBtn" type="button" class="btn btn-secondary"><i class="mdi mdi-arrow-left">
																	</i> 리스크 작성 화면으로 </button>
																</li>
																<c:if test="${update != 'Y'}">
																	<li class="next list-inline-item">
																		<button type="button" id="sndBtn" class="btn btn-success">제출
																		<i class="mdi mdi-arrow-right ms-1"></i></button>
																	</li>
																</c:if>
																<c:if test="${update == 'Y'}">
																	<li class="next list-inline-item">
																		<button type="button" id="uptBtn" class="btn btn-success">수정
																		<i class="mdi mdi-arrow-right ms-1"></i></button>
																	</li>
																</c:if>
															</ul>
														</div>
													</div>
												</form:form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!-- end row -->
					</div> <!-- container -->
				</div> <!-- content -->
				
                <!-- Footer Start -->
                <jsp:include page="footer.jsp"/>
                <!-- end Footer -->
			</div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


		</div><!-- END wrapper -->

        <!-- Right Sidebar -->
		<div class="right-bar">
            <div data-simplebar class="h-100">
    
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-bordered nav-justified" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#chat-tab" role="tab">
                            <i class="mdi mdi-message-text-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#tasks-tab" role="tab">
                            <i class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2 active" data-bs-toggle="tab" href="#settings-tab" role="tab">
                            <i class="mdi mdi-cog-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content pt-0">
                    <div class="tab-pane" id="chat-tab" role="tabpanel">
                
                        <form class="search-bar p-3">
                            <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="mdi mdi-magnify"></span>
                            </div>
                        </form>

                        <h6 class="fw-medium px-3 mt-2 text-uppercase">Group Chats</h6>

                        <div class="p-2">
                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
                                <span class="mb-0 mt-1">App Development</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
                                <span class="mb-0 mt-1">Office Work</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
                                <span class="mb-0 mt-1">Personal Group</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1"></i>
                                <span class="mb-0 mt-1">Freelance</span>
                            </a>
                        </div>

                        <h6 class="fw-medium px-3 mt-3 text-uppercase">Favourites <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="p-2">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To an English person, it will seem like simplified</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status busy"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To achieve this, it would be necessary.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium px-3 mt-3 text-uppercase">Other Chats <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="p-2 pb-4">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status online"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">Everyone realizes why a new common language.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status away"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The languages only differ in their grammar.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status online"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">If several languages coalesce the grammar of the resulting.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status online"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status busy"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The new common language will be more simple.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start">
                                    <div class="position-relative me-2">
                                        <span class="user-status away"></span>
                                        <img src="${path}/Admin/dist/assets/images/users/avatar-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                    </div>
                                    <div class="flex-1 overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Hayley East</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">One could refuse to pay expensive translators.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <div class="text-center mt-3">
                                <a href="javascript:void(0);" class="btn btn-sm btn-white">
                                    <i class="mdi mdi-spin mdi-loading me-2"></i>
                                    Load more
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane" id="tasks-tab" role="tabpanel">
                        <h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
                        <div class="px-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">App Development<span class="float-end">75%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Database Repair<span class="float-end">37%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Backup Create<span class="float-end">52%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 52%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium px-3 mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

                        <div class="p-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Sales Reporting<span class="float-end">12%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Redesign Website<span class="float-end">67%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">New Admin Design<span class="float-end">84%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 84%" aria-valuenow="84" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <div class="d-grid p-3 mt-2">
                            <a href="javascript: void(0);" class="btn btn-success waves-effect waves-light">Create Task</a>
                        </div>

                    </div>
                    <div class="tab-pane active" id="settings-tab" role="tabpanel">
                        <h6 class="fw-medium px-3 m-0 py-2 font-13 text-uppercase bg-light">
                            <span class="d-block py-1">Theme Settings</span>
                        </h6>

                        <div class="p-3">
                            <div class="alert alert-warning" role="alert">
                                <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
                            </div>

                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="color-scheme-mode" value="light" id="light-mode-check" checked>
                                <label class="form-check-label" for="light-mode-check">Light Mode</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="color-scheme-mode" value="dark" id="dark-mode-check">
                                <label class="form-check-label" for="dark-mode-check">Dark Mode</label>
                            </div>

                            <!-- Width -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Width</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="width" value="fluid" id="fluid-check" checked>
                                <label class="form-check-label" for="fluid-check">Fluid</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="width" value="boxed" id="boxed-check">
                                <label class="form-check-label" for="boxed-check">Boxed</label>
                            </div>
                   

                            <!-- Topbar -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="topbar-color" value="dark" id="darktopbar-check" checked>
                                <label class="form-check-label" for="darktopbar-check">Dark</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="topbar-color" value="light" id="lighttopbar-check">
                                <label class="form-check-label" for="lighttopbar-check">Light</label>
                            </div>


                            <!-- Menu positions -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Menus Positon <small>(Leftsidebar and Topbar)</small></h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="menus-position" value="fixed" id="fixed-check" checked>
                                <label class="form-check-label" for="fixed-check">Fixed</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="menus-position" value="scrollable" id="scrollable-check">
                                <label class="form-check-label" for="scrollable-check">Scrollable</label>
                            </div>


                            <!-- Left Sidebar-->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Left Sidebar Color</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="light" id="light-check" checked>
                                <label class="form-check-label" for="light-check">Light</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="dark" id="dark-check">
                                <label class="form-check-label" for="dark-check">Dark</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="brand" id="brand-check">
                                <label class="form-check-label" for="brand-check">Brand</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-color" value="gradient" id="gradient-check">
                                <label class="form-check-label" for="gradient-check">Gradient</label>
                            </div>
                    

                            <!-- size -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Left Sidebar Size</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-size" value="default" id="default-size-check" checked>
                                <label class="form-check-label" for="default-size-check">Default</label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-size" value="condensed" id="condensed-check">
                                <label class="form-check-label" for="condensed-check">Condensed <small>(Extra Small size)</small></label>
                            </div>

                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-size" value="compact" id="compact-check">
                                <label class="form-check-label" for="compact-check">Compact <small>(Small size)</small></label>
                            </div>
                    

                            <!-- User info -->
                            <h6 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User Info</h6>
                            <div class="form-check form-switch mb-1">
                                <input class="form-check-input" type="checkbox" name="leftsidebar-user" value="fixed" id="sidebaruser-check">
                                <label class="form-check-label" for="sidebaruser-check">Enable</label>
                            </div>

                            <div class="d-grid mt-4">
                                <button class="btn btn-primary" id="resetBtn">Reset to Default</button>

                            <a href="https://wrapbootstrap.com/theme/minton-admin-dashboard-landing-template-WB0858DB6?ref=coderthemes"
                                class="btn btn-danger mt-2" target="_blank"><i class="mdi mdi-basket me-1"></i> Purchase Now</a>
                            </div>

                        </div>

                    </div>
                </div>

            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="${path}/Admin/dist/assets/js/vendor.min.js"></script>

        <!-- Plugins js-->
        <script src="${path}/Admin/dist/assets/libs/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>

        <!-- Plugins js -->
        <script src="${path}/Admin/dist/assets/libs/quill/quill.min.js"></script>

        <!-- Select2 js-->
        <script src="${path}/Admin/dist/assets/libs/select2/js/select2.min.js"></script>
        <!-- Dropzone file uploads-->
        <script src="${path}/Admin/dist/assets/libs/dropzone/min/dropzone.min.js"></script>

        <!-- Init js-->
        <script src="${path}/Admin/dist/assets/js/pages/form-fileuploads.init.js"></script>

        <!-- Init js -->
        <script src="${path}/Admin/dist/assets/js/pages/add-product.init.js"></script>

        <!-- App js -->
        <script src="${path}/Admin/dist/assets/js/app.min.js"></script>
        
    </body>
</html>