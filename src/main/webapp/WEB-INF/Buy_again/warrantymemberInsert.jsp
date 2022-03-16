<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     --%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Buy again | ���U���~</title>

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


</head>

<body id="body">
<!--���s��-->
<jsp:include page="title.jsp" />

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center" style="margin: 0px;">
          <h2 class="text-center">���U���~</h2>
          <form class="text-left clearfix" action="Warrantyinsert2.controller" method="post" enctype="multipart/form-data">
          	
			<!--�j�Y�K�W�� -->
<!--           	<div style="height:300px; width:300px; position:absolute; top:100; right:550px; text-align:center"> -->
              	
<!--               	<div id="dropZone" > -->
<!-- 					<img id="img1" src="/images/memberimages/defaultpicture.jpg" style="height: 150px ; width: 150px;"/> -->
<!--     			</div> -->
   				
<!--    				<div  style="display: none;"> -->
<%--    					<input type="file" id="file1" name="picture" multiple="multiple" onchange="fileViewer();" value="${pic}"/><br/> --%>
<!--     			</div> -->
<!--     				<div class="xyzFileUpSel"> -->
<!-- 						<button type="button" class="btn btn-outline-dark">��ܤj�Y�K</button> -->
<!-- 					</div> -->
<c:set var="lastId" value="0" />





<%-- 		<c:forEach var='mbb' items='${allmbb}'> --%>
     
            <div class="form-group">
            	<p style="font-size: 15px"><b>�|���b��:</b>
              	<input type="text" class="form-control" readonly="readonly" name="userId" placeholder="" value="${memlogin.userId}">
            </div>
<%--             <c:forEach var='ord' items='${mbb.orderdetails}'>    --%>
            <div class="form-group">
            	<p style="font-size: 15px"><b>�����U�����~�Ϥ� :</b>
            	<img src="images/productimages/${productRegisterBean.productBean.img1}" height="100px">
            </div>
            <div class="form-group">
            	<p style="font-size: 15px"><b>�����U�����~�W�� :</b>
              	<input type="text" class="form-control" readonly="readonly" name="password" placeholder="" value="${productRegisterBean.productBean.name}">
            </div>
             <div class="form-group">
            	<p style="font-size: 15px"><b>�����U�����~�Ǹ� :</b>
              	<input type="text" class="form-control" readonly="readonly" name="registerid" placeholder="" value="${productRegisterBean.licenseKey}">
            </div>
<!--             <div class="form-group"> -->
<!--             <p style="font-size: 15px"><b>�ӫ~�ʶR��� :</b> -->
<!--               	<input type="text" class="form-control" readonly="readonly" name="name" placeholder="" value=""> -->
<!--             	</div> -->
             <div class="form-group">
            <p style="font-size: 15px"><b>�|���ʺ� :</b>
              	<input type="text" class="form-control" readonly="readonly" name="name" placeholder="" value="${memlogin.name}" >
            	</div>
             <div class="form-group">
            <p style="font-size: 15px"><b>�|���H�c</b>
              	<input type="text" class="form-control" readonly="readonly" name="name" placeholder="" value="${memlogin.email}">
            	</div>
<!--           hidden�� -->
 			<div class="text-center">
              <button type="submit" class="btn btn-main text-center">��ƵL�~�A�i����U</button>
            </div>
           
				<input type="hidden" class="form-control" name="imgtest" placeholder=""  value="${productRegisterBean.productBean.img1}">
            	<p style="font-size: 15px"><b> </b>
              	<input type="hidden" class="form-control" name="fk_member" placeholder="�|���ϥ~��ǭ�"  value="${memlogin.memberId}">
            </div>
            
            <div class="form-group">
            	<p style="font-size: 15px"><b> </b>
              	<input type="hidden" class="form-control" name="fk_productorder" placeholder="�ӫ~�ϥ~��ǭ�" value="${productRegisterBean.productBean.productId}">  
            </div>
            	<td>
            	<c:choose>
				<c:when test="${productRegisterBean.productBean.productSortBean.sortId == 1}">
				<input type="hidden" class="form-control" name="setTimeEnd" placeholder="���U�ɶ�����" value="2026-12-16"> 
				</c:when>
				<c:when test="${productRegisterBean.productBean.productSortBean.sortId == 2}">
				<input type="hidden" class="form-control" name="setTimeEnd" placeholder="���U�ɶ�����" value="2024-12-16"> 
				</c:when>	
				<c:when test="${productRegisterBean.productBean.productSortBean.sortId == 3}">
				<input type="hidden" class="form-control" name="setTimeEnd" placeholder="���U�ɶ�����" value="2031-12-16"> 
				</c:when>	
				<c:when test="${productRegisterBean.productBean.productSortBean.sortId == 4}">
				<input type="hidden" class="form-control" name="setTimeEnd" placeholder="���U�ɶ�����" value="2024-12-16">
				</c:when>	
				<c:when test="${productRegisterBean.productBean.productSortBean.sortId == 5}">
				<input type="hidden" class="form-control" name="setTimeEnd" placeholder="���U�ɶ�����" value="2023-12-16">
				</c:when>															
				</c:choose>
				</td>
            </div>
<%--             </c:forEach> --%>
<!--               <div class="form-group"> -->
<!--             	<p style="font-size: 15px"><b> </b> -->
              	<input type="hidden" class="form-control" name="setTimestart" placeholder="���U�ɶ��_�l" value="2021-12-12"> 
<!--             </div> -->
            
<%--            <c:set var="lastId" value="${product.productId}" /> --%> 
<%-- 		</c:forEach> --%>
	
          </form>
        </div>
      </div>
    </div>
  </div>
              </div>  
              
</section>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    <script>
        document.getElementById("file1").addEventListener("change", fileViewer);

        function fileViewer() {
            //���o�ϥΪ̦b�ɮ׿�ܼ��Ҥ�����ɮ�

            //1. �إ�FileReader����
            let reader= new FileReader();
            //3.onload���Ū�����\������Ĳ�o
            reader.addEventListener("load", function (e) {
                //4. �N�ɮפ��e�Ȧs
                let fileContent = e.target.result;
                //5. �إ�img����
                let show = document.getElementById("img1");
                //6. �]�wimg��src�ݩ�
                show.setAttribute("src",fileContent);
                //7. �]�wimg��class�ݩ�

                //8. �N img ����s�W��div���ҫ�

            });
            //2. �ϥ�readAsDataURL��k�AŪ���ɮפ��e
            let file =document.getElementById("file1").files[0];
            reader.readAsDataURL(file);

        }
        
        $('.xyzFileUpSel').click(function () {
            document.getElementById("file1").click();
            //$("#xyzFileUp").click();
        });
    </script> 


  </body>
  </html>