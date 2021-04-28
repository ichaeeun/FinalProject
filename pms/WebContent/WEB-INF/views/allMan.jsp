<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
   $(document).ready(function(){
	   var mem = "${mem.id}";
	   if(mem==""){
			alert("세션이 만료되어 로그인화면으로 이동합니다.");
			location.href="${path}/main.do?method=loginform"; // 세션값 없을 때 바로 로그인폼 이동
		}
   });
</script>
</head>
<body>

                        	<form id="hiddenFrm" method="post">
                        		<input type="hidden" name="proc"/>
                        	</form>
                        	
                        
                        	<c:forEach var="mem" items="${memList1 }">
                            <div class="col-xl-3 col-sm-6">
                                <div class="text-center card">
                                    <div class="card-body">
                                        
                                        <div class="dropdown float-end">
                                            <a class="text-body dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical font-20"></i>
                                            </a>
                                            <!-- 일단 제외 -->
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                        <img src="${path }/Admin/dist/assets/images/users/avatar-3.jpg" class="rounded-circle img-thumbnail avatar-xl mt-1" alt="profile-image">
			                        	<!-- 일단 패스 -->
			                        	<form id="form-hidden">
			                        		<input type="hidden" name="pno" value="${mem.pno }"/>
			                        	</form>
                                        <h4 class="mt-3 mb-1"><a name="goDetail" class="text-dark">${mem.name }</a></h4>
                                        <p class="text-muted">${mem.auth } <span> | </span> 
                                        <span> <a href="#" class="text-pink">${mem.email }</a> </span></p>
                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col -->
                            </c:forEach>
                         
                                           


</body>
</html>