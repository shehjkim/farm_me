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
							<td rowspan="2">
							<input type="text" id="pur_inq_title" placeholder="${pupdate.pur_inq_title }"></td>
							<th class="table-success">작성일</th>
							<td>${pupdate.pur_inq_date }</td>
						</tr>
						<tr>
							<th class="table-success">작성자</th>
							<th>${pupdate.user_id}</th>
						</tr>
						<tr>
							<td colspan="4">
							<input type="file" id="pur_inq_filename" placeholder="${pupdate.pur_inq_filename}"></td>
						</tr>
						<tr>
							<td colspan="4">${pupdate.pur_inq_content }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		

	<!-- 모달바디 끝 -->

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
