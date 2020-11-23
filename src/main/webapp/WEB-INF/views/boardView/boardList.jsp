<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>故障申告</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style type="text/css">
body {
    background-image: url("http://localhost:8888/teamProject/resources/image/joinForm.png");
    background-repeat:no-repeat;
    background-size : cover;
}

.custab{
    border: 1px solid #ccc;
    padding: 100px;
    margin: 10% 16%;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
th {
   color : white;
   background-color: #466E84;
   text-align: center;
}
td {
   text-align: center;
}
/* 게시판 하단 */
#navigator {
   width: 600px;
   text-align: center;
   margin: auto;
}

</style>

<!-- 페이지 이동 스크립트  -->
<script>
function pagingFormSubmit(currentPage) {
   var form = document.getElementById('pagingForm');
   var page = document.getElementById('page');
   page.value = currentPage;
   form.submit();
}
</script>

</head>

<body>
<div style="text-align: center; margin-top: 1cm;">
<h1>[ 故障掲示板 ]</h1>
<a href="http://localhost:8888/teamProject/"><img src="../resources/image/lock.png"></a> 
</div>
<div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
       <tr>
   <td class="white">
      全体 : ${navi.totalRecordsCount}
   </td>
   <td class="white" colspan="2"></td>
   <td class="white">
      <c:if test="${sessionScope.email!=null}"><input type="button" value="作成" onClick="location.href='write';"></c:if>
   </td>
   
</tr>
<tr>
   <th>番号</th>
   <th style="width:220px">タイトル</th>
   <th>作成者</th>
   <th>登録日</th>
</tr>
    </thead>
        <c:forEach var="board" items="${boardlist}">
<tr>
   <td class="center">${board.boardnum}</td>
   <td>
      <a href="read?boardnum=${board.boardnum}" style="color: black;">${board.title}</a>
   </td>
   <td class="center">${board.email}</td>
   <td>${board.inputdate}</td>
</tr>

</c:forEach>      
    </table>
    </div>
</div>
<div id="navigator">
<!-- 페이지 이동 부분 -->                      
   <a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
   <a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

   <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
      <c:if test="${counter == navi.currentPage}"><b></c:if>
         <a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
      <c:if test="${counter == navi.currentPage}"></b></c:if>
   </c:forEach>
   &nbsp;&nbsp;
   <a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
   <a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

<!-- /페이지 이동 끝 -->                      

<br><br>


<!-- 검색폼 -->
<form id="pagingForm" method="get" action="list">
   <input type="hidden" name="page" id="page" />
   タイトル : <input type="text"  name="searchText" value="${searchText}" />
   <input type="button" onclick="pagingFormSubmit(1)" value="検索">
</form>
<!-- /검색폼 --> 
</div>
</body>
</html>