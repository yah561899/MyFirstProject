<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="UTF-8">
  <title>Back Controller Product</title>

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
  
  <style type="text/css">
/* 	input{ */
/* 		width: 90px; */
/* 		height: 40px; */
/* 		text-align: center; */
/* 	} */
/* 	.email, .regisDate{ */
/* 		width: 200px; */
/* 	} */
/* 	table, tr, th, td{ */
/* 		margin: 10px auto; */
/* 		text-align: center; */
/* 	} */
/* 	button{ */
/* 		width: 50px; */
/* 	} */
/* 	#add{ */
/* 		width: 100px; */
/* 	} */
	img{
		height: 40px;
	}
	.box {
		width: 200px;
	}
	.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	td{
		align:center; 
		valign:center;
 		text-align: center;
 	}
  </style>
  
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--????????????-->
<jsp:include page="managertitle.jsp" />

<!-- <div class="dashboard-wrapper user-dashboard" > -->
<!-- 	<label>??????????????????:</label> -->
<!-- 	<select> -->
<%-- 		<c:forEach var='productsort' items='${allproductsorts}'> --%>
<%-- 			<option value="${productsort.sortId}">${productsort.sortName}</option> --%>
<%-- 		</c:forEach> --%>
<!-- 	</select> -->
<!-- 	<button type="button" onclick="">??????</button> -->
<!-- </div> -->

<!-- <div class="dashboard-wrapper user-dashboard" > -->
<!-- 	<div > -->
<!-- 		<label style="float: left;">??????????????????:</label> -->
<!-- 		<input style="height:30px;width: 100px;margin: 0px" type="text" class="form-control" placeholder="????????????" id="productSort"> -->
<!-- 		<button style="float: left;" type="button" onclick="insertProductSort()">????????????</button> -->

<!-- 	</div> -->
	
<!-- 	<div class="dashboard-wrapper user-dashboard" style="width: 300px"> -->
<!-- 		<label>??????????????????:</label> -->
<!-- 		<select> -->
<%-- 			<c:forEach var='productsort' items='${allproductsorts}'> --%>
<%-- 				<option value="${productsort.sortId}">${productsort.sortName}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select> -->
<!-- 		<button  type="button" onclick="">??????</button> -->
<!-- 	</div> -->
	
<!-- </div> -->

<h3 style="text-align: center;">???????????????</h3>
<!-- 	<div style="text-align:center;position: absolute; top:245px;left:60px; "> -->
<!-- 		<a style="padding-right:55px;padding-left: 55px;float: right;" class="btn btn-default" href="insertproduct.controller"><b>????????????</b></a> -->
<!-- 	</div> -->
<div class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px">
					<div class="table-responsive" >
						<table class="table" style="margin-bottom:0px;">
							<thead>
								<tr >
									<th style="text-align: center;">
										<div>
											<label  style="margin: 0px;font-size: 15px">??????????????????&thinsp;:&thinsp;</label>
											<select style="width: 100px;height: 32px;" id="productsort">
												<c:forEach var='productsort' items='${allproductsorts}'>
													<option value="${productsort.sortId}">${productsort.sortName}</option>
												</c:forEach>
											</select>
											<button class="btn btn-default" type="button" onclick="selectBySort()"><b>??????</b></button>
										</div>
									</th>
									<th style="text-align: center;">
										<div>
											<label style="margin: 0px;font-size: 15px">??????????????????&thinsp;:&thinsp;</label>
											<input style="height:30px;width:140px;margin: 0px;border: 1px solid #ccc; " type="text"  placeholder="????????????" id="productSort">
											<button style="" type="button" class="btn btn-default" onclick="insertProductSort()"><b>????????????</b></button>
										</div>
									</th>
									
									<th style="text-align: center;">
										<div style="text-align: center;">
											<a style="padding-right:55px;padding-left: 55px;" class="btn btn-default" href="insertproduct.controller"><b>????????????</b></a>
										</div>
									</th>
									
								</tr>
								</thead>
								</table>
					
						<table class="table" >
							<thead style="background-color:#ffffffb0">
								<tr>
									<th>????????????</th>
									<th>????????????</th>
									<th style="text-align: center;">????????????</th>
									<th>????????????</th>
									<th>????????????</th>
									<th>????????????</th>
									<th>????????????</th>
									<th style="text-align: center;">????????????</th>
									<th >????????????</th>
									<th >??????</th>
									<th style="text-align: center;">????????????</th>
									<th style="text-align: center;">??????</th>
									<th style="text-align: center;">??????</th>
								</tr>
							</thead>
							<tbody style="background-color:#ffffffb0">
								<c:forEach var='product' items='${allProducts}'>
								<tr>
									<td align="center">${product.productId}</td>
									<td><img src="images/productimages/${product.img1}"></td>
									<td>${product.name}</td>
									<td>${product.productSortBean.sortName}</td>
									<td>$${product.unitPrice}</td>
									<td>${product.quantity}</td>
									<td>${product.buyCount}/${product.quantity}</td>
									<td><div class="box"><a href="updateproduct.controller?productId=${product.productId}"><p class="ellipsis">${product.content}<p class="ellipsis"></p></a></div></td>
									<td>${product.clickCount}</td>
									<td>${product.onSale}</td>
									<td>${product.registerDate}</td>
									<td><a href="updateproduct.controller?productId=${product.productId}" class="btn btn-default"><i class="tf-pencil2" aria-hidden="true"></i></a></td>
									<td><a title="deltitle" href="deleteproduct.controller?productId=${product.productId}" class="btn btn-default"><i class="tf-ion-android-delete" aria-hidden="true"></i></a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</div>
				</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- ??? CDN ??????, ??????????????? CDN ?????????????????? -->
