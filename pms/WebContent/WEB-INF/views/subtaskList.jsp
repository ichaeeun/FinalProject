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
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
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
							&nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
					</tr>
				</thead>
				<tbody id="subtaskTableBody">
					<c:forEach var="sub" items="${subdetail }">
						<tr class="upt">
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="tasktodayCheck${sub.task_no }">
									<div id="subtaskId">
										<label class="form-check-label"
											for="tasktodayCheck${sub.task_no }"><div class="task_no">${sub.task_no }</div></label>
									</div>
								</div>
							</td>
							<td id="subtaskName" class="task_name">${sub.task_name }</td>
							<input type="hidden" class="pno" value="${sub.pno }">
							<td id="subtaskpName" class="name">${sub.name }</td>
							<input type="hidden" class="startdte" value="${sub.startdte }"/>
							<td class="enddte">${sub.enddte }</td>
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
										class="action-icon px-1"><div class="updatesub">
												<i class="mdi mdi-square-edit-outline"></i>
											</div></a></li>
									<li class="list-inline-item"><a href="javascript:void(0);"
										class="action-icon px-1 text-danger">
											<div class="deletesub">
												<i class='mdi mdi-delete-outline me-1'></i>
											</div>
									</a></li>
								</ul>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%-- <!--  서브태스크 수정 모달  -->
	<c:forEach var="sub" items="${subdetail }">
		<form method="post" action="${path }/taskdetail.do?method=updateSub">
			<div class="modal fade" id="updateSubtaskModal${sub.task_no}"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myLargeModalLabel">[#${sub.task_no}]
								태스크 수정</h4>
							<input type="hidden" value="${sub.task_no }"
								id="updateSub_task_no${sub.task_no}" name="task_no" /> <input
								type="hidden" value="${detail.task_no }"
								id="updateSub_task_parent_no${sub.task_no}"
								name="task_parent_no" />
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="mb-3">
										<label for="updateSubtask_task_name" class="form-label">태스크</label>
										<input type="text" class="form-control" name="task_name"
											id="updateSub_task_name${sub.task_no}"
											value="${sub.task_name }">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="mb-3">
										<label for="updateSubtask_name" class="form-label">담당자</label>
										<select class="form-control" id="updateSub_name${sub.task_no}"
											name="pno">
											<option value="${sub.pno}">${sub.name}</option>
											<c:forEach var="showm" items="${showMember }">
												<option value="${showm.pno }">${showm.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label for="updateSubtask_task_priority" class="form-label">중요도</label>
										<select class="form-control"
											id="updateSub_task_priority${sub.task_no}"
											name="task_priority">
											<option value="High"
												<c:if test="${sub.task_priority=='High'}">selected</c:if>>High</option>
											<option value="Medium"
												<c:if test="${sub.task_priority=='Medium'}">selected</c:if>>Medium</option>
											<option value="Low"
												<c:if test="${sub.task_priority=='Low'}">selected</c:if>>Low</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label for="updateSubtask_startdte" class="form-label">시작일</label>
										<input type="date" class="form-control" name="startdte"
											id="updateSub_startdte${sub.task_no}" value="${sub.startdte}">
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label for="updateSubtask_enddte" class="form-label">종료일</label>
										<input type="date" class="form-control" name="enddte"
											id="updateSub_enddte${sub.task_no}" value="${sub.enddte}">
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary waves-effect"
								data-bs-dismiss="modal">취소</button>
							data-bs-dismiss="modal"
							<input type="submit"
								class="btn btn-info waves-effect waves-light"
								id="updateSubtaskBtn${sub.task_no}" value="수정" />
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</form>
	</c:forEach> --%>
	<%-- <c:forEach var="sub" items="${subdetail }">
		<!-- 서브태스크 삭제 모달 -->
		<form method="post" action="${path }/taskdetail.do?method=deleteSub">
			<div id="deleteSubtask${sub.task_no }" class="modal fade"
				tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-danger">
						<div class="modal-body p-4">
							<input type="hidden" value="${sub.task_no }" name="task_no" /> <input
								type="hidden" value="${sub.task_parent_no }"
								name="task_parent_no" />
							<div class="text-center">
								<i class="bx bx-aperture h1 text-white"></i>
								<h4 class="mt-2 text-white">태스크 삭제</h4>
								<p class="mt-3 text-white">태스크를 삭제하시겠습니까?</p>
								data-bs-dismiss="modal" data-bs-target="#warning-alert-modal"
								<button type="submit" class="btn btn-light my-2"
									data-bs-toggle="modal">삭제</button>
								<button type="button" class="btn btn-secondary my-2"
									data-bs-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</form>
	</c:forEach> --%>
</body>
</html>
