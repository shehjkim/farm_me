<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- 모달바디 시작 -->
		<div class="row">
			<div class="col-md-6">
				<div class="card-body">

					<table class="table">
						<tr>
							<th class="table-success" rowspan="2">제목</th>
							<td rowspan="2">${plist.pur_inq_title }</td>
							<th class="table-success">작성일</th>
							<td>${plist.pur_inq_date }</td>
						</tr>
						<tr>
							<th class="table-success">작성자</th>
							<th>${plist.user_id}</th>
						</tr>
						<tr>
							<td colspan="4"><img class="img-fluid card-img-top"
								alt="Card image cap">${plist.pur_inq_filename}</td>
						</tr>
						<tr>
							<td colspan="4">${plist.pur_inq_content }</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card-body">

					<table class="table">
						<tr>
							<th class="table-success">작성자</th>
							<th class="table-success">댓글내용</th>
						</tr>
						<tr>
							<th>ddd</th>
							<th>ddd</th>
						</tr>
					</table>
				</div>
			</div>
			
				<div align="center">
					<button class="btn  btn-outline-warning" onclick="pQNAupdate('${plist.pur_inq_no}')">수정</button>
					<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${plist.pur_inq_no }')">삭제</button>
				</div>
		</div>	
		
	
	

	<!-- 모달바디 끝 -->

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript">
	function deleteAlert(str) {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			location.href = "deletepuchasInq?pur_inq_no=" + str;
		} else {
			alert("삭제하지 못하였습니다.  ");
		}
	}
	</script>
