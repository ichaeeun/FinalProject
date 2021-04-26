<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<%-- <script src="${path}/a00_com/jquery.min.js"></script> --%>
</head>
<style>
.done_line{
text-decoration:line-through;
}
</style>
<body>
<div id="real">
	<h5 class="position-relative mb-0">
		<a href="#taskcollapse1" class="text-dark d-block"
			data-bs-toggle="collapse">서브태스크 <span class="text-muted">(<c:if
					test="${fn:length(subdetail)<10}">0</c:if><span id="sublength">${fn:length(subdetail)}</span>)
		</span> <i class="mdi mdi-chevron-down accordion-arrow"></i></a>
	</h5>
	<div class="collapse show" id="taskcollapse1">
		<div class="table-responsive mt-3">
			<table
				class="table table-centered table-nowrap table-borderless table-sm">
				<thead class="table-light">
					<tr class="">
						<th scope="col">
							<div class="form-check">
								<!-- <input class="form-check-input" type="checkbox" id="tasktodayCheck"> -->
								<label class="form-check-label" for="tasktodayCheck">태스크ID</label>
							</div>
						</th>
						<th scope="col">태스크</th>
						<th scope="col">담당자</th>
						<th scope="col">기한</th>
						<th scope="col">중요도</th>
						<th scope="col" style="width: 85px;">
							&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
					</tr>
				</thead>
				<tbody id="subtaskTableBody">
					<c:forEach var="sub" items="${subdetail }">
						<tr class="upt">
							<td>
								<div class="form-check">
									<input type="hidden" class="task_status" value="${sub.task_status }"/>
									<input class="form-check-input" type="checkbox"
										id="tasktodayCheck" <c:if test="${detail.task_status=='완료'||!(mem.pno==sub.pno || mem.auth=='pm')}">disabled</c:if> <c:if test="${sub.task_status=='완료' }">checked</c:if>>
									<div id="subtaskId">
										<label class="form-check-label"
											for="tasktodayCheck"><div class="task_no">${sub.task_no }</div></label>
									</div>
								</div>
							</td>
							<td id="subtaskName" class="task_name <c:if test="${sub.task_status=='완료' }">done_line</c:if>">${sub.task_name }</td>
							<input type="hidden" class="pno" value="${sub.pno }">
							<td id="subtaskpName" class="name">${sub.name }</td>
							<input type="hidden" class="startdte" value="${fn:substring(sub.startdte,0,10)}"/>
							<td class="enddte">${fn:substring(sub.enddte,0,10)}</td>
							<td ><c:if test="${sub.task_priority=='High' }">
									<span class="badge badge-soft-danger p-1 task_priority" id="subtaskPriority">${sub.task_priority }</span>
								</c:if> <c:if test="${sub.task_priority=='Medium' }">
									<span class="badge badge-soft-primary p-1 task_priority" id="subtaskPriority">${sub.task_priority }</span>
								</c:if> <c:if test="${sub.task_priority=='Low' }">
									<span class="badge badge-soft-success p-1 task_priority" id="subtaskPriority">${sub.task_priority }</span>
								</c:if></td>
							<td>
								<ul class="list-inline table-action m-0">
									<li class="list-inline-item"><a href="javascript:void(0);"
										class="action-icon px-1"><button class="btn action-icon px-1 updatesub <c:if test="${!(sub.pno==mem.pno || mem.auth=='pm') }">disabled</c:if>">
												<i class="mdi mdi-square-edit-outline"></i>
											</button></a></li>
									<li class="list-inline-item"><a href="javascript:void(0);"
										class="action-icon px-1 text-danger">
											<button class="btn action-icon px-1 text-danger deletesub <c:if test="${!(sub.pno==mem.pno || mem.auth=='pm')||detail.task_status=='완료' }">disabled</c:if>">
												<i class='mdi mdi-delete-outline me-1'></i>
											</button>
									</a></li>
								</ul>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
