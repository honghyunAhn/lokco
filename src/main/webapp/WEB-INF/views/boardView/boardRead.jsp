<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<title>故障申告 内容</title>
<link
   href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
body {
    background-image: url("http://localhost:8888/teamProject/resources/image/joinForm.png");
    background-repeat:no-repeat;
    background-size : cover;
}


.custab {
   border: 1px solid #ccc;
   padding: 100px;
   margin: 10% 20%;
   box-shadow: 3px 3px 2px #ccc;
   transition: 0.5s;
}

.custab:hover {
   box-shadow: 3px 3px 0px transparent;
   transition: 0.5s;
}

th {
   width: 90px;
   height: 30px;
   background-color: #466E84;
   text-align: center;
   color: white;
}

td {
   background-color: white;
   text-align: center;
}
/* 게시판 하단 */
#navigator {
   width: 600px;
   text-align: center;
   margin: auto;
}
</style>
<script type="text/javascript">
   //글삭제시 확인 스크립트
   function deleteCheck(boardnum) {
      if (confirm("정말 삭제하시겠습니까?")) {
         location.href = 'delete?boardnum=' + boardnum;
      }
   }
</script>

</head>
<body>
   <div style="text-align: center; margin-top: 1cm;">
      <h1>[ 故障 内容  ]</h1>
   </div>
   <div class="container">
      <div class="row col-md-6 col-md-offset-2 custyle">
         <table class="table table-striped custab">
            <thead>
               <tr>
                  <th style="width: 100px;">作成者</th>
                  <td style="width: 600px;">${board.email}</td>
               </tr>
               <tr>
                  <th>登録日</th>
                  <td>${board.inputdate }</td>
               </tr>
               <tr>
               </tr>
               <tr>
                  <th style="width: 220px">タイトル </th>
                  <td>${board.title}</td>
               </tr>
               <tr>
                  <th>内容</th>
                  <td>${board.contents}</td>
               </tr>
               <tr>
                  <th><div class="fileupload" style="padding-bottom: 180%">ファイルアップロード</div></th>
                  <td>
                     <!-- 첨부된 파일이 있는 경우, 해당 파일을 다운로드 할 수 있는 링크 제공 --> <c:if
                        test="${board.originalfile != null}">
                        <img src="/boardfile/${board.savedfile}" width="320"
                           height="200">
                        <br>
                        <a href="download?boardnum=${board.boardnum}">${board.originalfile}</a>
                     </c:if>
                  </td>
               </tr>
         </table>
      </div>
   </div>
   <div id="navigator">
      <!-- 본인 글인 경우에만 보이기 -->
      <c:if test="${loginId == board.email}">
         <!-- 현재글 삭제하기-->
         <a href="javascript:deleteCheck(${board.boardnum})">削除</a>
         <!-- 현재글 수정하기-->
         <a href="edit?boardnum=${board.boardnum}">修正</a>
      </c:if>

      <!-- 목록보기-->
      <a href="list">リスト</a>
   </div>
   <br>

   <!-- /리플 목록 출력 끝 -->

   <br>
   <br>
   <br>
   </div>
</body>
</html>