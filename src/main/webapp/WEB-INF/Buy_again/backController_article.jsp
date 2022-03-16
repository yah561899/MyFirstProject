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
		width: 200px;
		height: 50px;
		overflow: hidden;
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

<!--���s��-->
<jsp:include page="managertitle.jsp" />

<section>
		<div class="container">
			<div class="row">
				<h3 style="text-align: center;">�峹��ƪ�</h3>
				<div class="col-md-12">
					<form>
						<div class="dashboard-wrapper user-dashboard" style="background-color:#ffffffb0;border:0px">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align: center;">�峹�s��</th>
											<th style="text-align: center;">�峹���O</th>
											<th style="text-align: center;">���D</th>
											<th style="text-align: center;">�o���</th>
											<th style="text-align: center;">���e�w��</th>
											<th style="text-align: center;">�o���ɶ�</th>
											<th style="text-align: center;">�޲z�峹</th>
											<th style="text-align: center;">�R��</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="lastId" value="0" />
										<c:forEach var='article' items='${allarticles}'>
											<tr style="text-align: center;">
												<td>${article.articleId}</td>
												<td>${article.articleSortBean.sortName}</td>
												<td>${article.header}</td>
												<td>${article.memberBean.name}</td>
												<td style="text-align: center;" ><div class="box"><p class="ellipsis">${article.content}</p></div></td>
												<td>${article.registerDate}</td>
												<td><a class="btn btn-default" href="updatearticle.controller?articleId=${article.articleId}"><i class="tf-ion-ios-book" aria-hidden="true"></i></a></td>
												<td><a title="deltitle" class="btn btn-default" href="deletearticle.controller?articleId=${article.articleId}"><i class="tf-ion-android-delete" aria-hidden="true"></i></a></td>
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
