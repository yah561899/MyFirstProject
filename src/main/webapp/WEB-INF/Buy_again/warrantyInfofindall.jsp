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
		height: 26px;
		text-align: center;
    	border: 0px;
    	background-color: #f9f9f900;
	}
/* 	.email, .regisDate{ */
/* 		width: 200px; */
/* 	} */
/*  	table, tr, th, td{  */
/* 		margin: 10px auto;  */
/*  		text-align: center; */
/*  		vertical-align:middle; */
/*  	}  */
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
		width:20px;
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

<form id="form1" action="deletewarranty.controller" method="Post">
<h3 style="text-align: center;">�|���O�T��ƺ޲z��</h3>
<div class="dashboard-wrapper user-dashboard" style="border:0px;margin-top:0px">
	<div class="table-responsive">
	<table class="table">
			<thead style="background-color:#ffffffb0">
				<tr style="text-align: center;">
					<th style="text-align:center;padding: 6px;">�s��</th>
					<th style="text-align:center;padding: 6px;">�|���b��</th>
					<th style="text-align:center;padding: 6px;">�Ϥ�</th>
					<th style="text-align:center;padding: 6px;">�~�W</th>
					<th style="text-align:center;padding: 6px;">�|���q��</th>
					<th style="text-align:center;padding: 6px;">�|���H�c</th>
					<th style="text-align:center;padding: 6px;">�ӫ~���O</th>
					<th style="text-align:center;padding: 6px;">�|���a�}</th>	
					<th style="text-align:center;padding: 6px;">���U�Ǹ�</th>
					<th style="text-align:center;padding: 6px;">�O�T���A</th>
					<th style="text-align:center;padding: 6px;">���~���U�ɶ�</th>
					<th style="text-align:center;padding: 6px;">�O�T������</th>
					<th style="text-align:center;padding: 6px;">�o��</th>
					<th style="text-align:center;padding: 6px;">�ק�O�T��</th>
					<th style="text-align:center;padding: 6px;">���P�O�T</th>
				</tr>
			</thead>
			<tbody style="background-color:#ffffffb0">
				<c:set var="lastId" value="0" />
		<c:forEach var='mbb' items='${warranty}'>
			<tr>
				<td style="text-align:center;vertical-align:middle;padding: 6px;"><input style="width: 30px;" type="text" readonly="readonly" name="warrantyInfoId" value="${mbb.warrantyInfoId}"></td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.memberBean.userId}</td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;"><img src="images/productimages/${mbb.productBean.img1}"></td>		
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.productBean.name}</td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.memberBean.phone}</td>
				<td style="text-align:center;vertical-align:middle;padding: 6px;">${mbb.memberBean.email}</td>	
				
