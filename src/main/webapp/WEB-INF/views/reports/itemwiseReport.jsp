<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Itemwise Report</title>
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

	<c:url var="getItemByDate" value="/getItemByDate"></c:url>
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
									code="label.search" /></strong>
						</div>
						<div class="form-group"></div>
						<div class="form-group">

							<div class="col-md-2">
								<spring:message code="label.fromDate" />

							</div>
							<div class="col-md-3">

								<input type="text" id="fromDate" name="fromDate" />
							</div>


							<div class="col-md-2">
								<spring:message code="label.toDate" />

							</div>
							<div class="col-md-3">

								<input type="text" id="toDate" name="toDate" />
							</div>

						</div>
						<input type="hidden" id="langSelected" name="langSelected" />

					<div class="form-group"></div>
						<div class="form-group">

							<div class="col-md-2">
								<spring:message code="label.selectDist" />

							</div>
							<spring:message code="label.selectDist" var="selectDist" />

							<div class="col-md-3">

								<select id="distIdList" name="distIdList[]" multiple
									class="standardSelect" tabindex="1">
									<option value="-1">All</option>

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
							<div class="col-md-2"></div>

							<div class="col-md-3">

								<button type="button" class="btn btn-primary"
									onclick="callSearch()"
									style="align-content: center; width: 150px; margin-left: 80px;">
									<spring:message code="label.search" />
								</button>
								

							</div>
							
						</div>

					</div>
					&nbsp;

					<div class="card">
						<div class="card-header">
							<strong class="card-title"><spring:message
									code="label.itemReport" /></strong>
						</div>


						<div class="card-body">
							<table id="bootstrap-data-table"
								class="table table-striped table-bordered">

								<thead>
									<tr>
										<th><spring:message code="label.srNo" /></th>
										<th><spring:message code="label.itemName" /></th>
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


	<script type="text/javascript">
		function callSearch() {
			alert("cxcgxc");
			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			var distIdList = $("#distIdList").val();

			var langSelected = ${langSelected};

			alert("distIdList" + distIdList);
			alert("langSelected" + langSelected);

			$.getJSON('${getItemByDate}',

			{
				fromDate : fromDate,
				toDate : toDate,
				distIdList : distIdList,

				ajax : 'true'

			}, function(data) {

				if (data == "") {
					alert("No records found !!");

				}

				if (langSelected == 0) {

					var dataTable = $('#bootstrap-data-table').DataTable();
					$.each(data, function(i, v) {
						dataTable.row.add(
								[ i + 1, v.itemEngName, v.orderQty,
										v.deliverQty, v.itemTotal ]).draw();
					});

				} else if (langSelected == 1) {
					var dataTable = $('#bootstrap-data-table').DataTable();
					$.each(data, function(i, v) {
						dataTable.row.add(
								[ i + 1, v.itemMarName, v.orderQty,
										v.deliverQty, v.itemTotal ]).draw();
					});
				}

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
			$('input[id$=fromDate]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});

		$(function() {
			$('input[id$=toDate]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
</body>
</html>