<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<script type="text/javascript">
	
<%--
 
 
--%>
	//
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<h4 class="mb-4 mt-0 font-16">
		Comments(<span id="commentlength">${fn:length(comment) }</span>)
	</h4>
	<div class="clerfix"></div>
	<div id="appendComment">
		<jsp:useBean id="today" class="java.util.Date" />
		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var="todayDate" />
		<c:forEach var="comm" items="${comment }">
			<%-- 현재날짜의 고유값 가져오기 : 1970.1.1  --%>
			<%--     <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="toFmt"/>
										    <fmt:formatDate value="${comm.regdte }" pattern="yyyyMMdd" var="regdte"/> --%>
			<fmt:parseDate value="${comm.regdte }" pattern="yyyy-MM-dd HH:mm:ss"
				var="commregdte" />
			<fmt:formatDate value="${commregdte }" pattern="yyyy-MM-dd"
				var="commregdteDate" />
			<fmt:formatDate value="${commregdte }" pattern="HH:mm:ss"
				var="commregdteTime" />
			<div class="d-flex align-items-start mt-3">
				<%-- <img class="me-2 rounded-circle" src="${path }/Admin/dist/assets/images/users/avatar-2.jpg"
	                                                alt="Generic placeholder image" height="32"> --%>
				<div class="flex-1">
					<h5 class="mt-0">
						<i class=" bx bx-face"></i>&nbsp;${comm.name } <small
							class="text-muted fw-normal float-end"> <c:if
								test="${todayDate==commregdteDate}">${commregdteTime }</c:if> <c:if
								test="${todayDate!=commregdteDate }">${commregdteDate}</c:if> <c:if
								test="${mem.pno==comm.pno }">
								<div class="action-icon px-1" id="deleteComment">
									<i class="fe-x-square"></i>
								</div>
							</c:if></small>
					</h5>
					${comm.content } <br />
				</div>
				<br>
			</div>
		</c:forEach>
	</div>
</body>
</html>