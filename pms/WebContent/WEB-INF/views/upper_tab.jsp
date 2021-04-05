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
<script type="text/javascript">
<%--
 
 
--%>
//
</script>
</head>
<body>
<div class="row">
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
                <a href="#"  class="nav-link">
                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-account"></i></span>
                    <span class="d-none d-sm-inline-block">대시보드</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${path}/main.do?method=gantt"  class="nav-link">
                    <span class="d-inline-block d-sm-none"><i class="mdi mdi-email-variant"></i></span>
                    <span class="d-none d-sm-inline-block">간트차트</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#"  class="nav-link">
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
</body>
</html>