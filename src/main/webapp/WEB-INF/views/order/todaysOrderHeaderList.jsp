<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>View Todays Order</title>


<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/apple-icon.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


</head>
<body>


	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->


	<div class="content mt-3">
		<div class="animated fadeIn">
			<div class="row">

				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title"><spring:message
									code="label.todaysOrder" />: ${orderDate}</strong>
						</div>
						<div class="card-body">
							<table id="bootstrap-data-table"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th><spring:message code="label.srNo" /></th>
										<th><spring:message code="label.distName" /></th>
										<th><spring:message code="label.distCratesPending" /></th>
										<th><spring:message code="label.distAmtPending" /></th>
										<th><spring:message code="label.orderTotal" /></th>
										<th><spring:message code="label.action" /></th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${orderList}" var="orderList"
										varStatus="count">
										<tr>

											<td><c:out value="${count.index+1}" /></td>

											<td><c:if test="${langSelected == 0}">
													<c:out value="${orderList.distEngName}" />

												</c:if> <c:if test="${langSelected == 1}">
													<c:out value="${orderList.distMarName}" />

												</c:if></td>
											<%-- <td><c:choose>
													<c:when test="${hubUserList.isAdmin==1}">
														<spring:message code="label.admin" />
													</c:when>
													<c:when test="${hubUserList.isAdmin==0}">
														<spring:message code="label.staff" />
													</c:when>
												</c:choose></td> --%>


											<td align="right"><c:out value="${orderList.prevPendingCrateBal}" /></td>

											<td align="right"><c:out value="${orderList.prevPendingAmt}" /></td>
											<td align="right"><c:out value="${orderList.orderTotal}" /></td>
											<td>
												<div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/showTodayOrder/${orderList.orderHeaderId}"><i
														class="fa  fa-stack-exchange"></i> <span
														class="text-muted"></span></a>
												</div>
											</td>

										</tr>
									</c:forEach>

								</tbody>

							</table>
						</div>
					</div>
				</div>


			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->





	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Footer -->





	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables-init.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>


</body>
</html>