<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Web Panel Login</title>
<meta name="description" content="Web Panel Login">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


</head>
<body class="bg-dark">


	<div class="sufee-login d-flex align-content-center flex-wrap"
		style="position: absolute; top: 35%; left: 50%; width: 30em; height: 18em; margin-top: -9em; margin-left: -15em;">

		<div class="container">
			<div class="login-content">

				<div align="center"></div>

				<form action="getLogin" >
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header" align="center">LOGIN</div>
							<div class="card-body card-block">
								<form action="" method="post" class="">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-user"></i>
											</div>
											<input type="text" id="username" name="username"
												placeholder="Username" class="form-control">
										</div>
									</div>

									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-asterisk"></i>
											</div>
											<input type="password" id="password" name="password"
												placeholder="Password" class="form-control">
										</div>
									</div>
									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">Sign
										In</button>
								</form>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


</body>
</html>