<%-- 				<td style="text-align:center;vertical-align:middle;">${mbb.productBean.productSortBean.sortId}</td>						 --%>
					<c:choose>
							<c:when test="${mbb.productBean.productSortBean.sortId == 1}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">��ܥd</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 2}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">�B�z��</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 3}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">�O����</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 4}">
								<td style="text-align:center;vertical-align:middle;padding: 6px;">�D���O</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 5}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">�w��</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 6}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">�ù�</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 7}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">��L</td>
							</c:when>
							<c:when test="${mbb.productBean.productSortBean.sortId == 8}">
							    <td style="text-align:center;vertical-align:middle;padding: 6px;">�ƹ�</td>
							</c:when>
						</c:choose>
				
				
				<td style="text-align:center;vertical-align:middle;padding: 6px;"><div class="box"><p class="ellipsis">${mbb.memberBean.address}</p></div></td>
				<td style="vertical-align:middle;padding: 6px;"><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td>
				<td style="vertical-align:middle;padding: 6px;">
					<c:choose>
						<c:when test="${mbb.registerStatus != 0}">
							<i class="tf-ion-android-radio-button-on"><p>�O�T���`</p></i>
						</c:when>
						<c:when test="${mbb.registerStatus == 0}">
							<i style="color: red" class="tf-ion-android-radio-button-on"><p>���P�O�T</p></i>
						</c:when>															
					</c:choose>
				</td>
				<input type="hidden" readonly="readonly" name="registerStatus" value="${mbb.registerStatus}">
				<td style="vertical-align:middle;padding: 6px;"><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td>
				<td style="vertical-align:middle;padding: 6px;"><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td>
				<td style="vertical-align:middle;padding: 6px;"><img src="/images/warrantyimages/${mbb.invoice}" id="img1" ></td>
				<td style="vertical-align:middle;padding: 6px;"><a class="btn btn-default" href="updatewarranty.controller1?warrantyInfoId=${mbb.warrantyInfoId}">�ק�O�T���</a></td>
				<td style="vertical-align:middle;padding: 6px;"><a class="btn btn-default" href="#!" onclick="formsubmit(${mbb.warrantyInfoId})">���P�O�T</a></td>
				<input type=hidden readonly="readonly" name="fk_memberid" value="${mbb.memberBean.memberId}"></td>
				<input type="hidden" readonly="readonly" name="fk_productId" value="${mbb.productBean.productId}">
				<input type="hidden" readonly="readonly" name="pekoimgpekoimg" value="${mbb.invoice}">
				<input type="hidden" readonly="readonly" name=mbbregisterid value="${mbb.registerid}">
			</tr>
		</c:forEach>
		<input type="hidden" readonly="readonly" id="id" name="id" value="">
		<c:forEach var='registerid' items='${warranty}'>
	<input type="hidden" readonly="readonly" name="registerid2" value="${registerid.registerid}">
	</c:forEach>


			</tbody>
		</table>
	</div>
</div>
</form>
</body>

<!-- 	<table border='1'  > -->
<!-- 		<tr height="40px" align="center"><th colspan='11' style="text-align:center;">�|���O�T��ƺ޲z��</th></tr> -->
<!-- 		<tr height="40px"> -->
<!-- 			<th style="text-align:center;">�s��</th> -->
<!-- 			<th style="text-align:center;">�|���b��</th> -->
<!-- 			<th style="text-align:center;">�ӫ~�Ϥ�</th> -->
<!-- 			<th style="text-align:center;">�ӫ~�W��</th> -->
<!-- 			<th style="text-align:center;">�|���q��</th> -->
<!-- 			<th style="text-align:center;">�|���H�c</th> -->
<!-- 			<th style="text-align:center;">�ӫ~���O</th> -->
<!-- 			<th style="text-align:center;">�|���a�}</th>	 -->
<!-- 			<th style="text-align:center;">���U�Ǹ�</th> -->
<!-- 			<th style="text-align:center;">���~�O�T���A</th> -->
<!-- 			<th style="text-align:center;">���~���U�ɶ�</th> -->
<!-- 			<th style="text-align:center;">���~�O�T������</th> -->
<!-- 			<th style="text-align:center;">�|���W�ǵo��</th> -->
<!-- 			<th style="text-align:center;">�ק�O�T��</th> -->
<!-- 			<th style="text-align:center;">���P�O�T</th> -->
<!-- 		</tr> -->
<%-- 		<c:set var="lastId" value="0" /> --%>
<%-- 		<c:forEach var='mbb' items='${warranty}'> --%>
<!-- 			<tr> -->
<!-- 			<form > -->
<%-- 				<td><input type="text" readonly="readonly" name="warrantyInfoId" value="${mbb.warrantyInfoId}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.memberId}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.userId}"></td> --%>
<%-- 				<td><img src="images/productimages/${mbb.productBean.img1}"></td>		 --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.productBean.name}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.phone}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.email}"></td>	 --%>
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.productBean.productSortBean.sortId}"></td>		 --%>
<%-- 				<c:choose> --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 1}"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="��ܥd"></td> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 2"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="�B�z��"></td> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 3"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="�O����"></td> -->
<%-- 				</c:when>		 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 4"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="�D���O"></td> -->
<%-- 				</c:when>			 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 5"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="�w��"></td> -->
<%-- 				</c:when>		 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 6"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="�ù�"></td> -->
<%-- 				</c:when>	 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 7"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="��L"></td> -->
<%-- 				</c:when>				 --%>
<%-- 				<c:when test="${mbb.productBean.productSortBean.sortId == 8"> --%>
<!-- 				<td><input type="text" readonly="readonly" value="�ƹ�"></td> -->
<%-- 				</c:when> --%>
<%-- 				</c:choose> --%>
				
<%-- 				<td><input type="text" readonly="readonly" value="${mbb.memberBean.address}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" name="registerid" value="${mbb.registerid}"></td> --%>
<%-- 				<td><c:choose> --%>
<%-- 				<c:when test="${mbb.registerStatus != 0}"> --%>
<!-- 				<li><p>�O�T���`</p></li> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${mbb.registerStatus == 0}"> --%>
<!-- 				<li><p>���P�O�T</p></li> -->
<%-- 				</c:when>															 --%>
<%-- 				</c:choose></td> --%>
				
