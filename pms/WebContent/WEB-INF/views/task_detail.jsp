<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jsexp.z01_vo.*"
    import="jsexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Task Detail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${path}/Admin/dist/assets/images/favicon.ico">

        <!-- Plugins css -->
        <link href="${path}/Admin/dist/assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />

		<!-- App css -->
		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

		<link href="${path}/Admin/dist/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
		<link href="${path}/Admin/dist/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

		<!-- icons -->
		<link href="${path}/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

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

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box page-title-box-alt">
                                    <h4 class="page-title">할일제목</h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Main</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">TasksList</a></li>
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
                                                    <i class='mdi mdi-attachment me-1'></i>첨부파일
                                                </a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <i class='mdi mdi-pencil-outline me-1'></i>수정
                                                </a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <i class='mdi mdi-content-copy me-1'></i>중요 할일
                                                </a>
                                                <div class="dropdown-divider"></div>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item text-danger">
                                                    <i class='mdi mdi-delete-outline me-1'></i>삭제
                                                </a>
                                            </div>
                                        </div>
                                        <p class="text-primary">태스크 ID</p>
                                        <h4 class="mb-1">태스크명</h4>
                                        <p class="text-muted mb-1">태스크 설명</p>

                                        <div class="text-muted">
                                             <div class="row">
                                                <div class="col-lg-4 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <i class="ri-hashtag h2 m-0 text-muted"></i>
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">Task ID</p>
                                                            <h5 class="mt-0 text-truncate">
                                                                #MN2048
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-6">
                                                    <div class="d-flex align-items-start mt-3">
                                                        <div class="me-2 align-self-center">
                                                            <img src="${path}/Admin/dist/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded-circle">
                                                        </div>
                                                        <div class="flex-1 overflow-hidden">
                                                            <p class="mb-1">태스크 책임자</p>
                                                            <h5 class="mt-0 text-truncate">
                                                                Darnell McCormick
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
                                                            <p class="mb-1">마감기한</p>
                                                            <h5 class="mt-0 text-truncate">
                                                                Today 10am
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>
                                        </div>

                                        <div class="mt-4">
                                            <div>
                                                <h5>Overview:</h5>
                                                <p class="text-muted">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer. Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                                <div class="mt-3">
                                                    <h5>Tags :</h5>
                                                    <div>
                                                        <a href="#" class="badge badge-soft-primary p-1 m-1">Photoshop</a>
                                                        <a href="#" class="badge badge-soft-primary p-1 m-1">Html</a>
                                                        <a href="#" class="badge badge-soft-primary p-1 m-1">Css</a>
                                                        <a href="#" class="badge badge-soft-primary p-1 m-1">Bootstrap</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mt-4">
                                                <h5>Checklists/Sub-tasks</h5>
                                                <div class="form-check mt-1">
                                                    <input class="form-check-input" type="checkbox" id="checklistcheck01">
                                                    <label class="form-check-label strikethrough" for="checklistcheck01">
                                                        Find out the old contract documents
                                                    </label>
                                                </div>

                                                <div class="form-check mt-1">
                                                    <input class="form-check-input" type="checkbox" id="checklistcheck02">
                                                    <label class="form-check-label strikethrough" for="checklistcheck02">
                                                        Organize meeting sales associates to understand need in detail
                                                    </label>
                                                </div>

                                                <div class="form-check mt-1">
                                                    <input class="form-check-input" type="checkbox" id="checklistcheck03">
                                                    <label class="form-check-label strikethrough" for="checklistcheck03">
                                                        Make sure to cover every small details
                                                    </label>
                                                </div>
        
                                                <!-- end sub tasks/checklists -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

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
                                                    <i class='mdi mdi-attachment me-1'></i>Attachment
                                                </a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <i class='mdi mdi-pencil-outline me-1'></i>Edit
                                                </a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">
                                                    <i class='mdi mdi-content-copy me-1'></i>Mark as Duplicate
                                                </a>
                                                <div class="dropdown-divider"></div>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item text-danger">
                                                    <i class='mdi mdi-delete-outline me-1'></i>Delete
                                                </a>
                                            </div> <!-- end dropdown menu-->
                                        </div> <!-- end dropdown-->
                                        <h5 class="header-title mb-3">Attachments</h5>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div>
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
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                 <div class="mt-4 mt-md-0">
                                                    <div class="card border mb-2">
                                                        <div class="p-2">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto">
                                                                    <div class="avatar-sm">
                                                                        <span class="avatar-title badge-soft-primary text-primary rounded">
                                                                            ZIP
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col ps-0">
                                                                    <a href="javascript:void(0);" class="text-muted fw-semibold">Minton-sketch-design.zip</a>
                                                                    <p class="mb-0 font-12">2.3 MB</p>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <!-- Button -->
                                                                    <a href="javascript:void(0);" class="btn btn-link font-16 text-muted">
                                                                        <i class="ri-download-2-line"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
            
                                                    <div class="card border mb-0">
                                                        <div class="p-2">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto">
                                                                    <div class="avatar-sm">
                                                                        <span class="avatar-title bg-secondary rounded text-light">
                                                                            .MP4
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col ps-0">
                                                                    <a href="javascript:void(0);" class="text-muted fw-semibold">Admin-bug-report.mp4</a>
                                                                    <p class="mb-0 font-12">7.05 MB</p>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <!-- Button -->
                                                                    <a href="javascript:void(0);" class="btn btn-link font-16 text-muted">
                                                                        <i class="ri-download-2-line"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Preview -->
                                                    <div class="dropzone-previews mt-2" id="file-previews"></div>

                                                 </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-4">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="float-end">
                                            <select class="form-select form-select-sm ">
                                                <option selected="">최근순</option>
                                                <option value="1">중요도순</option>           
                                            </select>
                                        </div> <!-- end dropdown-->

                                        <h4 class="mb-4 mt-0 font-16">댓글들 (51)</h4>

                                        <div class="clerfix"></div>
                                        
                                        <div class="d-flex">
                                            <img class="me-2 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-3.jpg"
                                                alt="Generic placeholder image" height="32">
                                            <div class="flex-1">
                                                <h5 class="mt-0">Barry Gould <small class="text-muted fw-normal float-end">5 hours ago</small></h5>
                                                Nice work, makes me think of The Money Pit.

                                                <br/>
                                                <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2"><i
                                                    class="mdi mdi-reply"></i> 대댓글</a>

                                                <div class="d-flex align-items-start mt-3">
                                                    <a class="pe-2" href="#">
                                                        <img src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" class="rounded-circle"
                                                            alt="Generic placeholder image" height="32">
                                                    </a>
                                                    <div class="flex-1">
                                                        <h5 class="mt-0">Louis Hill <small class="text-muted fw-normal float-end">3 hours ago</small></h5>
                                                        i'm in the middle of a timelapse animation myself! (Very different though.) Awesome stuff.

                                                        <br/>
                                                        <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2">
                                                            <i class="mdi mdi-reply"></i> 대댓글
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-start mt-3">
                                            <img class="me-2 rounded-circle" src="${path}/Admin/dist/assets/images/users/avatar-5.jpg"
                                                alt="Generic placeholder image" height="32">
                                            <div class="flex-1">
                                                <h5 class="mt-0">Aaron Wilson <small class="text-muted fw-normal float-end">1 day ago</small></h5>
                                                It would be very nice to have.

                                                <br/>
                                                <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2"><i
                                                    class="mdi mdi-reply"></i> 대댓글</a>
                                            </div>
                                        </div>

                                        <div class="text-center mt-2">
                                            <a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-spin mdi-loading me-1"></i> Load more </a>
                                        </div>

                                        <div class="border rounded mt-4">
                                            <form action="#" class="comment-area-box">
                                                <textarea rows="3" class="form-control border-0 resize-none" placeholder="댓글을 작성하세요${path}/Admin/dist"></textarea>
                                                <div class="p-2 bg-light d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <a href="#" class="btn btn-sm px-1 btn-light"><i class='mdi mdi-upload'></i></a>
                                                        <a href="#" class="btn btn-sm px-1 btn-light"><i class='mdi mdi-at'></i></a>
                                                    </div>
                                                    <button type="submit" class="btn btn-sm btn-success"><i class="fe-send me-1"></i>등록</button>
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

        <!-- Right Sidebar -->
        <jsp:include page="right.jsp"></jsp:include>
        <!-- /Right-bar -->

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
        
    </body>
</html>