<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="path" value="${pageContext.request.contextPath}" />


        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <!-- JQuery-->
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <!-- Bootstrap - CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <!-- Bootstrap - JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
            <!-- Bootstrap - icon -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
            <!-- Font 기본 : {font - family: 'NanumSquareNeoBold'}-->
            <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
            <!-- awesome font -icon -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

            <!-- gnb css -->
            <link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">

            <style>
                * {
                    font-family: NanumSquareNeo;
                }

                input {
                    border-radius: 5px;
                    padding: 5px;
                }

                .container {
                    margin-top: 100px;
                    border: 1px solid black;
                }

                .table th,
                td {
                    font-size: 18px;
                }

                .uu,
                td>div {
                    text-align: center;
                }
            </style>

        </head>

        <body>
            <c:import url="../commons/gnb.jsp">
            </c:import>



            <div class="container">


                <br>
                <div class="header position-relative">



                    <div class="checkbox">

                                
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="check1" name="freeCategory"
                                value="2001">
                            <label class="form-check-label" for="inlineCheckbox1">일상</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="check2" name="freeCategory"
                                value="2002">
                            <label class="form-check-label" for="inlineCheckbox2">정보</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="check3" name="freeCategory"
                                value="2003">
                            <label class="form-check-label" for="inlineCheckbox3">질문</label>
                        </div>

                    </div>
                    
                  


                    <form id="frm" action="/board/free" method="post">
                    <div class="header position-relative">
                        <div class="position-absolute top-0 end-0">

                            <input type="hidden" name="cpage" value="1">
                            <select class="form-select" aria-label="Default select example" id="searchCate"
                                name="searchCate" style="width: 120px; display: inline;">
                                <option value="선택">선택</option>
                                <option value="제목">제목</option>
                                <option value="작성자">작성자</option>
                            </select>
                            <input class="form-control" placeholder="Search" id="search" name="search"
                                onkeypress="if(event.keyCode == 13) { this.form.submit(e); }"
                                style="width: 300px; display: initial;" value="${search }">

                            <input type="hidden" name="searchCate" value="${searchCate}">
                            <input type="hidden" name="search" value="${search}">

                            <button class="btn btn-outline-primary" type="submit"><i class="bi bi-search"></i></button>

                        </div>
                        <br>
                    </div>
                </form>



                </div>

                <div class="table-responsive mt-5">

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="uu">분류</th>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>추천수</th>
                            </tr>
                        </thead>
                        <tbody>


                            <c:choose>
                                <c:when test="${list.size() == 0}">

                                    <tr>
                                        <td colspan='6'>

                                            <div class='col-xxl-12 pt-5 text-center'>

                                                <i class="bi bi-arrow-clockwise" onclick="reload();" type="button"
                                                    style="font-size:50px; color:#007936;"></i>

                                                <p class='fs-6'> 검색결과가 없습니다 다시 검색해주세요 ㅠㅠ</p>
                                            </div>


                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="l" items="${list}">
                                        <tr
                                            onclick="goToLink('/board/FreeContent?code=${l.code}&cpage=${cpage}&viewchoose=true')">
                                            <c:choose>
                                                <c:when test="${l.headLineCode == 2001 }">
                                                    <td>
                                                        <div style=" background-color:#a9ebb1;">일상<div>
                                                    </td>
                                                </c:when>
                                                <c:when test="${l.headLineCode == 2002 }">
                                                    <td>
                                                        <div style=" background-color:#f9f69b;">정보<div>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                        <div style=" background-color:#add1e9;">질문<div>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>

                                            <td>${l.code}</td>
                                            <td style="width: 50%;">${l.title}</td>
                                            <c:choose>
                                                <c:when test="${l.memberNickName == null }">
                                                    <td>${l.memberCompanyName}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>${l.memberNickName}</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>${l.regDate}</td>
                                            <td>${l.viewCount}</td>
                                            <td>${l.likeCount}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>



                        </tbody>
                    </table>

                    <br>

                    <c:choose>
                        <c:when test="${search == null }">
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center">
                                    <c:forEach var="ln" items="${listnavi}">
                                        <c:choose>
                                            <c:when test="${ln == '>' || ln == '<'}">
                                                <li class="page-item">
                                                    <a class="page-link" onclick="goToPage(1, '${ln}')"> ${ln} </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item ${cpage == ln ? 'active' : ''}">
                                                    <a class="page-link" href="/board/free?cpage=${ln}">${ln}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:when>
                        <c:otherwise>
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center">
                                    <c:forEach var="ln" items="${listnavi}">
                                        <c:choose>
                                            <c:when test="${ln == '>' || ln == '<'}">
                                                <li class="page-item">
                                                    <a class="page-link"
                                                        onclick="goToPageSearch(1, '${ln}' ,'${search}' ,'${searchCate}' )">
                                                        ${ln}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item ${cpage == ln ? 'active' : ''}">
                                                    <a class="page-link"
                                                        href="/board/free?cpage=${ln}&search=${search}&searchCate=${searchCate}">${ln}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:otherwise>
                    </c:choose>


                    <c:choose>

                        <c:when test="${user != '1001' }">

                            <div style="float: right;">
                                <a href="/board/freeWrite">
                                    <button class="btn btn-outline-primary" type="button">작성하기</button>
                                </a>
                            </div>

                        </c:when>

                        <c:otherwise>

                        </c:otherwise>

                    </c:choose>


                </div>

            </div>

            <script>

                $("#frm").on("submit", function (e) {

                    if ($("select[id=searchCate] option:selected").val() == "선택") {
                        alert("카테고리를 선택해주세요.");
                        e.preventDefault(); // 폼 제출을 막음
                    } else if ($("#search").val().trim() == "") {
                        alert("검색어를 작성해주세요.");
                        e.preventDefault(); // 폼 제출을 막음
                    }

                })


                $("#search").on("input", function () {
                    var maxLength = 20;
                    var search = $(this).val();

                    if (search.length > maxLength) {
                        alert("검색어는 최대 20자까지 입력할 수 있습니다.");
                        search = search.slice(0, maxLength - 1);
                        $(this).val(search);

                    }
                });



                function reload() {
                    location.href = "/board/free?cpage=1";
                }

                function goToLink(url) {
                    console.log(url)
                    window.location.href = url;
                }

                function goToPage(page, point) {



                    // 페이지 이동 로직 구현
                    if (point == ("<")) {
                        console.log(page)
                        window.location.href = '/board/free?cpage=' + (page * 5);
                    } else {
                        window.location.href = '/board/free?cpage=' + (page * 5 + 1);
                    }

                }

                
                function goToPageSearch(page, point, search, searchCate) {
                    // 페이지 이동 로직 구현 - 검색
                    if (point == ("<")) {
                        console.log(page)
                        window.location.href = '/board/free?cpage=' + (page * 5) + '&search=' + search + '&searchCate=' + searchCate;
                    } else {
                        window.location.href = '/board/free?cpage=' + (page * 5 + 1) + '&search=' + search + '&searchCate=' + searchCate;
                    }

                }

                $(".form-check-input").on("click", function () {
                    // 클래스가 'form-check-input'인 체크박스 요소들을 선택하여 체크된 요소들을 수집합니다.
                    let checked = $('.form-check-input:checked');

                    let checkValues = [];
                    checked.each(function () {
                        checkValues.push($(this).val());
                    });

                    // 체크된 값들을 확인합니다.
                    console.log(checkValues);

                    if (checkValues.length != 0) {
                       
                    window.location.href= "/board/free?cpage=1&check="+checkValues ;
                      
                    }

                }) 
            </script>

        </body>

        </html>