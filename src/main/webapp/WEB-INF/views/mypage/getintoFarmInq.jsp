<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모달바디 시작 -->
<form action="updateintoFarmInq" method="post">
	<div class="row" align="center">
		<h4>농촌속으로 문의 내용</h4>
		<table class="table">
			<tr>
				<th class="table-success">제목</th>
				<td colspan="5">${ilist.into_inq_title }</td>
			</tr>
			<tr>
				<th class="table-success">작성일</th>
				<td>${ilist.into_inq_date }</td>
				<td class="table-success">비밀글</td>
				<td><input class="form-check-input" type="radio"
					id="into_inq_check">사용</td>
				<th class="table-success">작성자</th>
				<th>${ilist.user_id}</th>
			</tr>
			<tr>
				<th class="table-success">내용</th>
				<td colspan="7">${ilist.into_inq_content}</td>
			</tr>
		</table>
	</div>
	<br>
	<div align="center">
		<button class="btn  btn-outline-warning"
			onclick="iQNAupdate('${ilist.into_inq_no}')">수정</button>
		<button type="button" class="btn  btn-outline-danger"
			onclick="deleteAlert('${ilist.into_inq_no }')">삭제</button>
	</div>
</form>
<hr>
<br>

<form>
	<div class="row">
		<div class="col-sm-8">
			<div class="form-group">
				<label class="floating-label">댓글입력</label> <input type="text"
					class="form-control" name="into_inq_rep_content">
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label class="floating-label">아이디입력</label> <input type="text"
					class="form-control" name="user_id">
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<button type="button" id="btnAdd"
					class="btn  btn-outline-success btn-sm">등록</button>
			</div>
		</div>
	</div>
</form>


<div class="row" align="center">
	<h4>댓글</h4>
	<table class="table" id="reply">
		<tr>
			<th class="table-success">No</th>
			<th class="table-success">댓글내용</th>
			<th class="table-success">작성자</th>
			<th class="table-success">날짜</th>
			<th class="table-success">삭제</th>
		</tr>
	</table>

</div>


<!-- 모달바디 끝 -->

<!-- Required Js -->
<script src="resources/admin/js/vendor-all.min.js"></script>
<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
<script src="resources/admin/js/ripple.js"></script>
<script src="resources/admin/js/pcoded.min.js"></script>
<script type="text/javascript">

//문의글 삭제
	function deleteAlert(str) {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			location.href = "deleteintoFarmInq?into_inq_no=" + str;
		} else {
			alert("삭제하지 못하였습니다.  ");
		}
	}

//댓글삭제
	function deleteReply(obj) {
	    if (!confirm("삭제하시겠습니까?")) {
	        return;
	    }
		$.ajax({
			url:'deleteintoFarmReply',
			type: 'post',
			data: { "into_inq_rep_no" : obj },
			success: function(result){
					$("#replyItem").remove();
					 alert("삭제 되었습니다.");

				}
		});
 }
	
	
	//댓글 목록 조회
	$.ajax({
		url: "getintoFarmReplyList",
		data:{ into_inq_no : ${ilist.into_inq_no} },
		dataType:"json",
		success: function(response) {
			for(i=0; i<response.length; i++){
				$("#reply").append(
						"<tr  id='replyItem'><td>" + response[i].into_inq_rep_no + "</td><td>"
						+ response[i].into_inq_rep_content + "</td><td>"
						+ response[i].user_id + "</td><td>"
						+ response[i].into_inq_rep_date + "</td><td>"
						+ "<button type='button' class='btn  btn-outline-danger btn-sm' onclick='deleteReply("+response[i].into_inq_rep_no+")'>" + "삭제" + "</button>"
						+ "</td></tr>"
						
						);
			}
		}
		
	});
	
	//댓글 등록
	$("#btnAdd").on("click", function(){
	$.ajax({
		url:"insertintoFarmReply",
		data:{ into_inq_no : ${ilist.into_inq_no},
				into_inq_rep_content:$("[name=into_inq_rep_content]").val(),
				user_id:$("[name=user_id]").val()
				},	
		dataType:"json",
		success:function(response){
			$("#reply tbody").append(
					"<tr><td>" + response.into_inq_rep_no + "</td><td>"
					+ response.into_inq_rep_content + "</td><td>"
					+ response.user_id + "</td><td>"
					+ response.into_inq_rep_date + "</td></tr>"						
					);
		}

	});		
});

	</script>
