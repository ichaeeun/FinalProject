<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
	<body> 
	    <div class="row mb-2">
	        <div class="col-sm-4">
	            <a href="javascript:void(0);" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-1"></i> Add Sellers</a>
	        </div>
	        <div class="col-sm-8">
	            <div class="float-sm-end">
	                <form class="d-flex flex-wrap align-items-center">
	                    <div class="d-flex flex-wrap align-items-center me-2">
	                        <label for="sellersearch-input" class="visually-hidden">Search</label>
	                        <input type="search" class="form-control" id="sellersearch-input" placeholder="Search...">
	                    </div>
	                    <button type="button" class="btn btn-success mb-2 mb-sm-0"><i class="mdi mdi-cog"></i></button>
	                </form>
	                
	            </div>
	        </div><!-- end col-->
	    </div>
	    <!-- end row -->
	
	    <div class="row">
	        
	        <div class="col-lg-6">
	            <div class="card">
	                <div class="card-body">
	                    <div class="d-flex align-items-start">
	                        <div class="avatar-md me-3">
	                            <div class="avatar-title bg-light rounded text-body font-20 fw-semibold">
	                                H
	                            </div>
	                        </div>
	                        <div class="flex-1">
	                            <h5 class="my-1"><a href="javascript:void(0);" class="text-dark">Homovee</a></h5>
	                            <p class="text-muted mb-0">
	                                <i class="mdi mdi-account me-1"></i> Charles Garcia
	                            </p>
	                        </div>
	                        <div class="dropdown">
	                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="mdi mdi-dots-vertical font-20"></i>
	                            </a>
	                          
	                            <div class="dropdown-menu dropdown-menu-end">
	                              <a class="dropdown-item" href="#">Action</a>
	                              <a class="dropdown-item" href="#">Another action</a>
	                              <a class="dropdown-item" href="#">Something else here</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
	                    <div class="text-muted">
	                        <div class="row">
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Products</p>
	                                    <h5 class="mb-sm-0">125</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Wallet Balance</p>
	                                    <h5 class="mb-sm-0">$126,562</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div class="mt-3 mt-sm-0">
	                                    <p class="mb-0">Revenue</p>
	                                    <h5 class="mb-0">$235.16k</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-6">
	            <div class="card">
	                <div class="card-body">
	                    <div class="d-flex align-items-start">
	                        <div class="me-3">
	                            <img src="${path}/Admin/dist/assets/images/users/avatar-3.jpg" alt="user-image" class="rounded avatar-md">
	                        </div>
	                        <div class="flex-1">
	                            <h5 class="my-1"><a href="javascript:void(0);" class="text-dark">Execucy</a></h5>
	                            <p class="text-muted mb-0">
	                                <i class="mdi mdi-account me-1"></i> Nicholas Watkins
	                            </p>
	                        </div>
	                        <div class="dropdown">
	                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="mdi mdi-dots-vertical font-20"></i>
	                            </a>
	                          
	                            <div class="dropdown-menu dropdown-menu-end">
	                              <a class="dropdown-item" href="#">Action</a>
	                              <a class="dropdown-item" href="#">Another action</a>
	                              <a class="dropdown-item" href="#">Something else here</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
	                    <div class="text-muted">
	                        <div class="row">
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Products</p>
	                                    <h5 class="mb-sm-0">125</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Wallet Balance</p>
	                                    <h5 class="mb-sm-0">$84,235</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div class="mt-3 mt-sm-0">
	                                    <p class="mb-0">Revenue</p>
	                                    <h5 class="mb-0">$196.08k</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- end row -->
	
	    <div class="row">
	        
	        <div class="col-lg-6">
	            <div class="card">
	                <div class="card-body">
	                    <div class="d-flex align-items-start">
	                        <div class="avatar-md me-3">
	                            <div class="avatar-title bg-light rounded text-body font-20 fw-semibold">
	                                E
	                            </div>
	                        </div>
	                        <div class="flex-1">
	                            <h5 class="my-1"><a href="javascript:void(0);" class="text-dark">Epiloo</a></h5>
	                            <p class="text-muted mb-0">
	                                <i class="mdi mdi-account me-1"></i> Jared Carroll
	                            </p>
	                        </div>
	                        <div class="dropdown">
	                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="mdi mdi-dots-vertical font-20"></i>
	                            </a>
	                          
	                            <div class="dropdown-menu dropdown-menu-end">
	                              <a class="dropdown-item" href="#">Action</a>
	                              <a class="dropdown-item" href="#">Another action</a>
	                              <a class="dropdown-item" href="#">Something else here</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
	                    <div class="text-muted">
	                        <div class="row">
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Products</p>
	                                    <h5 class="mb-sm-0">96</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Wallet Balance</p>
	                                    <h5 class="mb-sm-0">$124,250</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div class="mt-3 mt-sm-0">
	                                    <p class="mb-0">Revenue</p>
	                                    <h5 class="mb-0">$201.04k</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-6">
	            <div class="card">
	                <div class="card-body">
	                    <div class="d-flex align-items-start">
	                        <div class="avatar-md me-3">
	                            <div class="avatar-title bg-light rounded text-body font-20 fw-semibold">
	                                U
	                            </div>
	                        </div>
	                        <div class="flex-1">
	                            <h5 class="my-1"><a href="javascript:void(0);" class="text-dark">Uberer</a></h5>
	                            <p class="text-muted mb-0">
	                                <i class="mdi mdi-account me-1"></i> Gregory Secrest
	                            </p>
	                        </div>
	                        <div class="dropdown">
	                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="mdi mdi-dots-vertical font-20"></i>
	                            </a>
	                          
	                            <div class="dropdown-menu dropdown-menu-end">
	                              <a class="dropdown-item" href="#">Action</a>
	                              <a class="dropdown-item" href="#">Another action</a>
	                              <a class="dropdown-item" href="#">Something else here</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
	                    <div class="text-muted">
	                        <div class="row">
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Products</p>
	                                    <h5 class="mb-sm-0">84</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Wallet Balance</p>
	                                    <h5 class="mb-sm-0">$74,236</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div class="mt-3 mt-sm-0">
	                                    <p class="mb-0">Revenue</p>
	                                    <h5 class="mb-0">$175.12k</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- end row -->
	
	    <div class="row">
	        
	        <div class="col-lg-6">
	            <div class="card">
	                <div class="card-body">
	                    <div class="d-flex align-items-start">
	                        <div class="me-3">
	                            <img src="${path}/Admin/dist/assets/images/users/avatar-4.jpg" alt="user-image" class="rounded avatar-md">
	                        </div>
	                        <div class="flex-1">
	                            <h5 class="my-1"><a href="javascript:void(0);" class="text-dark">Symic</a></h5>
	                            <p class="text-muted mb-0">
	                                <i class="mdi mdi-account me-1"></i> Leticia Cane
	                            </p>
	                        </div>
	                        <div class="dropdown">
	                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="mdi mdi-dots-vertical font-20"></i>
	                            </a>
	                          
	                            <div class="dropdown-menu dropdown-menu-end">
	                              <a class="dropdown-item" href="#">Action</a>
	                              <a class="dropdown-item" href="#">Another action</a>
	                              <a class="dropdown-item" href="#">Something else here</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
	                    <div class="text-muted">
	                        <div class="row">
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Products</p>
	                                    <h5 class="mb-sm-0">134</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Wallet Balance</p>
	                                    <h5 class="mb-sm-0">$92,237</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div class="mt-3 mt-sm-0">
	                                    <p class="mb-0">Revenue</p>
	                                    <h5 class="mb-0">$172.24k</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-6">
	            <div class="card">
	                <div class="card-body">
	                    <div class="d-flex align-items-start">
	                        <div class="me-3">
	                            <img src="${path}/Admin/dist/assets/images/users/avatar-5.jpg" alt="user-image" class="rounded avatar-md">
	                        </div>
	                        <div class="flex-1">
	                            <h5 class="my-1"><a href="javascript:void(0);" class="text-dark">Vicedel</a></h5>
	                            <p class="text-muted mb-0">
	                                <i class="mdi mdi-account me-1"></i> Tyler Smith
	                            </p>
	                        </div>
	                        <div class="dropdown">
	                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="mdi mdi-dots-vertical font-20"></i>
	                            </a>
	                          
	                            <div class="dropdown-menu dropdown-menu-end">
	                              <a class="dropdown-item" href="#">Action</a>
	                              <a class="dropdown-item" href="#">Another action</a>
	                              <a class="dropdown-item" href="#">Something else here</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
	                    <div class="text-muted">
	                        <div class="row">
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Products</p>
	                                    <h5 class="mb-sm-0">56</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div>
	                                    <p class="mb-0">Wallet Balance</p>
	                                    <h5 class="mb-sm-0">$57,235</h5>
	                                </div>
	                            </div>
	                            <div class="col-sm-4 col-6">
	                                <div class="mt-3 mt-sm-0">
	                                    <p class="mb-0">Revenue</p>
	                                    <h5 class="mb-0">$162.52k</h5>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- end row -->
	
	    <div class="row">
	        <div class="col-lg-12">
	            <div>
	                <div class="text-center my-3">
	                    <a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-spin mdi-loading font-20 align-middle me-2"></i> Load more </a>
	                </div>
	            </div>
	        </div>
	    </div>
    </body>
</html>