<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller RMA</title>

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
	.email, .regisDate{
		width: 200px;
	}
/* 	table, tr, th, td{ */
/* 		margin: 10px auto; */
/* 		text-align: center; */
/* 	} */
/* 	button{ */
/* 		width: 50px; */
/* 	} */
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
<body id="body" background="/images/background.png"  style=" background-attachment: fixed;">
	<!--���s��-->
<jsp:include page="title.jsp" />
	
	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">�|���M��</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">����</a></li>
							<li class="active">�Ȥ�A��</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper"
		style="background-color: #f7f7f7;">

		<div  class="widget widget-category"  style="margin-top: 100px; width: 250px;position:absolute;left: 100px">
		<div style="bottom: 100px;" >
			<h3 class="tf-ion-android-cart"style="text-align:left;font-size: 28px;margin-bottom: 20px;">�ӫ~����</h3>
			<ul class="widget-category-list" style="text-align: left;font-size: 15px;margin-left: 20px;">
				<li>
					<a style="font-size: 18px" href="/memberOrder.controller">�q��d��</a>
				</li>
				<li>
					<a style="font-size: 18px" href="Warrantyinsert1.controller">�ӫ~���U</a>
				</li>
				<li>
					<a style="font-size: 18px" href="WarrantyfindMember.controller2">�ӫ~�O�T�d��</a>
				</li>
				<li>
					<a style="font-size: 18px" href="RMAfindMember.controller">�e�װӫ~�d��</a>
				</li>
			</ul>
		</div>
	</div>


		<div
			style="position: absolute; top: 100; right: 47px; text-align: center">
			<div class="container" style="float: top; background-color: #f7f7f7;">
				<div class="row">
					<div class="col-md-12">
						<ul style="margin-left: -200px; "class="list-inline dashboard-menu text-center">
							<li><a href="memberInformation?memberId=${memlogin.memberId}">�ӤH�b��޲z</a></li>
							<li><a class="active" href="memberOrder.controller">�ӫ~����</a></li>
							<li><a href="/selectcontonlineCustomerServiceInsert.controller?cl_ml_id=${memlogin.memberId}">�Ȥ�A��</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

<div class="dashboard-wrapper user-dashboard"    style="border:0px">
		<div class="table-responsive">

<form id="form1" action="��s" method="Post" style=" width: 1296px;padding-top: 70px;">
	<table border='1' class="table"  style="width: 80%;margin-left: 290px;" >
		<tr height="40px" align="center">
			<th colspan='11' style="text-align:center;font-size: 20px">RMA�d��</th>
		</tr>
		<tr height="40px">
<!-- 			<th style="text-align:center;">RMA�s��</th> -->
			<th style="text-align:center;">RMA�渹</th>
			<th style="text-align:center;">�ӽФ��</th>
			<th style="text-align:center;">�Ϥ�</th>
			<th style="text-align:center;">���~�W��</th>
			<th style="text-align:center;">��]</th>
<!-- 			<th style="text-align:center;">�|���b��</th> -->
			<th style="text-align:center;">�H�e�a�}</th>
<!-- 			<th style="text-align:center;">�H�c</th>	 -->
			<th style="text-align:center;">BAG���첣�~��</th>
			<th style="text-align:center;">�B�z���A</th>
			<th style="text-align:center;">�H�X���</th>
			<th style="text-align:center;">���y�渹</th>
<!-- 			<th style="text-align:center;">�B�z���A���s(���s)</th> -->
		</tr>
		<c:set var="lastId" value="0" />
		<c:forEach var='rma' items='${rma}'>
			<tr>
<!-- 			<form > -->
<%-- 				<td><input type="text" readonly="readonly" name="warrantyInfoId" value="${rma.rmaId}"></td> --%>
				<td >${rma.rmanumber}</td>
				<td >${rma.rmadate}</td>
				<td><img src="images/productimages/${rma.warrantyBean.productBean.img1}"></td>		
				<td >${rma.warrantyBean.productBean.name}</td>
				<td >${rma.RMAreason}</td>
<%-- 				<td style="font-size: 12px;">${rma.warrantyBean.memberBean.userId}</td> --%>
				<td >${rma.sendoutaddress}</td>
<%-- 				<td style="font-size: 12px;">${rma.warrantyBean.memberBean.email}</td> --%>
				<td >${rma.receiveproduct}</td>
				
				<c:choose>
					<c:when test="${rma.processingStatus == 0}">
						<td >���e�F</td> <!-- �B�z�i�� -->
					</c:when>
					<c:when test="${rma.processingStatus == 1}">
						<td >�w���� �B�z��</td> <!-- �B�z�i�� -->
					</c:when>	
					<c:when test="${rma.processingStatus >= 2}">
						<td >���~�w�H�X</td> <!-- �B�z�i�� -->
					</c:when>															
				</c:choose>
				
				<td >${rma.sendoutdate}</td> <!-- �e�X��� -->
				<td >${rma.shipmentnumber}</td> <!-- ���y�渹 -->
<%-- 			<td><input type="text" readonly="readonly" value="${rma.processingStatus}"></td> --%>
				
<!-- 				<td><button type="button" class="delete" onclick="">�B�z����</button></td> -->
				
<%-- 				 <td><input type=text readonly="readonly" name="fk_memberid" value="${mbb.productId}">���U�Ǹ����</td> <!-- ���U�Ǹ���� --> --%>

				
			
			</tr>

		</c:forEach>
	</table>
</form>
</div>
</div>
</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- �� CDN �ޥ�, ���}�W���� CDN �����ƻs�Y�i -->
<script>
document.getElementById("file1").addEventListener("change", fileViewer);

function fileViewer() {
	//���o�ϥΪ̦b�ɮ׿�ܼ��Ҥ�����ɮ�

	//1. �إ�FileReader����
	let reader = new FileReader();
	//3.onload���Ū�����\������Ĳ�o
	reader.addEventListener("load", function(e) {
		//4. �N�ɮפ��e�Ȧs
		let fileContent = e.target.result;
		//5. �إ�img����
		let show = document.getElementById("img1");
		//6. �]�wimg��src�ݩ�
		show.setAttribute("src", fileContent);
		//7. �]�wimg��class�ݩ�

		//8. �N img ����s�W��div���ҫ�

	});
	//2. �ϥ�readAsDataURL��k�AŪ���ɮפ��e
	let file = document.getElementById("file1").files[0];
	reader.readAsDataURL(file);

}

$('.xyzFileUpSel').click(function() {
	document.getElementById("file1").click();
	//$("#xyzFileUp").click();
});

</script>
</html>
