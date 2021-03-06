<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again</title>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Animate css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick/slick-theme.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  
  	<script type="text/javascript">
		function getData(){
			var req = new XMLHttpRequest();
			req.open("get","title");
			req.onload = function(){
				var content = document.getElementById("content");
				content.innerHTML = this.responseText;				
			};
			req.send();
		}		
	</script>
  
</head>

<body id="body">

<div id="demo">
<!-- Start Top Header Bar -->
<section class="top-header">
	<div class="container" style="border-bottom:0px;padding-bottom:0px">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number">
					<i class="tf-ion-ios-telephone"></i>
					<span style="font-size:14px">02-1234-5678</span>
					&emsp; 
					<c:if test="${user == null}">
						<a style="font-size:16px" href="managerlogin.controller">
						<i class="tf-ion-ios-contact"></i>
							<span style="font-size:15px">???????????????</span>
						</a>
					</c:if>
				</div>
<!-- 				<div> -->
<!-- 					<span onclick="getData();">??????</span> -->
<!-- 				</div> -->
			</div>
			
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="/homepage.controller">
						<!-- replace logo here -->
						<img style="height: 90px;" src="./images/Baglogo.png">
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				
				<ul class="top-menu text-right list-inline">
					<!-- ??????/?????? -->
					
					<li class="dropdown cart-nav dropdown-slide">
						<c:if test="${memlogin == null}">
							<a style="font-size:16px" href="memberlogin.controller">
								<i class="tf-ion-android-person"></i>
								?????? / ??????
							</a>
						</c:if>
						
						<c:if test="${memlogin != null}">
							<i class="tf-ion-android-contact" ></i>
							${memlogin.name}???????????????
							<a style="font-size:16px" onclick="getData();" href="memberlogout.controller">
								??????
							</a>
						</c:if>						
					</li><!-- /??????/?????? -->
					
					<!-- Cart -->
					<li class="dropdown cart-nav dropdown-slide">
						<c:if test="${memlogin == null}">
							<a style="font-size: 16px"
								href="memberlogin.controller"> <i
								class="tf-ion-android-cart"></i> ?????????
							</a>
						</c:if> 
						<c:if test="${memlogin != null}">
							<a style="font-size: 16px"
								href="findallshoppingcartdetail.controller"> <i
								class="tf-ion-android-cart"></i> ?????????
							</a>
						</c:if>
					</li>

					<!-- ??????????????? 
					<li class="dropdown search dropdown-slide">
						<c:if test="${user == null}">
							<a href="managerlogin.controller">
							<i class="tf-ion-ios-contact"></i>
								???????????????
							</a>
						</c:if>
					</li><!-- / ??????????????? -->
					
				</ul><!-- / .nav .navbar-nav .navbar-right -->
			</div>
		</div>
	</div>
</section><!-- End Top Header Bar -->

<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<!-- ?????? -->
					<li class="dropdown ">
						<a href="homepage.controller">??????</a>
					</li><!-- / ?????? -->

					<!-- ???????????? -->
					<li class="dropdown ">
						<a href="/contactUs">????????????</a>
					</li><!-- / ???????????? -->

					<!-- ????????? -->
					<li class="dropdown dropdown-slide"><a href="products.controller"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="350" role="button"
							aria-haspopup="true" aria-expanded="false">?????????<span
								class="tf-ion-ios-arrow-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="products.controller">????????????</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="productsClick.controller">????????????</a></li>
								<li role="separator" class="divider"></li>
								<!-- ?????? -->
								<c:forEach items='${allProductSort}' var='productSort'>
									<li><a href="productsSort.controller?sortId=${productSort.sortId}">${productSort.sortName}</a></li>
								</c:forEach>
							</ul>
					</li>
					<!-- ?????? -->
					<li class="dropdown dropdown-slide">
						<a href="/mainarticle">??????<span class="tf-ion-ios-arrow-down"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/toucharticle">????????????</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="/vgaarticle">?????????</a></li>
							<li><a href="/cpuarticle">?????????</a></li>
							<li><a href="/ramarticle">?????????</a></li>
							<li><a href="/mbarticle">?????????</a></li>
							<li><a href="/ssdarticle">??????</a></li>
							<li><a href="/screenarticle">??????</a></li>
							<li><a href="/keyboardarticle">??????</a></li>
							<li><a href="/mousearticle">??????</a></li>
						</ul>
					</li>



					<!-- Shop -->
							<c:choose>
								<c:when test="${memlogin == null || memlogin == ''}">
									<li class="dropdown dropdown-slide">
										<a href="memberlogin.controller">????????????<span	class="tf-ion-ios-arrow-down"></span></a>
										<ul class="dropdown-menu">
											<li><a href="memberlogin.controller">??????????????????</a></li>
											<li><a href="memberlogin.controller">????????????</a></li>
											<li><a href="memberlogin.controller">????????????</a></li>
										</ul>
									</li>
								</c:when>
								
								<c:when test="${memlogin != null || memlogin != ''}">
									<li class="dropdown dropdown-slide">
										<a href="memberService.controller">????????????<span	class="tf-ion-ios-arrow-down"></span></a>
										<ul class="dropdown-menu">
											<li><a href="memberInformation?memberId=${memlogin.memberId}">??????????????????</a></li>
											<li><a href="memberOrder.controller">????????????</a></li>
											<li><a href="selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">????????????</a></li>
										</ul>
									</li>
								</c:when>
							</c:choose>
							<!-- Shop -->
							
				</ul><!-- / .nav .navbar-nav -->

			</div>
			<!--/.navbar-collapse -->
		</div><!-- / .container -->
	</nav>
	
</section>
</div>
</body>
</html>