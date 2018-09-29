<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Dairy Hub Panel</title>

<link rel="apple-touch-icon" href="apple-icon.png">
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
	href="${pageContext.request.contextPath}/resources/assets/css/menu.css">

<link
	href="${pageContext.request.contextPath}/resources/assets/css/lib/vector-map/jqvmap.min.css"
	rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


</head>


<!-- 
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script> -->


<body onload="setData()">
	<c:url var="getChartData" value="/getGraphDataForDistwiseOrderHistory"></c:url>

	<c:url var="getCatOrdQty" value="/getCatOrdQty"></c:url>

	<c:url var="getCatwiseTrend" value="/getCatwiseTrend"></c:url>



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

					<div class="col-xs-12 col-sm-12">

						<div class="col-sm-6 col-lg-4"
							onclick="showTodaysOrder(${dashBoard.todaysOrdTotAndCount.orderCount})"
							style="cursor: pointer;">
							<div class="card text-white bg-flat-color-2">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">

										<span class="count" style="font-size: 50px;">${dashBoard.todaysOrdTotAndCount.orderCount}</span>

									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message
												code="label.totalOrders" /></font>
									</p>

								</div>
							</div>

						</div>



						<div class="col-sm-6 col-lg-4"
							onclick="showTodaysOrder(${dashBoard.todaysOrdTotAndCount.orderCount})"
							style="cursor: pointer;">

							<div class="card text-white bg-flat-color-2">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">

										<span class="count" style="font-size: 50px;">${dashBoard.todaysOrdTotAndCount.orderTotal}</span>

									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message
												code="label.orderTotal" /></font>
									</p>

								</div>
							</div>
						</div>


						<div class="col-sm-6 col-lg-4"
							onclick="showTodaysOrder(${dashBoard.todaysSpOrdTotAndCount.orderCount})"
							style="cursor: pointer;">

							<div class="card text-white bg-flat-color-2">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">

										<span class="count" style="font-size: 50px;">${dashBoard.todaysSpOrdTotAndCount.orderCount}</span>

									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message
												code="label.specialOrder" /></font>
									</p>

								</div>
							</div>

						</div>

					</div>

					<div class="col-xs-12 col-sm-12">

						<div class="col-sm-6 col-lg-4"
							onclick="showNoOrderDist(${noOrderDistCount})"
							style="cursor: pointer;">
							<div class="card text-white bg-flat-color-3">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">

										<span class="count" style="font-size: 50px;">${noOrderDistCount}</span>

									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message
												code="label.noOrder" /></font>
									</p>


								</div>
							</div>

						</div>


						<div class="col-sm-6 col-lg-4"
							onclick="showUpdateOrderDist(${dashBoard.todaysOrderPending.orderCount})"
							style="cursor: pointer;">

							<div class="card text-white bg-flat-color-3">
								<div class="card-body pb-0" align="center">

									<h4 class="mb-0">

										<span class="count" style="font-size: 50px;">${dashBoard.todaysOrderPending.orderCount}</span>

									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"><spring:message
												code="label.oForwardPending" /></font>
									</p>

								</div>
							</div>

						</div>
						<spring:message code="label.hsContactNo" var="hsContactNo" />
						<spring:message code="label.distName" var="distName" />

						<div class="col-sm-6 col-lg-4">
							<div class="card text-white bg-flat-color-3">
								<div class="card-body pb-1" align="center">
									<input type="text" id="dist" name="dist"
										style="color: red; width: 100%;" value="" onchange="getDist()"
										title="Search by mob no or dist name"
										placeholder="${hsContactNo} / ${distName}">

									<h4 class="mb-0">
										<span style="font-size: 35px;"><spring:message
												code="label.findDist" /></span>
									</h4>
									<p style="font-size: 18px; font-weight: bold; color: white;">
										<font color="white"></font>
									</p>

								</div>
							</div>
						</div>



					</div>


					<div class="col-xs-12 col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong><spring:message code="label.distOrderTotal" /></strong>
							</div>
							<div class="card-body card-block">

								<div id="columnchart_material"></div>

							</div>
						</div>
					</div>


					<div class="col-xs-12 col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong><spring:message code="label.catAndQty" /></strong>
							</div>
							<div class="card-body card-block">

								<div id="columnchart_material2"></div>

							</div>
						</div>
					</div>



					<div class="col-xs-12 col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong><spring:message code="label.catTrend" /></strong>
							</div>
							<div class="card-body card-block">


								<div id="linechart_material"
									style="width: 900px;; height: 700px;"></div>

							</div>
						</div>
					</div>



				</div>
			</div>
		</div>
	</div>



	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chart-js/Chart.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/widgets.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>

	<script>
		(function($) {
			"use strict";

			jQuery('#vmap').vectorMap({
				map : 'world_en',
				backgroundColor : null,
				color : '#ffffff',
				hoverOpacity : 0.7,
				selectedColor : '#1de9b6',
				enableZoom : true,
				showTooltip : true,
				values : sample_data,
				scaleColors : [ '#1de9b6', '#03a9f5' ],
				normalizeFunction : 'polynomial'
			});
		})(jQuery);
	</script>
	<script>
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({
				pageLanguage : 'en,mr',
				includedLanguages : 'mr,en',
				layout : google.translate.TranslateElement.InlineLayout.SIMPLE,
				autoDisplay : false
			}, 'google_translate_element');
			var a = document.querySelector("#google_translate_element");
			a.selectedIndex = 1;
			a.dispatchEvent(new Event('change'));

			$('.google_translate_element').each(function() {
				id = $(this).data('label-for');
				$('#' + id).val($(this).text());
			});

		}
	</script>

	<script>
		function setData() {
			getChart1();
			getChart2();
			getChart3();

			/*
			
			// Line Chart catewise trend 30/60/90 days

			google.charts.load('current', {
				'packages' : [ 'line' ]
			});
			google.charts.setOnLoadCallback(drawChart3);

			function drawChart3() {

				var data = new google.visualization.DataTable();
				data.addColumn('number', 'Day');
				data.addColumn('number', 'Cat 1');
				data.addColumn('number', 'Cat 2');
				data.addColumn('number', 'Cat 3');
				data.addColumn('number', 'Cat 4');

				data.addRows([ [ 1, 3700.8, 8000.8, 8900.5, 6922.5 ],
						[ 2, 3000.9, 6900.5, 3009.5, 8902.5 ],
						[ 3, 4500.4, 5007, 4009.5, 9901.5 ],
						[ 4, 3600.7, 1800.8, 5009.5, 1090.5 ],
						[ 5, 4000.9, 2000.5, 1900.5, 6025 ],
						[ 6, 5000.8, 4500.8, 4902.5, 8009.5 ]

				]);

				var options = {
					chart : {
						title : '',
						subtitle : ''
					}

				};

				var chart = new google.charts.Line(document
						.getElementById('linechart_material'));

				chart.draw(data, google.charts.Line.convertOptions(options));
			}
			 */
		}
	</script>




	<script>
		function getChart1() {

			google.charts.load('current', {
				'packages' : [ 'bar' ]
			});
			google.charts.setOnLoadCallback(drawChart1);

			function drawChart1() {
				$.getJSON('${getChartData}', {

					ajax : 'true'

				},
						function(jsonData) {
							var data = new google.visualization.DataTable();

							data.addColumn('string', 'Distributor');
							data.addColumn('number', 'Order1');
							data.addColumn('number', 'Order2');
							data.addColumn('number', 'Order3');

							var lan = $
							{
								langSelected
							}
							;
							//alert(lan);
							if (lan == 0) {
								$.each(jsonData, function(i, obj) {

									data.addRow([ obj.distEngName, obj.order1,
											obj.order2, obj.order3 ]);
								});
							} else {

								$.each(jsonData, function(i, obj) {

									data.addRow([ obj.distMarName, obj.order1,
											obj.order2, obj.order3 ]);
								});

							}

							var options = {
								title : '',
								is3D : true
							};
							var chart = new google.charts.Bar(document
									.getElementById('columnchart_material'));

							chart.draw(data, google.charts.Bar
									.convertOptions(options));

						});
			}

		}
	</script>



	<script>
		function getChart2() {

			google.charts.load('current', {
				'packages' : [ 'bar' ]
			});
			google.charts.setOnLoadCallback(drawChart2);

			function drawChart2() {
				$.getJSON('${getCatOrdQty}', {

					ajax : 'true'

				},
						function(jsonData) {
							var data = new google.visualization.DataTable();

							data.addColumn('string', 'Category');
							data.addColumn('number', 'Order Qty');
							var lan = $
							{
								langSelected
							}
							;
							//alert(lan);
							if (lan == 0) {
								$.each(jsonData, function(i, obj) {

									data
											.addRow([ obj.catEngName,
													obj.orderQty ]);
								});
							} else {

								$.each(jsonData, function(i, obj) {

									data
											.addRow([ obj.catMarName,
													obj.orderQty ]);
								});

							}

							var options = {
								title : '',

								is3D : true
							};
							var chart = new google.charts.Bar(document
									.getElementById('columnchart_material2'));

							chart.draw(data, google.charts.Bar
									.convertOptions(options));

						});
			}

		}
	</script>




	<script>
		function getChart3() {

			google.charts.load('current', {
				'packages' : [ 'line' ]
			});
			google.charts.setOnLoadCallback(drawChart3);

			function drawChart3() {
				$.getJSON('${getCatwiseTrend}', {

					ajax : 'true'

				}, function(jsonData) {

					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Day');
					//data.addColumn('number', 'Cat 1');

					$.each(jsonData.catList, function(k, obj) {
						catName = obj.catEngName;
						//alert(i);
						data.addColumn('number', obj.catEngName);
					});
					data.addRows(jsonData.orderList.length);

					$.each(jsonData.orderList, function(i, o) {
						data.setCell(i, 0, o.date);
						//alert("i "+i);
						$.each(o.orderQty, function(j, q) {
							//alert("j "+j);
							data.setCell(i, j + 1, q.toString());

						});

					});

					//alert(JSON.stringify(data));
					var options = {
						chart : {
							title : '',
							subtitle : '',

							chartArea : {
								left : 0,
								top : 0,
								width : "100%",
								height : "100%"
							}

						}

					};

					var chart = new google.charts.Line(document
							.getElementById('linechart_material'));

					chart
							.draw(data, google.charts.Line
									.convertOptions(options));

					// Line Chart catewise trend 30/60/90 days

					/* 	google.charts.load('current', {
							'packages' : [ 'line' ]
						});
						google.charts.setOnLoadCallback(drawChartOld);

						function drawChartOld() {

							var data = new google.visualization.DataTable();
							data.addColumn('number', 'Day');
							data.addColumn('number', 'Cat 1');
							data.addColumn('number', 'Cat 2');
							data.addColumn('number', 'Cat 3');
							data.addColumn('number', 'Cat 4');

							data.addRows([ [ 1, 3700.8, 8000.8, 8900.5, 6922.5 ],
									[ 2, 3000.9, 6900.5, 3009.5, 8902.5 ],
									[ 3, 4500.4, 5007, 4009.5, 9901.5 ],
									[ 4, 3600.7, 1800.8, 5009.5, 1090.5 ],
									[ 5, 4000.9, 2000.5, 1900.5, 6025 ],
									[ 6, 5000.8, 4500.8, 4902.5, 8009.5 ]

							]);

							var options = {
								chart : {
									title : '',
									subtitle : ''
								}

							};

							alert(JSON.stringify(data));
							 
							var chart = new google.charts.Line(document
									.getElementById('linechart_material'));

							chart.draw(data, google.charts.Line.convertOptions(options));
					
						}
					 */

				});
			}

		}
	</script>

	<script type="text/javascript">
		
		function showTodaysOrder(count){
			alert("count"+count);
			if(count>0){
				
			
			window.open('${pageContext.request.contextPath}/showTodaysOrder',"_self");
			}
		}
		function showNoOrderDist(count){
			alert("count"+count);
			
			if(count>0){
			
			window.open('${pageContext.request.contextPath}/showDistListNoOrder',"_self");
		}
		}
		function showUpdateOrderDist(count){
			alert("count"+count);
			if(count>0){
				window.open('${pageContext.request.contextPath}/showUpdateOrderStatus',"_self");
			}
			}
	
	 function getDist() {
			var dist = document.getElementById("dist").value;

			window.open('${pageContext.request.contextPath}/searchDist/'+dist);

		} 
	</script>

</body>
</html>
