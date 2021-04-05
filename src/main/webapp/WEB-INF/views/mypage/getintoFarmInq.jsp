<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- 모달바디 시작 -->
		<div class="row" align="center">
					<table class="table">
						<tr>
							<th class="table-success">제목</th>
							<td colspan="5">${ilist.into_inq_title }</td>
						</tr>
						<tr>
							<th class="table-success">작성일</th>
							<td>${ilist.into_inq_date }</td>
							<td class="table-success">비밀글</td>
							<td><input class="form-check-input" type="radio" id="into_inq_check">사용</td>
							<th class="table-success">작성자</th>
							<th>${ilist.user_id}</th>
						</tr>
						<tr>
							<th class="table-success">내용</th>
							<td colspan="7">
								${ilist.into_inq_content}
							</td>
						</tr>
					</table>
					<br>
					댓글내용
					<div id="reply"></div> 
  					<table class="table">
						<tr>
							<th class="table-success">댓글</th>
						</tr>
						<tr>
							<th>ddd</th>
						</tr>
					</table>
				
				<div align="center">
					<button class="btn  btn-outline-warning" onclick="iQNAupdate('${ilist.into_inq_no}')">수정</button>
					<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${ilist.into_inq_no }')">삭제</button>
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
			location.href = "deleteintoFarmInq?into_inq_no=" + str;
		} else {
			alert("삭제하지 못하였습니다.  ");
		}
	}
	
	//댓글 목록 조회
	$.ajax({
		url: "getintoFarmReplyList",
		data:{ pur_inq_no : ${ilist.into_inq_no} },
		dataType:"json",
		success: function(response) {
			for(i=0; i<response.length; i++){
				$("#reply").append(response[i].user_id 
						+ response[i].into_inq_rep_content 
						+ response[i].into_inq_rep_date						
						+"<br>");
			}
		}
		
	});
	
	</script>
