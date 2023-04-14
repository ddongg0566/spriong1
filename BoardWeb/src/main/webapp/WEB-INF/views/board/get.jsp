<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board Read Page
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>Bno</label>
					<input class="form-control" type="text" name="bno" value="${board.bno }" readonly>

				</div>
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" type="text" name="title" value="${board.title }" readonly>

				</div>
				<div class="form-group">
					<label>Writer</label>
					<input class="form-control" type="text" name="writer" value="${board.writer }" readonly>

				</div>
				<div class="form-group">
					<label>Text Area</label>
					<textarea class="form-control" name="content">${board.content}</textarea>

				</div>
				<button data-oper="modify" class="btn btn-default">Modify</button>

				<button data-oper="list" class="btn btn-default]">List</button>

				<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value="${board.bno}">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="type" value="${cri.type}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!--  댓글목록 페이지 추가 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2023-04-03 13:20</small>
							</div>
							<p>good</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/reply.js">
</script>
<script>
	$(document).ready(function () {
		var operForm = $('#operForm');
		$('button[data-oper="modify"]').on('click', function () {

			operForm.attr('action', '/board/modify').submit();
		})
		$('button[data-oper="list"]').on('click', function () {
			operForm.find('#bno').remove()
			operForm.attr('action', '/board/list')
			operForm.submit();
		})
		// replyService 사용., 등록할때
		/* replyService.add({bno:300, reply:'reply test', replyer:'user00'}, function(result){
			alert("Result: "+ result);
		}) */

		//목록
		//원본글번호, 페이지)(3)
		var bnoValue = "${board.bno}";
		var replyUl = $('.chat');

		showList("1");

		function showList(page) {


			replyService.getList({
				bno: bnoValue,
				page: page
			}, function (list) {
				if (list == null || list.length == 0) {
					replyUl.html("");
					return;
				}
				var str = "";
				for (var i = 0; i < list.length; i++) {
					console.log(list[i])
					str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
					str += "<div><div class='header'><strong class='primary-font'>" + list[i].replyer +
						"</strong>";
					str += " <small class = 'pull-right text-muted'>" + replyService.displayTime(list[i]
						.replydate) + "</small></div>";
					str += "<p>" + list[i].reply + "</p></div></li>";

				}
				replyUl.html(str);

			}, function (result) {
				console.log(result);

			});
		}
	})
</script>

<jsp:include page="../includes/footer.jsp"></jsp:include>