<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../mypage/adminMenu.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원 탈퇴</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/admin/css/style.css">
    
    

</head>
<body>
	<section class="pcoded-main-container">
    <!-- [ Main Content ] start -->
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->
            <!-- [ Main Content ] start -->
            <div class="row">
                <!-- [ vertically-modal ] start -->
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body" align="center">

                            <!-- [ Contextual-table ] start -->
                            <div class="col-md-9">
                                <div class="card-header">
                                    <h2>구매 내역</h2>
                                </div>
								<div class="card-body table-border-style">
										<div class="table-responsive">
											<table class="recruit">
												<thead>
													<tr class="table-success">
														<th>주문일자/주문번호</th>
														<th>주문상품</th>
														<th>결제수단/총금액</th>
														<th>주문상태
													</tr>
												</thead>
												<tbody>
										<c:forEach items="${list }" var="od">									
												<tr class="title">
													<td>${od.order_date }<br>
														${od.order_no }</td>
													<td>주문상품</td>
													<td>${od.order_payment}<br>
														${od.order_totalprice }</td>
													<td>${od.order_condition }</td>
													<td class="hiddenRow">
														<div class="accordian-body collapse" id="123">More Content</div>
													</td>
												</tr>
												<tr class=hide>
												<td>dfsfs</td>
												</tr>									
										</c:forEach>
											</tbody>
											</table>
										</div>
								</div>
                            </div>
                        </div>
                        <!-- [ vertically-modal ] end -->
                    </div>


                </div>



            </div>
        </div>
</div>
</section>

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript"> 
			$(function(){
				var article = (".recruit .show"); 
				$(".recruit .title  td").click(function() { 
					var myArticle =$(this).parents().next("tr"); 
					if($(myArticle).hasClass('hide')) { 
						$(article).removeClass('show').addClass('hide'); 
						$(myArticle).removeClass('hide').addClass('show'); 
					} 
					else { 
						$(myArticle).addClass('hide').removeClass('show'); 
					} 
				}); 
			});
	</script>
</body>
</html>