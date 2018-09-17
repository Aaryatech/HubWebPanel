<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Distributorwise Report</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
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
									code="label.orderSearch" /></strong>
				 		</div>
						<div class="form-group"></div>
						<div class="row">

							<div class="col-md-2">
								<spring:message code="label.date" />

							</div>
							<div class="col-md-3">

								<input type="text" id="datepicker" />
							</div>
							
							
							<div class="col-md-2">
								<spring:message code="label.date" />

							</div>
							<div class="col-md-3">

								<input type="text" id="datepicker" />
							</div>
							
							</div>
							
							&nbsp;
								<div class="row">

							<div class="col-md-2">
								<spring:message code="label.selectDist" />

							</div>
							<spring:message code="label.selectDist" var="selectDist" />
							
							<div class="col-md-3">

									<select data-placeholder="${selectDist}" class="standardSelect"
										tabindex="1">
										<option value=""></option>

										<c:forEach items="${distList}" var="distList">
											<option value="${distList.distId}">${distList.distEngName}
										</option>
										</c:forEach>
									</select>

								</div>
								<div class="col-md-2"></div>

								<div class="col-md-3">

									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 150px; margin-left: 80px;">
										<spring:message code="label.search" />
									</button>&nbsp;
								</div>
							</div>

						</div>
						&nbsp;

						<div class="card">
							<div class="card-header">
								<strong class="card-title"><spring:message
										code="label.orderHistory" /></strong>
							</div>
						

							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">

									<thead>
										<tr>
											<th><spring:message code="label.srNo" /></th>
											<th><spring:message code="label.orderDate" /></th>
											<th><spring:message code="label.orderDeliveryDate" /></th>
											<th><spring:message code="label.distCratesPending" /></th>
											<th><spring:message code="label.distAmtPending" /></th>

											<th><spring:message code="label.distCratesLimit" /></th>

											<th><spring:message code="label.distAmtLimit" /></th>

											<th><spring:message code="label.hsContactNo" /></th>


											<th><spring:message code="label.action" /></th>
										</tr>
									</thead>
									<%-- 	<tbody>

									<c:forEach items="${hubUserList}" var="hubUserList"
										varStatus="count">
										<tr>

											<td><c:out value="${count.index+1}" /></td>

											<td><c:if test="${langSelected == 0}">
													<c:out value="${hubUserList.hsEngName}" />

												</c:if> <c:if test="${langSelected == 1}">
													<c:out value="${hubUserList.hsMarName}" />

												</c:if></td>
											<td><c:choose>
													<c:when test="${hubUserList.isAdmin==1}">
														<spring:message code="label.admin" />
													</c:when>
													<c:when test="${hubUserList.isAdmin==0}">
														<spring:message code="label.staff" />
													</c:when>
												</c:choose></td>


											<td><c:out value="${hubUserList.hsContactNo}" /></td>
											<td>
												<div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/editHubUser/${hubUserList.hsId}"><i
														class="fa fa-edit"></i> <span class="text-muted"></span></a>
												</div>

												<div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/deleteHubUser/${hubUserList.hsId}"
														onClick="return confirm('Are you sure want to delete this record');"><i
														class="fa fa-trash-o"></i></a>
												</div>
											</td>

										</tr>
									</c:forEach>

								</tbody> --%>

								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
			</div>
			<!-- .animated -->
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

		<script
			src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

		<script>
			jQuery(document).ready(function() {
				jQuery(".standardSelect").chosen({
					disable_search_threshold : 2,
					no_results_text : "Oops, nothing found!",
					width : "100%"
				});
			});
		</script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#bootstrap-data-table-export').DataTable();
			});
		</script>


		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		$(function() {
			$('input[id$=datepicker]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
</body>
</html>