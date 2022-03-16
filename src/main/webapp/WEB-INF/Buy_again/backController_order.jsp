<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Back Controller Order</title>

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

<section style="text-align: center;">
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">�q���ƪ�</h3>
				<div class="col-md-12" style="width: 108%;">
					<form>
						<div class="dashboard-wrapper user-dashboard"    style="background-color:#ffffffb0;border:0px">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>�q��y����</th>
											<th>�q��s��</th>
											<th>�R�a</th>
											<th>����a�}</th>
											<th>�p���q��</th>
											<th>�`���B</th>
											<th>�q�f�ɶ�</th>
											<th style="text-align: center;">�q�����</th>
											<th>�q��i��</th>
											<th>�ק�q��i��</th>
											<th>�R��</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="lastId" value="0" />
										<c:forEach var='order' items='${allorders}'>
											<tr>
												<td style="text-align: center;">${order.orderId}</td>
												<td>${order.orderNo}</td>
												<td>${order.memberBean.name}</td>
												<td style="text-align: left;">${order.address}</td>
												<td>${order.phone}</td>
												<td>$${order.finalPrice}</td>
												<td>${order.orderDate}</td>
												<td style="text-align: center;"><a style="padding:2px 12px" class="btn btn-default" href="findorderdetails.controller?orderId=${order.orderId}"><i class="tf-ion-android-clipboard" aria-hidden="true"></i></a></td>
												<td>
												<select id="orderState${order.orderId}">
												<c:if test="${order.orderState == 0}">
													<option value="0" selected="selected">�ǳƤ�</option>
													<option value="1">�t�e��</option>
													<option value="2">�w�e�F</option>
													<option value="3">�w���</option>
												</c:if>
												<c:if test="${order.orderState == 1}">
													<option value="0">�ǳƤ�</option>
													<option value="1" selected="selected">�t�e��</option>
													<option value="2">�w�e�F</option>
													<option value="3">�w���</option>
												</c:if>
												<c:if test="${order.orderState == 2}">
													<option value="0">�ǳƤ�</option>
													<option value="1">�t�e��</option>
													<option value="2" selected="selected">�w�e�F</option>
													<option value="3">�w���</option>
												</c:if>
												<c:if test="${order.orderState == 3}">
													<option value="0">�ǳƤ�</option>
													<option value="1">�t�e��</option>
													<option value="2">�w�e�F</option>
													<option value="3" selected="selected">�w���</option>
												</c:if>
												</select>
												</td>
												<td><button style="padding:2px 12px;text-align: center;" type="button" class="btn btn-default" onclick="updateorder(${order.orderId})"><i class="tf-pencil2" aria-hidden="true">�ק粒��</i></button></td>
												<td><a title="deltitle" style="padding:2px 12px;text-align: center;" class="btn btn-default" href="deleteorder.controller?orderId=${order.orderId}"><i class="tf-ion-android-delete" aria-hidden="true"></i></a></td>
											</tr>
											<c:set var="lastId" value="${order.orderId + 1}" />
											</c:forEach>
										<tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function updateorder(id) {
		
		var result = confirm('�z�T�w�n��s�������');
		if (result) {
			var params = {
					"id": id,
					"state": $('#orderState'+id).val(),
			}
			
			$.ajax({
				type:'post',
				url:'updateorder2.controller',
				dataType:'JSON', /*�U��*/
				contentType:'application/json', /*�W��*/
				data: JSON.stringify(params),
				success: function(data){ /* �Ǧ^�Ӫ� data �� JSON �}�C */
					$('#orderState'+id).val(
						<c:if test="data == 0}">
							<option value="0" selected="selected">�ǳƤ�</option>
							<option value="1">�t�e��</option>
							<option value="2">�w�e�F</option>
							<option value="3">�w���</option>
						</c:if>
						<c:if test="data == 1}">
							<option value="0">�ǳƤ�</option>
							<option value="1" selected="selected">�t�e��</option>
							<option value="2">�w�e�F</option>
							<option value="3">�w���</option>
						</c:if>
						<c:if test="data == 2}">
							<option value="0">�ǳƤ�</option>
							<option value="1">�t�e��</option>
							<option value="2" selected="selected">�w�e�F</option>
							<option value="3">�w���</option>
						</c:if>
						<c:if test="data == 3}">
							<option value="0">�ǳƤ�</option>
							<option value="1">�t�e��</option>
							<option value="2">�w�e�F</option>
							<option value="3" selected="selected">�w���</option>
						</c:if>
					);
				}
			})
		} else {
			return;
		}
	}
	
	$(document).ready(function() {
		$("a[title='deltitle']").click(function() {
			var yes = confirm('�T�w�n�R��������ƶܡH');
			if (yes) {
				alert('�R�����\');
			} else {
				event.preventDefault();
				alert('�����R��');
			}
		})
	})
	
</script>
</body>
</html>
