<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<link
   href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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

.centerdiv {
   margin: auto;
   text-align: center;
}

table {
   margin: auto;
}

th {
   width: 90px;
   height: 30px;
   background-color: #466E84;
   color : white;
   text-align: center;
   font-weight:;
}

td {
   width:;
   height:;
   background-color:;
   text-align: center;
   font-weight:;
}
/* 게시판 하단 */
#navigator {
   width: 600px;
   text-align: center;
   margin: auto;
}
</style>

<script>
   //글쓰기폼 확인
   function formCheck() {
      var title = document.getElementById('title');
      var contents = document.getElementById('contents');

      if (title.value.length < 5) {
         alert("タイトルを作成してください。");
         title.focus();
         title.select();
         return false;
      }
      if (contents.value.length < 5) {
         alert("内容を作成してください。");
         contents.focus();
         contents.select();
         return false;
      }
      return true;
   }
</script>
</head>
<body>
   <div style="text-align: center; margin-top: 1cm;">
      <h1>[ 故障申告 内容 ]</h1>
   </div>
   <div class="container">
      <div class="row col-md-6 col-md-offset-2 custyle">
         <!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->
         <form id="writeform" action="write" method="post"
            enctype="multipart/form-data" onsubmit="return formCheck();">

            <table class="table table-striped custab"
               style="text-align: center;">
               <thead>
                  <tr>
                     <th>タイトル</th>
                     <td><input type="text" name="title" id="title"
                        style="width: 400px;"></td>
                  </tr>
                  <tr>
                     <th><div class="fileupload" style="padding-bottom: 115%">内容</div></th>
                     <td><textarea name="contents" id="contents"
                           style="width: 400px; height: 200px; resize: none;"></textarea>
                     </td>
                  </tr>
                  <tr>
                     <th>ファイルアップロード</th>
                     <td><input type="file" id="upload" name="upload" size="30"
                        onchange="handleFileSelect()" /></td>
                  </tr>
                  <tr>                  <td colspan="2">
                        <div id="list"></div> <script type="text/javascript">
                           function handleFileSelect() {
                              var files = document
                                    .getElementById('upload').files[0]; //파일 객체

                              var reader = new FileReader();

                              //파일정보 수집        
                              reader.onload = (function(theFile) {
                                 return function(e) {
                                    //이미지 뷰
                                    var img_view = [ '<img src="',
                                          e.target.result,
                                          '" title="',
                                          escape(theFile.name),
                                          '" width="', 320,
                                          '" height="', 200,
                                          '"/>' ].join('');
                                    document.getElementById('list').innerHTML = img_view;
                                 };

                              })(files);

                              reader.readAsDataURL(files);
                           }
                        </script>
                     </td></tr>
               </thead>
               <tr>
                  <td colspan="2" class="white center"><input type="submit"
                     value="アップロード" /></td>
               </tr>
            </table>
         </form>
      </div>
   </div>

</body>
</html>