<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Distributor</title>


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
							<strong> <spring:message code="label.addNewDist" /></strong>
						</div>
						<div class="card-body card-block">
							<form
								action="${pageContext.request.contextPath}/insertDistributor"
								method="post">
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.hsEngName" />
									</div>
									<div class="col-md-4">


										<div class="input-group">
											<input class="form-control" name="txtEnglish" id="txtEnglish"
												type="text" required
												oninvalid="setCustomValidity('Please enter name ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>

										</div>
									</div>



									<div class="col-md-2">
										<spring:message code="label.hsMarName" />
									</div>

									<div class="col-md-4">
										<div class="input-group">





											<input class="form-control" name="txtMarathi" id="txtMarathi"
												type="text" required
												oninvalid="setCustomValidity('Please enter name ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>
								</div>
								&nbsp;

								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.engAdd" />
									</div>
									<div class="col-md-4">

										<div class="input-group">
											<input class="form-control" name="addEnglish" id="addEnglish"
												type="text" required
												oninvalid="setCustomValidity('Please enter Address ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>

										</div>
									</div>


									<div class="col-md-2">
										<spring:message code="label.marAdd" />
									</div>
									<div class="col-md-4">


										<div class="input-group">


											<spring:message code="label.hsMarName" var="addMarathi" />


											<input class="form-control" name="addMarathi" id="addMarathi"
												type="text" required
												oninvalid="setCustomValidity('Please enter address ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>
								</div>
								&nbsp;
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.hsContactNo" />
									</div>
									<div class="col-md-4">


										<div class="input-group">



											<input class="form-control" name="contactNo" id="contactNo"
												required
												oninvalid="setCustomValidity('Please enter valid Mobile No ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												pattern="[0-9]{10}" autocomplete="off"> <span
												class="error" aria-live="polite"></span>
										</div>
									</div>
									<div class="col-md-2">
										<spring:message code="label.password" />
									</div>
									<div class="col-md-4">




										<div class="input-group">

											<input class="form-control" name="password" id="password"
												type="password" required
												oninvalid="setCustomValidity('Please enter password ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>
								</div>
								&nbsp;
								<div class="row">

									<div class="col-md-2">
										<spring:message code="label.distCratesLimit" />
									</div>

									<div class="col-lg-4">


										<div class="input-group">

											<input class="form-control" name="distCratesLimit"
												id="distCratesLimit" type="text" required
												oninvalid="setCustomValidity('Please enter Crates Limit ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>

									</div>


									<div class="col-md-2">
										<spring:message code="label.distCratesPending" />
									</div>

									<div class="col-lg-4">


										<div class="input-group">

											<input class="form-control" name="distCratesPending"
												id="distCratesPending" type="text" required
												oninvalid="setCustomValidity('Please enter Crates Pending ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>




								</div>
								&nbsp;
								<div class="row">


									<div class="col-md-2">
										<spring:message code="label.distAmtLimit" />
									</div>
									<div class="col-md-4">



										<div class="input-group">

											<input class="form-control" name="distAmtLimit"
												id="distAmtLimit" type="text" required
												oninvalid="setCustomValidity('Please enter Amount Limit')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>

									<div class="col-md-2">
										<spring:message code="label.distAmtPending" />
									</div>
									<div class="col-md-4">
										<div class="input-group">

											<input class="form-control" name="distAmtPending"
												id="distAmtPending" type="text" required
												oninvalid="setCustomValidity('Please enter Amount Pending ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error" aria-live="polite"></span>
										</div>
									</div>




								</div>
								&nbsp;
								<div class="row">


									<div class="col-md-2">
										<spring:message code="label.distLocation" />
									</div>


									<div class="col-lg-4">

										<div class="input-group">

											<input class="form-control" name="distLocation"
												id="distLocation" type="text" required
												oninvalid="setCustomValidity('Please enter location ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error" aria-live="polite"></span>
										</div>
									</div>


									<div class="col-md-2">
										<spring:message code="label.routeSeqNo" />
									</div>
									<div class="col-md-4">

										<div class="input-group">

											<input class="form-control" name="routeSeqNo" id="routeSeqNo"
												type="text" required
												oninvalid="setCustomValidity('Please enter Route Sequnce No')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>
								</div>

								&nbsp;
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.selectRoute" />
									</div>
									<div class="col-md-4">
										<select id="routeId" name="routeId" class="standardSelect"
											tabindex="1" required>
											<option value=""></option>

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
								&nbsp;

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
				disable_search_threshold : 2,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>



</body>
</html>