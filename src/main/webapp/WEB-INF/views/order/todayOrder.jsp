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
				<form action="${pageContext.request.contextPath}/editOrder"
					method="post">

					<div class="col-md-12">


						<div class="card">
							<div class="card-header">
								<strong class="card-title"><spring:message
										code="label.todaysOrder" /> : ${orderDate}</strong>
							</div>


							<div class="form-group"></div>
							<div class="form-group">
								<div class="col-lg-6">
									<div>
										<div class="input-group" style="align-items: center;">


											<spring:message code="label.distName" />
											&nbsp;
											<%-- 	<c:if test="${langSelected == 0}" var="name">
												<c:out value="${orderHeader.distEngName}" />

											</c:if>
											<c:if test="${langSelected == 1}" var="name">
												<c:out value="${orderHeader.distMarName}" />

											</c:if> --%>
											<input class="form-control" name="orderDate" id="orderDate"
												type="text" value="${orderHeader.distEngName}" disabled />


										</div>
									</div>
								</div>
								<div class="col-lg-6">

									<div>
										<div class="input-group" style="align-items: center;">

											<spring:message code="label.distContactNo" />
											&nbsp; <input class="form-control" name="orderDeliveryDate"
												id="orderDeliveryDate" type="text"
												value="${orderHeader.distContactNo}" disabled />

										</div>
									</div>
								</div>
							</div>
							<div class="form-group"></div>
							<div class="form-group">
								<div class="col-lg-6">

									<div>
										<div class="input-group" style="align-items: center;">
											<spring:message code="label.itemTotal" />
											&nbsp; <input class="form-control" name="orderDate"
												id="orderDate" type="text" value="${orderDetail.size()}"
												disabled /> <span class="error" aria-live="polite"></span>
										</div>
									</div>
								</div>
								<div class="col-lg-6">

									<div>
										<div class="input-group" style="align-items: center;">

											<spring:message code="label.orderTotal" />
											&nbsp; <input class="form-control" name="orderDeliveryDate"
												id="orderDeliveryDate" type="text"
												value="${orderHeader.orderTotal}" disabled />

										</div>
									</div>
								</div>

							</div>

							<div class="form-group"></div>
							<div class="form-group">
								<div class="col-lg-6">

									<div>
										<div class="input-group" style="align-items: center;">
											<spring:message code="label.distCratesPending" />
											&nbsp; <input class="form-control" name="orderDate"
												id="orderDate" type="text"
												value="${orderHeader.prevPendingCrateBal}" disabled /> <span
												class="error" aria-live="polite"></span>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div>
										<div class="input-group" style="align-items: center;">


											<spring:message code="label.distAmtPending" />
											&nbsp; <input class="form-control" name="orderDate"
												id="orderDate" type="text"
												value="${orderHeader.prevPendingAmt}" disabled />

										</div>
									</div>
								</div>

							</div>


						</div>
					</div>

					<div class="col-md-12">
						<div class="card">

							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th><spring:message code="label.srNo" /></th>
											<th><spring:message code="label.itemName" /></th>
											<th><spring:message code="label.wt" /></th>
											<th><spring:message code="label.uom" /></th>
											<th><spring:message code="label.itemRate" /></th>
											<th><spring:message code="label.hubQty" /></th>
											<th><spring:message code="label.item" /></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${orderDetail}" var="orderDetail"
											varStatus="count">
											<tr>

												<td><c:out value="${count.index+1}" /></td>

												<td><c:if test="${langSelected == 0}">
														<c:out value="${orderDetail.itemEngName}" />

													</c:if> <c:if test="${langSelected == 1}">
														<c:out value="${orderDetail.itemMarName}" />

													</c:if></td>
												<td><c:out value="${orderDetail.itemWt}" /></td>

												<td><c:out value="${orderDetail.uomName}" /></td>
												<td><c:out value="${orderDetail.itemRate}" /></td>
												<td><input class="form-control"
													id="hubQty${orderDetail.orderDetailId}"
													placeholder="hub Qty" type="text"
													name="hubQty${orderDetail.orderDetailId}"
													value="${orderDetail.hubQty}"></td>
												<td><input class="form-control"
													id="itemTotal${orderDetail.orderDetailId}"
													placeholder="Item Total" type="text"
													name="itemTotal${orderDetail.orderDetailId}"
													value="${orderDetail.itemTotal}" readonly /></td>


											</tr>
										</c:forEach>

									</tbody>

								</table>
							</div>
						</div>

					</div>
					<div class="col-lg-12" align="center">


						<button type="submit" class="btn btn-primary"
							style="align-content: center; width: 226px; margin-left: 80px;">
							<spring:message code="label.submit" />
						</button>
					</div>


				</form>
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
	<script>
		function check(qty, key, rate) {

			var tot = rate * qty;
			document.getElementById("itemTotal" + key).value = tot;

		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
</body>
</html>