<%-- 				<input type="hidden" readonly="readonly" name="registerStatus" value="${mbb.registerStatus}"> --%>
				
				
<%-- 				<td><input type="text" readonly="readonly" name="registerStart" value="${mbb.registerStart}"></td> --%>
<%-- 				<td><input type="text" readonly="readonly" name="registerFinish" value="${mbb.registerFinish}"></td> --%>
				
<%-- 				<td><img src="/images/warrantyimages/${mbb.invoice}" id="img1" ></td> --%>
<%-- 				<td><button type="button" class="update"><a href="updatewarranty.controller1?warrantyInfoId=${mbb.warrantyInfoId}">�ק�O�T���</a></button></td> --%>
				
<%-- 				<td><button type="button" class="delete" onclick="formsubmit(${mbb.warrantyInfoId})">���P�O�T</button></td> --%>
<%-- 				 <td><input type=hidden readonly="readonly" name="fk_memberid" value="${mbb.memberBean.memberId}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name="fk_productId" value="${mbb.productBean.productId}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name="pekoimgpekoimg" value="${mbb.invoice}"></td> --%>
<%-- 				<td><input type="hidden" readonly="readonly" name=mbbregisterid value="${mbb.registerid}"></td> --%>
				
				
			
<!-- 			</tr> -->
<%-- 			<c:set var="lastId" value="${product.productId}" /> --%>
<%-- 		</c:forEach> --%>
<!-- 		<input type="hidden" readonly="readonly" id="id" name="id" value=""> -->
		
<!-- 		<tr> -->
<%-- 			<td><input type="text" readonly="readonly" value="${lastId + 1}"></td> --%>
<!-- 			<td colspan='11'><button type="button" class="insertProduct"><a href="insertproduct.controller">�s�W�ӫ~</a></button></td> -->
<!-- 			<td colspan='2'></td> -->
<!-- 		</tr> -->
<!-- 		</form> -->
<%-- <c:forEach var='registerid' items='${warranty}'> --%>
<%-- <td><input type="hidden" readonly="readonly" name="registerid2" value="${registerid.registerid}"></td> --%>
<%-- </c:forEach> --%>
<!-- 	</table> -->
<!-- </form> -->

<!-- </body> -->
<script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous">
</script> <!-- �� CDN �ޥ�, ���}�W���� CDN �����ƻs�Y�i -->
<script>
$(function(){
    var len = 50; // �W�L50�Ӧr�H"..."���N
    $(".JQellipsis").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"...";
            $(this).text(text);
        }
    });
});


	
	
	
	function formsubmit(id){
		var r = confirm("�T�{�n���P�����~�O�T?")
		if(r == true){ 
		$("#id").val(id);
			document.getElementById("form1").submit();
			alert("�w���P�����~�O�T");
		}
		else {
			alert("�w�����ާ@");
		}
	}
	
		
		
		
		
	
		
	
		
	

</script>
</html>