<script>
	$(function(){
	    var len = 10; // ??????50?????????"..."??????
	    $(".JQellipsis").each(function(i){
	        if($(this).text().length>len){
	            $(this).attr("title",$(this).text());
	            var text=$(this).text().substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});	

	function insertProductSort() {
		var sortName = $("#productSort").val();
		if (sortName == 0) {
			alert("??????????????????????????????");
		} else if (sortName != 0) {
			var param = {
				"sortName": $("#productSort").val()
			}
			
			$.ajax({
				type:'post',
				url:'insertproductsort2.controller',
				dataType:'JSON', /*??????*/
				contentType:'application/json', /*??????*/
				data: JSON.stringify(param),
				success: function(data){
					alert('????????????');
					window.location.href="/findallproducts.controller";
				}
			})
		}
	}
	
	function selectBySort() {
// 		$.get(
// 			"findproductsbysort.controller",
// 			{"sortId" : $("#productsort").val()}
// 		);
		$.ajax({
			type:'get',
			url:'findproductsbysort.controller?sortId=' + $("#productsort").val(),
			dataType:'JSON', /*??????*/
			contentType:'application/json', /*??????*/
			success: function(data) {
				$("tbody").empty("");
// 				console.log(data);
				
				var sort = data.sort;
				var products = data.products;
				
				$.each(products, function(i,product) {
					var tr = 
					"<tr>" +
					"<td align='center'>" + product.productId + "</td>" +
					"<td><img src='images/productimages/" + product.img1 + "'></td>" +
					"<td>" + product.name + "</td>" +
					"<td>" + sort.sortName + "</td>" +
					"<td>" + product.unitPrice + "</td>" +
					"<td>" + product.quantity + "</td>" +
					"<td>" + product.buyCount + "/" + product.quantity + "</td>" +
					"<td><div class='box'><a href='updateproduct.controller?productId=" + product.productId + "'><p class='ellipsis'>" + product.content + "<p class='ellipsis'></p></a></div></td>" +
					"<td>" + product.clickCount + "</td>" +
					"<td>" + product.onSale + "</td>" +
					"<td>" + product.registerDate + "</td>" +
					"<td><a href='updateproduct.controller?productId=" + product.productId + "' class='btn btn-default'><i class='tf-pencil2' aria-hidden='true'></i></a></td>" +
					"<td><a href='deleteproduct.controller?productId=" + product.productId + "' class='btn btn-default'><i class='tf-ion-android-delete' aria-hidden='true'></i></a></td>" +
					"</tr>";
					
					$("tbody").append(tr);
				});
			}
		})
	}
	
	$(document).ready(function() {
		$("a[title='deltitle']").click(function() {
			var yes = confirm('?????????????????????????????????');
			if (yes) {
				alert('????????????');
			} else {
				event.preventDefault();
				alert('????????????');
			}
		})
	})
	
</script>
</html>
