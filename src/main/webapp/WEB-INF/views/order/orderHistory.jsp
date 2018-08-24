<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Order History</title>


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




<!-- DatePicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

<!-- DatePicker -->

</head>
<body>


	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->



	<div class="breadcrumbs">
		<div class="col-sm-4">
			<div class="page-header float-left">
				<div class="page-title">
					<h1>Order History</h1>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="page-header float-right">
				<div class="page-title">
					<ol class="breadcrumb text-right">
						<li><a
							href="${pageContext.request.contextPath}/showOrderHistory"><spring:message
									code="label.orderHistory" /></a></li>

						<li class="active"></li>
					</ol>
				</div>
			</div>
		</div>
	</div>

	<div class="content mt-3">
		<div class="animated fadeIn">
			<div class="row">

				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title"><spring:message
									code="label.orderHistory" /></strong>
						</div>
						<div class="form-group"></div>
						<div class="form-group">

							<div class="col-lg-6">
								<spring:message code="label.date" />
								<input type="text" id="datepicker" />

							</div>


							<div class="form-group"></div>
							<div class="col-xs-6 col-sm-6">
								<label> <spring:message code="label.selectRoute" /></label>
								<div class="card">

									<div class="card-body">
										<select name="distId" id="distId" class="standardSelect"
											tabindex="1" required>
											<option value=""><spring:message
													code="label.selectDist" /></option>
											<c:forEach items="${distList}" var="distList">
												<option value="${distList.distId}">${distList.distEngName}
												</option>
											</c:forEach>
										</select>
										<!-- <select data-placeholder="Choose a Country...">
												<option value=""></option>

											</select> -->
									</div>
								</div>
							</div>

							<div class="col-lg-12" align="center">


								<button type="submit" class="btn btn-primary"
									style="align-content: center; width: 226px; margin-left: 80px;">
									<spring:message code="label.search" />
								</button>
							</div>
						</div>
						<div class="form-group"></div>
						<div class="form-group">
							<div class="col-lg-4">
								<div>
									<div class="input-group">
										<spring:message code="label.orderDate" />
										<input class="form-control" name="orderDate" id="orderDate"
											type="text" value="${editDist.distAmtPending}" required
											oninvalid="setCustomValidity('Please enter Date ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-4">

								<div>
									<div class="input-group">

										<spring:message code="label.orderDeliveryDate" />
										<input class="form-control" name="orderDeliveryDate"
											id="orderDeliveryDate" type="text"
											value="${editDist.distCratesLimit}" required
											oninvalid="setCustomValidity('Please enter crates limit ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-4">

								<div>



									<div class="input-group">
										<spring:message code="label.distCratesPending" />

										<input class="form-control" name="orderDate" id="orderDate"
											type="text" value="${editDist.distAmtPending}" required
											oninvalid="setCustomValidity('Please enter Date ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
						</div>



						<div class="form-group"></div>
						<div class="form-group">

							<div class="col-lg-4">

								<div>
									<div class="input-group">
										<spring:message code="label.distAmtPending" />
										<input class="form-control" name="orderDeliveryDate"
											id="orderDeliveryDate" type="text"
											value="${editDist.distCratesLimit}" required
											oninvalid="setCustomValidity('Please enter crates limit ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>




							<div class="col-lg-4">

								<div>



									<div class="input-group">
										<spring:message code="label.distCratesPending" />
										<input class="form-control" name="orderDate" id="orderDate"
											type="text" value="${editDist.distAmtPending}" required
											oninvalid="setCustomValidity('Please enter Date ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-4">

								<div>
									<div class="input-group">
										<spring:message code="label.amtReceived" />
										<input class="form-control" name="orderDeliveryDate"
											id="orderDeliveryDate" type="text"
											value="${editDist.distCratesLimit}" required
											oninvalid="setCustomValidity('Please enter crates limit ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"></div>
						<div class="form-group">
							<div class="col-lg-4">

								<div>
									<div class="input-group">
										<spring:message code="label.balanceAmt" />

										<input class="form-control" name="orderDate" id="orderDate"
											type="text" value="${editDist.distAmtPending}" required
											oninvalid="setCustomValidity('Please enter Date ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div>
									<div class="input-group">
										<spring:message code="label.orderTotal" />

										<input class="form-control" name="orderTotal" id="orderTotal"
											type="text" value="${editDist.distCratesLimit}" required
											oninvalid="setCustomValidity('Please enter crates limit ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
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