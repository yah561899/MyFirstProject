<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
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
	input{
		width: 90px;
		height: 40px;
		text-align: center;
	}
	.email, .regisDate{
		width: 200px;
	}
	table, tr, th, td{
		margin: 10px auto;
		text-align: center;
	}
	button{
		width: 50px;
	}
	#add{
		width: 100px;
	}
	img{
		height: 40px;
	}
	.box {
		width: 300px;
	}
	.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
  </style>
  
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--���s��-->
<jsp:include page="managertitle.jsp" />
<h3 style="text-align: center;">�|���ӫ~�ʶR����</h3>

<div class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px">
	<div class="table-responsive">



		<table class="table">
			<thead style="background-color:#ffffffb0">
				<tr >
					<th style="text-align:center;">�q��s��</th>
					<th style="text-align:center;">�ʶR���q��|���b��</th>
					<th style="text-align:center;">�ӫ~�Ϥ�</th>
					<th style="text-align:center;">�ӫ~�W��</th>
					<th style="text-align:center;">�ʶR�ɶ�</th>
		<!-- 			<th style="text-align:center;">�|���H�c</th> -->
		<!-- 			<th style="text-align:center;">�ӫ~���O</th> -->
		
		<!-- 			<th style="text-align:center;">�|���a�}</th>	 -->
					<th style="text-align:center;">�Ӳ��~�����U�Ǹ�</th>
					<th style="text-align:center;">���~���U�ɶ�</th>
					<th style="text-align:center;">���U�����~�|���b��</th>
					
		<!-- 			<th style="text-align:center;">���~�O�T������</th> -->
		<!-- 			<th style="text-align:center;">�|���W�ǵo��</th> -->
		<!-- 			<th style="text-align:center;">�ק�O�T��</th> -->
		<!-- 			<th style="text-align:center;">���P�O�T</th> -->
				</tr>
			</thead>
			<tbody style="background-color:#ffffffb0">
						<c:set var="lastId" value="0" />
		<c:forEach var='pdrg' items='${pdrg}'>
			<tr>
<!-- 			<form > -->
				<td>${pdrg.orderBean.orderNo}</td>
				<td>${pdrg.orderBean.memberBean.userId}</td>
				<td><img src="images/productimages/${pdrg.productBean.img1}"></td>		
				<td>${pdrg.productBean.name}</td>
				<td>${pdrg.orderBean.orderDate}</td>
				<td>${pdrg.licenseKey}</td>	
				<td>${pdrg.registerDate}</td>		

				<td>${pdrg.memberBean.userId}</td>
<%-- 				<td><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td>	 --%>
				
<%-- 				<td><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td> --%>								
			</tr>
<%-- 			<c:set var="lastId" value="${product.productId}" /> --%>
		</c:forEach>

			</tbody>
		</table>
	</div>
</div>
<!-- <form id="form1" action=""> -->
<!-- 	<table border='1' class="table" > -->
<!-- 		<tr height="40px" align="center"><th colspan='11' style="text-align:center;">�|���ӫ~�ʶR����</th></tr> -->
<!-- 		<tr height="40px"> -->
<!-- 			<th style="text-align:center;">�q��s��</th> -->
<!-- 			<th style="text-align:center;">�ʶR���q��|���b��</th> -->
<!-- 			<th style="text-align:center;">�ӫ~�Ϥ�</th> -->
<!-- 			<th style="text-align:center;">�ӫ~�W��</th> -->
<!-- 			<th style="text-align:center;">�ʶR�ɶ�</th> -->
<!-- <!-- 			<th style="text-align:center;">�|���H�c</th> --> 	
<!-- <!-- 			<th style="text-align:center;">�ӫ~���O</th> --> 

<!-- <!-- 			<th style="text-align:center;">�|���a�}</th>	 --> 
<!-- 			<th style="text-align:center;">�Ӳ��~�����U�Ǹ�</th> -->
<!-- 			<th style="text-align:center;">���~���U�ɶ�</th> -->
<!-- 			<th style="text-align:center;">���U�����~�|���b��</th> -->
	
<!-- <!-- 			<th style="text-align:center;">���~�O�T������</th> --> 
<!-- <!-- 			<th style="text-align:center;">�|���W�ǵo��</th> --> 
<!-- <!-- 			<th style="text-align:center;">�ק�O�T��</th> -->
<!-- <!-- 			<th style="text-align:center;">���P�O�T</th> --> 
<!-- 		</tr> -->
<%-- 		<c:set var="lastId" value="0" /> --%>
<%-- 		<c:forEach var='pdrg' items='${pdrg}'> --%>
<!-- 			<tr> -->
<!-- <!-- 			<form > --> 
<%-- 				<td>${pdrg.orderBean.orderNo}</td> --%>
<%-- 				<td>${pdrg.orderBean.memberBean.userId}</td> --%>
<%-- 				<td><img src="images/productimages/${pdrg.productBean.img1}"></td>		 --%>
<%-- 				<td>${pdrg.productBean.name}</td> --%>
<%-- 				<td>${pdrg.orderBean.orderDate}</td> --%>
<%-- 				<td>${pdrg.licenseKey}</td>	 --%>
<%-- 				<td>${pdrg.registerDate}</td>		 --%>

<%-- 				<td><input type="text" readonly="readonly" value="${pdrg.memberBean.userId}"></td> --%>
<%-- <%-- 				<td><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td>	 --%> 
				
<%-- <%-- 				<td><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td> --%> 
<%-- <%-- 				<td><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td> --%> 
				
				
				
				
	
				
				
			
<!-- 			</tr> -->
<%-- <%-- 			<c:set var="lastId" value="${product.productId}" /> --%> 
<%-- 		</c:forEach> --%>
	
<!-- <!-- 		<tr> --> 
<%-- <%-- 			<td><input type="text" readonly="readonly" value="${lastId + 1}"></td> --%> 
<!-- <!-- 			<td colspan='11'><button type="button" class="insertProduct"><a href="insertproduct.controller">�s�W�ӫ~</a></button></td> --> 
<!-- <!-- 			<td colspan='2'></td> --> 
<!-- <!-- 		</tr> --> 
<!-- <!-- 		</form> --> 
<!-- 	</table> -->
<!-- </form> -->
</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- �� CDN �ޥ�, ���}�W���� CDN �����ƻs�Y�i -->


</html>
