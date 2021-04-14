<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<body>
 <table class="table table-centered  table-nowrap mb-0">
<thead class="table-light">
  <tr>
      <th scope="col">파일명</th>
      <th scope="col">업로드일</th>
      <th scope="col">담당자</th>
      <th scope="col" class="text-center" style="width: 90px;">다운로드</th>
      <th scope="col" class="text-center" style="width: 25px;">삭제</th>
  </tr> <!-- fileInfo -->
</thead>
<tbody>
<c:forEach var="file" items="${detail.fileInfo }">
	 <tr class="fileList">
       <td>
       	   <div class="text-dark fileName">${file.filename}</div>
           <%-- <a href="javascript:void(0);" class="text-dark">${file.filename}</a> --%>
       </td>
       <td class="font-13"><fmt:formatDate value="${file.upload_dte }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
           <td>
           	${file.name }
           </td>
           <td>
           	<div class="fileupload btn btn-info waves-effect waves-light mt-1">
			    <span id="downloadBtn"><i class="bx bx-download me-1"></i>Download</span>
			</div>
           </td>
           <td>
           	<a href="javascript:void(0);" class="action-icon px-1"><div data-bs-toggle="modal" data-bs-target="#deleteFileModal"> <i class="mdi mdi-delete"></i></a>
           </td>
       </tr>
   	</c:forEach>
  </tbody>
  </table>
</body>
</html>