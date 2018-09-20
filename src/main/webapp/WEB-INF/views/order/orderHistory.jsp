<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Order History</title>
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
	<c:url var="getOrderByDate" value="/getOrderByDate"></c:url>

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
						<div class="form-group">

							<div class="col-lg-4" align="center">
								<spring:message code="label.date" />
								<input type="text" id="date" name="date" />

							</div>


							<spring:message code="label.selectDist" var="selectDist" />

							<div class="col-lg-4" align="center">
								<select data-placeholder="${selectDist}" id="distId"
									name="distId" class="standardSelect" tabindex="1">
									<option value=""></option>

									<c:forEach items="${distList}" var="distList">

										<c:if test="${langSelected == 0}">
											<option value="${distList.distId}">${distList.distEngName}
											</option>
										</c:if>
										<c:if test="${langSelected == 1}">
											<option value="${distList.distId}">${distList.distMarName}
											</option>
										</c:if>

									</c:forEach>
								</select>

							</div>
							<div class="col-lg-2" align="center">


								<button type="button" class="btn btn-primary"
									onclick="callSearch()"
									style="align-content: center; width: 150px; margin-left: 80px;">
									<spring:message code="label.search" />
								</button>
							</div>
						</div>



					</div>




					<div class="card">
						<div class="card-header">
							<strong class="card-title"><spring:message
									code="label.orderHistory" /></strong>
						</div>
						<div class="form-group"></div>
						<div class="form-group">
							<div class="col-lg-4">
								<div>
									<div class="input-group" style="align-items: center;">


										<spring:message code="label.orderDate" />
										&nbsp; <input class="form-control" name="orderDate"
											id="orderDate" type="text" disabled />

									</div>
								</div>
							</div>
							<%-- <div class="col-lg-4">

								<div>
									<div class="input-group" style="align-items: center;">

										<spring:message code="label.orderDeliveryDate" />
										&nbsp; <input class="form-control" name="orderDeliveryDate"
											id="orderDeliveryDate" type="text" disabled />

									</div>
								</div>
							</div> --%>
							<div class="col-lg-4">
								<div>
									<div class="input-group" style="align-items: center;">
										<spring:message code="label.orderTotal" />
										&nbsp; <input class="form-control" name="orderTotal"
											id="orderTotal" type="text" disabled />

									</div>
								</div>
							</div>

						</div>



						<div class="form-group"></div>
						<div class="form-group">

							<div class="col-lg-3">

								<div>
									<div class="input-group" style="align-items: center;">
										<spring:message code="label.distCratesPending" />
										&nbsp; <input class="form-control" name="prevPendingCrateBal"
											id="prevPendingCrateBal" type="text" disabled /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>




							<div class="col-lg-3">

								<div>


									<div class="input-group" style="align-items: center;">
										<spring:message code="label.cratesIssued" />
										&nbsp; <input class="form-control" name="cratesIssued"
											id="cratesIssued" type="text" disabled /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-3">

								<div>
									<div class="input-group" style="align-items: center;">
										<spring:message code="label.cratesReceived" />
										&nbsp; <input class="form-control" name="cratesReceived"
											id="cratesReceived" type="text" disabled /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-3">

								<div>
									<div class="input-group" style="align-items: center;">
										<spring:message code="label.cratesBalance" />
										&nbsp; <input class="form-control" name="cratesBalance"
											id="cratesBalance" type="text" disabled /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group"></div>
						<div class="form-group">
							<div class="col-lg-3">

								<div>
									<div class="input-group" style="align-items: center;">
										<spring:message code="label.distAmtPending" />
										&nbsp; <input class="form-control" name="prevPendingAmt"
											id="prevPendingAmt" type="text" disabled /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
							</div>

							<div class="col-lg-3">

								<div>



									<div class="input-group" style="align-items: center;">
										<spring:message code="label.orderTotal" />
										&nbsp; <input class="form-control" name="orderTotal1"
											id="orderTotal1" type="text" disabled /> <span class="error"
											aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-3">

								<div>



									<div class="input-group" style="align-items: center;">
										<spring:message code="label.amtReceived" />
										&nbsp; <input class="form-control" name="amtReceived"
											id="amtReceived" type="text" disabled /> <span class="error"
											aria-live="polite"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-3">

								<div>
									<div class="input-group" style="align-items: center;">
										<spring:message code="label.amountBalanced" />
										&nbsp; <input class="form-control" name="amountBalanced"
											id="amountBalanced" type="text" disabled /> <span
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
										<th><spring:message code="label.itemName" /></th>
										<th><spring:message code="label.wt" /></th>
										<th><spring:message code="label.uom" /></th>
										<th><spring:message code="label.orderQty" /></th>
										<th><spring:message code="label.deliverQty" /></th>
										<th><spring:message code="label.item" /></th>
									</tr>
								</thead>


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

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>
	<script type="text/javascript">
		function callSearch() {
			alert("cxcgxc");
			var date = $("#date").val();
			var distId = $("#distId").val();

			$
					.getJSON(
							'${getOrderByDate}',

							{
								date : date,
								distId : distId,

								ajax : 'true'

							},
							function(data) {

								alert(data.getOrderDetailList);

								if (data == "") {
									alert("No records found !!");

								}

								document.getElementById("orderDate").value = data.orderDate;

								document.getElementById("orderTotal").value = data.orderTotal;
								document.getElementById("prevPendingCrateBal").value = data.prevPendingCrateBal;
								document.getElementById("cratesIssued").value = data.cratesIssued;
								document.getElementById("cratesReceived").value = data.cratesReceived;
								document.getElementById("cratesBalance").value = (data.prevPendingCrateBal
										+ data.cratesIssued - data.cratesReceived);

								document.getElementById("prevPendingAmt").value = data.prevPendingAmt;
								document.getElementById("orderTotal1").value = data.orderTotal;
								document.getElementById("amtReceived").value = data.amtReceived;
								document.getElementById("amountBalanced").value = (data.prevPendingAmt
										+ data.orderTotal - data.amtReceived);

								var dataTable = $('#bootstrap-data-table')
										.DataTable();
								$.each(data.getOrderDetailList, function(i, v) {
									dataTable.row
											.add(
													[ i + 1, v.itemEngName,
															v.itemWt,
															v.uomName,
															v.orderQty,
															v.deliverQty,
															v.itemTotal ])
											.draw();
								});

							});
		}
	</script>
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
			$('input[id$=date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>

</body>
</html>