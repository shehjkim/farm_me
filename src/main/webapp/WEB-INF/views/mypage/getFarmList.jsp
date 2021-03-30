<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../mypage/adminMenu.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>나의 농지 리스트</title>
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
 <style>
 table{
 text-align: center;
  }
 
 </style>  
</head>
<body>
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<section class="pcoded-main-container">
				<div class="col-md-10" align="center">
                	<div class="card">
                    <div class="card-header">
						<h5>나의 농지 리스트</h5>
					</div>
					<div class="card-body">
						<div id="gridSystemModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								
									<div class="modal-header">
										<h5 class="modal-title" id="gridModalLabel">${farm.farm_name }</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">
													<h3 align="center">${farm.farm_name }</h3>
												</h5>
												<p class="card-text"></p>
												<p class="card-text">
													<small class="text-muted">
														<table class="table" align="center">
															<tr>
																<th class="table-success">No</th>
																<td name="farm_no">${farm.farm_no }</td>
																<th class="table-success">면적</th>
																<td name="farm_area">${farm.farm_area }</td>
																
															</tr>
															<tr>
																<th class="table-success">주소</th>
																<td colspan="3" name="farm_adr">${farm.farm_adr }</td>
															</tr>
															<tr>
																<th class="table-success">소개</th>
																<td colspan="3" name="farm_content">${farm.farm_content }</td>
															</tr>
														</table>
													</small>
												</p>
											</div>
											<!-- 사진파일 들어와야함!!! -->
											<img class="img-fluid card-img-bottom"
												src="resources/admin/images/slider/img-slide-6.jpg" 
												alt="Card image cap">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn  btn-outline-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body table-border-style">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>농장이름</th>
											<th>주소</th>
											<th>면적</th>
											<th>상세</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${farmlist }" var="fa">
										<tr class="table-success">
											<th>${fa.farm_no }</th>
											<th>${fa.farm_name }</th>
											<th>${fa.farm_adr }</th>
											<th>${fa.farm_area }</th>
											<th><button type="button" class="btn  btn-outline-success" data-toggle="modal" data-target="#gridSystemModal">보기</button>
												<button type="submit" class="btn  btn-outline-warning" onclick="updateAlert('${fa.farm_no }')"">수정</button>
												<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${fa.farm_no }')">삭제</button>
											</th>
										</tr>
									 </c:forEach>
									   
									</tbody>
								</table>
								<div class="col-md-12" align="center">	
									<button type="button" class="btn  btn-outline-success" onclick="location.href='insertFarm'">등록</button>
									<button type="button" class="btn  btn-outline-danger">취소</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</section>
</div>
</div>

    <!-- Required Js -->
    <script src="resources/admin/js/vendor-all.min.js"></script>
    <script src="resources/admin/js/plugins/bootstrap.min.js"></script>
    <script src="resources/admin/js/ripple.js"></script>
    <script src="resources/admin/js/pcoded.min.js"></script>
	<script>
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var recipient = button.data('whatever')
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
	})
</script>
<script type="text/javascript">

	function deleteAlert(str) {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			location.href = "deleteFarm?farm_no=" + str;
		} else {
			alert("삭제하지 못하였습니다.  ");
		}
	}

	function updateAlert(str) {
		location.href = "updateFarm?farm_no" + str;
	}
</script>

</body>
</html>