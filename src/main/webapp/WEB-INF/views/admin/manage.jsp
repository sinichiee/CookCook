<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Apply</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">
<style>
* {
	font-family: 'NanumSquareNeo';
}
.container {
	width: 70%;
	margin-top: 100px;
}

</style>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	<main>
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<div class="navi">
				<div class="col-12 col-md-8 col-xl-8">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#home-tab-pane"
								type="button" role="tab" aria-controls="home-tab-pane"
								aria-selected="true">Home</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#profile-tab-pane" type="button" role="tab"
								aria-controls="profile-tab-pane" aria-selected="false">회원
								관리 - 판매자</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
								data-bs-target="#contact-tab-pane" type="button" role="tab"
								aria-controls="contact-tab-pane" aria-selected="false">회원 관리 - 이용자</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="disabled-tab" data-bs-toggle="tab"
								data-bs-target="#disabled-tab-pane" type="button" role="tab"
								aria-controls="disabled-tab-pane" aria-selected="false">Disabled</button>
						</li>
					</ul>

					<div class="tab-content" id="myTabContent">
						<!-- Main -->
						<div class="tab-pane fade show active" id="home-tab-pane"
							role="tabpanel" aria-labelledby="home-tab" tabindex="0">
							Main</div>
						<!-- 회원 관리 -->
						<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
							aria-labelledby="profile-tab" tabindex="0">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">ID</th>
											<th scope="col">이름</th>
											<th scope="col">전화번호</th>
											<th scope="col">이메일</th>
											<th scope="col">가입일</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="i" items="${businessMemberDTO}">
										<tr>
											<th scope="row">1</th>
											<td>${i.businessId}</td>
											<td>${i.companyName}</td>
											<td>${i.phone}</td>
											<td>${i.eMail}</td>
											<td>${i.regDate}</td>
											<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">삭제</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								</div>
							</div>
							<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
								aria-labelledby="contact-tab" tabindex="0">~~~~</div>
							<div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel"
								aria-labelledby="disabled-tab" tabindex="0">!!!!</div>
						</div>


					</div>
				</div>
			</div>
	</main>
	<script>
		
	</script>
</body>
</html>