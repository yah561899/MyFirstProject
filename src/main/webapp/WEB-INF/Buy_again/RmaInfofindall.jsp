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
/* /* 	} */ 
	button{ 
 		width: 90px;
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
	#tab{
	background-color:#ffffffb0;
	text-align:center;
	padding: 5px;
	padding-top: 10px;
	vertical-align:inherit;
	}
  </style>
  
</head>

<body id="body" background="/images/background.png" style=" background-attachment: fixed;" >

<!--���s��-->
<jsp:include page="managertitle.jsp" />

<form id="form1" action="Rmafinish1.controller" method="Post">
	<table class="table" style="vertical-align: inherit;">
		<tr height="40px" align="center">
<!-- 			<th colspan='11' style="text-align:center;">�|��RMA��ƺ޲z��</th></tr> -->
		<tr height="40px">
			<th id="tab">RMA�s��</th>
			<th id="tab">RMA�渹</th>
			<th id="tab">RMA���</th>
			<th id="tab">RMA�Ϥ�</th>
			<th id="tab">RMA���~�W��</th>
			<th id="tab">RMA��]</th>
			<th id="tab">�|���b��</th>
			<th id="tab">�H�e�a�}</th>
			<th id="tab">�|���H�c</th>	
			<th id="tab">����RMA���~���</th>
			<th id="tab">�B�z���A</th>
			<th id="tab">�H�X���</th>
			<th id="tab">���y�渹</th>
			<th id="tab">�B�z���A�s</th>
		</tr>
<%-- 		<c:set var="lastId" value="0" /> --%>
		<c:forEach var='mbb' items='${rmabean}' varStatus="status">
			<tr>
<!-- 			<form > -->
				<td id="tab">${mbb.rmaId}</td>
				<td id="tab">${mbb.rmanumber}</td>
				<td id="tab">${mbb.rmadate}</td>
				<td id="tab"><img src="images/productimages/${mbb.warrantyBean.productBean.img1}"></td>		
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.warrantyBean.productBean.name}"></td> --%>
				<td id="tab">${mbb.warrantyBean.productBean.name}</td>
				<td id="tab">${mbb.RMAreason}</td>
				<td id="tab">${mbb.warrantyBean.memberBean.userId}</td>
				<td id="tab">${mbb.sendoutaddress}</td>
				<td id="tab">${mbb.warrantyBean.memberBean.email}</td>
				<td id="tab">${mbb.receiveproduct}</td>
				
				<c:choose>
					<c:when test="${mbb.processingStatus == 0}"> <!-- �B�z�i�� -->
						<td id="tab">�����첣�~</td> <!-- �B�z�i�� -->
					</c:when>
					
					<c:when test="${mbb.processingStatus == 1}">
						<td id="tab">�w���� �B�z��</td> <!-- �B�z�i�� -->
					</c:when>	
					
					<c:when test="${mbb.processingStatus >= 2}">
						<td id="tab">RMA���~�w�H�X</td> <!-- �B�z�i�� -->
					</c:when>															
				</c:choose>
				<td id="tab">${mbb.sendoutdate }</td> <!-- �e�X��� -->
				<td id="tab">${mbb.shipmentnumber}</td> <!-- ���y�渹 -->
					
				<c:choose>
					<c:when test="${mbb.processingStatus == 0}"> <!-- �B�z�i�� -->
						<td id="tab"><button style="padding: 4px 8px;" type="button" class="btn btn-default"  name="id"	onclick="formsubmit(${mbb.rmaId})">�w���첣�~</button></td> <!-- �B�z�i�� -->
					</c:when>
					
					<c:when test="${mbb.processingStatus >= 1}">
						<td id="tab"><button style="padding: 4px 8px;" type="button"class="btn btn-default" onclick="formsubmit1(${mbb.rmaId})" >�B�z����</button></td> <!-- �B�z�i�� -->
					</c:when>	
				</c:choose>
				
				<input type=hidden readonly="readonly" name="fk_memberid" value="${mbb.productId}">
				  <!-- ���U�Ǹ���� -->
<%-- 				<td><input type="hidden" readonly="readonly" name="fk_productId" value="${mbb.productBean.productId}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name="pekoimgpekoimg" value="${mbb.invoice}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name=mbbregisterid value="${mbb.registerid}"></td> --%>
				
				<input type="hidden"  id="id" name="id" value="">
			
			</tr>
<%-- 			<c:set var="lastId" value="${product.productId}" /> --%>
		</c:forEach>
<%-- 		<input type="hidden" readonly="readonly" id="id" name="processingStatus" value="${mbb.processingStatus}"> --%>
			<input type="hidden" readonly="readonly"  name="date1" value="2021-12-16">
			
<!-- 		<tr> -->
<%-- 			<td><input type="text" readonly="readonly" value="${lastId + 1}"></td> --%>
<!-- 			<td colspan='11'><button type="button" class="insertProduct"><a href="insertproduct.controller">�s�W�ӫ~</a></button></td> -->
<!-- 			<td colspan='2'></td> -->
<!-- 		</tr> -->
<!-- 		</form> -->
	</table>
</form>
</body>
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- �� CDN �ޥ�, ���}�W���� CDN �����ƻs�Y�i -->
<script>

// function formsubmit(id){
// 	 $("#id").val(id);
// 		document.getElementById("form1").submit();
// 		alert("��s�B�z���A");
// // 		alert($("#id").val());
// }

function formsubmit(id){
	var r = confirm("��s���A�w�����첣�~?")
	if(r == true){ 
	$("#id").val(id);
		document.getElementById("form1").submit();
		alert("��s�B�z���A");
	}
	else {
		alert("�w�����ާ@");
	}
}

function formsubmit1(id){
	var r = confirm("�B�z�����A�T�{�e�X?")
	if(r == true){ 
	$("#id").val(id);
		document.getElementById("form1").submit();
		alert("��s�B�z���A");
	}
	else {
		alert("�w�����ާ@");
	}
}
</script>
</html>
