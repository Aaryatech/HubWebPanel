<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Notification</title>


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
							if (event.keyCode === 32) {
								var engText = $("#txtEnglish").val() + " ";
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

		var control2 = new google.elements.transliteration.TransliterationControl(
				options);
		control.makeTransliteratable([ "addMarathi" ]);
		var keyVal = 32; // Space key
		$("#addEnglish")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#addEnglish").val() + " ";
								var engTextArray = engText.split(" ");
								$("#addMarathi")
										.val(
												$("#addMarathi").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("addMarathi").focus();
								$("#addMarathi").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							} else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#addMarathi").val("");

								$("#addEnglish").val("");
							}
						});

		$("#addMarathi").bind("keyup", function(event) {
			setTimeout(function() {
				$("#addEnglish").val($("#addEnglish").val() + " ");
				document.getElementById("addEnglish").focus()
			}, 0);
		});

	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

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

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> <spring:message code="label.sendNoti" /></strong>
						</div>
						<div class="card-body card-block">
							<form
								action="${pageContext.request.contextPath}/insertNotification"
								method="post">




								<div class="form-group"></div>
								<div class="col-xs-6 col-sm-6">
									<label> <spring:message code="label.selectRoute" /></label>
									<div class="card">

										<div class="card-body">
											<select name="routeId" id="routeId" class="standardSelect"
												tabindex="1" required>
												<option value=""><spring:message
														code="label.selectRoute" /></option>
												<c:forEach items="${routeList}" var="routeList">


													<c:if test="${langSelected == 0}">
														<option value="${routeList.routeId}">${routeList.routeEngName}
														</option>
													</c:if>
													<c:if test="${langSelected == 1}">
														<option value="${routeList.routeId}">${routeList.routeMarName}
														</option>
													</c:if>

												</c:forEach>
											</select>

										</div>
									</div>

								</div>
								OR


								<div class="form-group"></div>
								<div class="col-xs-6 col-sm-6">
									<label> <spring:message code="label.selectDist" /></label>
									<div class="card">

										<div class="card-body">
											<select name="routeId" id="routeId" multiple
												class="standardSelect" tabindex="1" required>
												<option value="0"><spring:message code="label.all" /></option>
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
											<!-- <select data-placeholder="Choose a Country...">
												<option value=""></option>

											</select> -->
										</div>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.noti" />

									<div class="input-group">


										<spring:message code="label.noti" var="notifi" />


										<input class="form-control" name="notifi" id="notifi"
											type="text" required
											oninvalid="setCustomValidity('Please enter Notification ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
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
				</div>
			</div>


		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Left Panel -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 10,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>



</body>
</html>