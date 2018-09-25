<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Distributor Search Detail</title>


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
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- css for date picker proper UI -->


</head>


<!-- Translate -->


<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<script type="text/javascript">
	google.load("elements", "1", {
		packages : "transliteration"
	});
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
	function OnLoad() {
		var options = {
			sourceLanguage : google.elements.transliteration.LanguageCode.ENGLISH,
			destinationLanguage : [ google.elements.transliteration.LanguageCode.MARATHI ],
			shortcutKey : 'ctrl+g',
			transliterationEnabled : true
		};

		var control = new google.elements.transliteration.TransliterationControl(
				options);
		control.makeTransliteratable([ "txtMarathi" ]);
		var keyVal = 32; // Space key
		$("#txtEnglish")
				.on(
						'keydown',
						function(event) {
							var engText = $("#txtEnglish").val() + " ";

							if (event.keyCode === 32) {

								var engTextArray = engText.split(" ");
								$("#txtMarathi")
										.val(
												$("#txtMarathi").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("txtMarathi").focus();
								$("#txtMarathi").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#txtMarathi").val("");

								$("#txtEnglish").val("");
							}

						});

		$("#txtMarathi").bind("keyup", function(event) {
			setTimeout(function() {
				$("#txtEnglish").val($("#txtEnglish").val() + " ");
				document.getElementById("txtEnglish").focus()
			}, 0);
		});
	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

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

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<%-- 							<strong> <spring:message code="label.addNewHubUser" /></strong>
 --%>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertHubUser"
								method="post">
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.userName" />
									</div>
									<div class="col-md-2">
										<c:if test="${langSelected==0}">
									${dist.distEngName}
									</c:if>
										<c:if test="${langSelected==1}">
									${dist.distMarName}
									</c:if>

									</div>

									<div class="col-md-2">
										<spring:message code="label.hsContactNo" />

									</div>
									<div class="col-md-2">${dist.distContactNo}</div>

									<div class="col-md-2">
										<spring:message code="label.address" />
									</div>
									<div class="col-md-2">
										<c:if test="${langSelected==0}">
									${dist.distAddEng}
									</c:if>
										<c:if test="${langSelected==1}">
									${dist.distAddMar}
									</c:if>
									</div>

								</div>
								&nbsp;

								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.routeSeqNo" />
									</div>
									<div class="col-md-2">${dist.routeDistSeqNo}</div>

									<div class="col-md-2">
										<spring:message code="label.distCratesPending" />
									</div>
									<div class="col-md-2">${dist.distCratesPending}</div>


									<div class="col-md-2">
										<spring:message code="label.distCratesLimit" />
									</div>
									<div class="col-md-2">${dist.distCratesLimit}</div>
								</div>
								&nbsp;
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.distAmtPending" />
									</div>


									<div class="col-md-2">${dist.distAmtPending}</div>

									<div class="col-md-2">
										<spring:message code="label.distAmtLimit" />
									</div>


									<div class="col-md-2">${dist.distAmtLimit}</div>

								</div>
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
											<input type="text" id="date" name="date" />
										</div>


										<div class="col-md-1" align="center"></div>

										<div class="col-md-3">
											<button type="button" class="btn btn-primary"
												onclick="callSearch()" style="width: 90%;">
												<spring:message code="label.search" />
											</button>
										</div>
									</div>
								</div>


								<input type="hidden" id="distId" name="distId"
									value="${dist.distId}">

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
													&nbsp; <input class="form-control"
														name="prevPendingCrateBal" id="prevPendingCrateBal"
														type="text" disabled /> <span class="error"
														aria-live="polite"></span>
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
														id="orderTotal1" type="text" disabled /> <span
														class="error" aria-live="polite"></span>
												</div>
											</div>
										</div>
										<div class="col-lg-3">

											<div>

												<div class="input-group" style="align-items: center;">
													<spring:message code="label.amtReceived" />
													&nbsp; <input class="form-control" name="amtReceived"
														id="amtReceived" type="text" disabled /> <span
														class="error" aria-live="polite"></span>
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


							</form>
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
		$(document)
				.ready(
						function() {
							$('#bootstrap-data-table-export').DataTable();

							$("#flowcheckall")
									.click(
											function() {
												$(
														'#bootstrap-data-table tbody input[type="checkbox"]')
														.prop('checked',
																this.checked);
											});

						});
	</script>

	<script type="text/javascript">
		function callSearch() {
			//alert("cxcgxc");
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

								//alert(data.getOrderDetailList);

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
									
									
									var lang=${langSelected};
									var itemName;
									
									if(lang==0){
										itemName=v.itemEngName;
									}else{
										itemName=v.itemMarName;
									}
									dataTable.row
											.add(
													[ i + 1,itemName,
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