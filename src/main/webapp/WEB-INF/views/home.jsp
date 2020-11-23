<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<!-- 화면 상단 메뉴바 영역 -->

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- 화면 상단 메뉴바 영역 -->  

<title>메인 페이지</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/reservation.js"></script>
<style type="text/css">
   body{
      background-color: #fbffff;
   }
   #di{
      width: 700px;
      height: 400px;
      float: right;
      margin-top: 75px;
      
   }
   
   #dt{
      width:570px; 
      height:150px; 
      float: left;
      margin-left: 150px;
      margin-top: 150px;
      font-family: 고딕체;
   }
   
   #ti{
      color :#EF7B80;
      font-weight: bold;
   }
   
   #dl{
         margin-top: 600px;
         color: #466E84;
   }
   
 
   
</style>

<script>
function mailCertification(){
   if(confirm("会員登録時にメール認証が必要です。")){
      window.open("member/mail", 'certification',
         'top=200,left=500,width=450,height=200');
   }else {
      alert("会員登録はキャンセルされました。");
   }
}
</script>
</head>
<body>

<!-- 화면 상단 메뉴바 영역 -->
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
<!--       타이틀 -->

<!--       모바일의 경우 토클 메뉴 버튼 -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
<!--       메뉴 -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
<!--           <li class="nav-item active"> -->
<!--             <a class="nav-link" href="http://localhost:8888/teamProject/">Home <span class="sr-only">(current)</span></a> -->
<!--           </li> -->
          
             <li class="nav-item">
             <a class="navbar-brand" href="http://localhost:8888/teamProject/"><img src="resources/image/lock.png" style="z-index:1; margin-top:-15px; "></a>
          <c:if test="${sessionScope.email == null}">
           <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
         data-target="#myModal" style="background-color: #466E84;">ログイン</button> &nbsp

          </c:if>
          <c:if test="${sessionScope.email != null}">
          <a href="http://localhost:8888/teamProject/member/logout">
              <button type="button" class="btn btn-info btn-lg" style="background-color: #466E84;">ログアウト</button> &nbsp
           </a>
          </c:if>       
            
          </li>
          
          <li class="nav-item">
          <a href="http://localhost:8888/teamProject/location/location">   
          <button type="button" class="btn btn-info btn-lg" style="background-color: #466E84;">ロッカー位置</button> &nbsp
            </a>     
          </li>
          
          <li class="nav-item">
               <button type="button" class="btn btn-info btn-lg" id="reservationList" style="background-color: #466E84;">予約内訳</button> &nbsp
          </li>
          
          <li class="nav-item">
          <a href="http://localhost:8888/teamProject/board/list">   
          <button type="button" class="btn btn-info btn-lg" style="background-color: #466E84;">掲示板</button> 
            </a>     
          </li>
          
        </ul>
      </div>
    </nav>
  </header>
  
<!-- 화면 상단 메뉴바 영역 -->

   <%--회원가입 alert--%>
   <c:if test="${requestScope.result == true}">
      <script>alert("会員加入成功しました。");</script>
   </c:if>
   <%--예약 중복방지 alert --%>
   <c:if test="${requestScope.check == true}">
      <script>
      alert("予約は最大3つまで可能です。");
      </script>
   </c:if>
   <%--로그인 alert--%>
   <c:if test="${requestScope.flag == true}">
      <script>alert("ログインに成功しました。");</script>
   </c:if>
   <c:if test="${requestScope.flag == false}">
      <script>alert("メールまたはパスワードを確認してください。");</script>
   </c:if>   

         
   <!-- Modal -->
   <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">ログイン</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="member/login" method="post">
               <div class="modal-body">
               
                  <div style="text-align: center;">
                     <input id="email" type="text" required="required"
                        placeholder="メール" name="email"><br>
                     </br> <input id="password" type="password" required="required"
                        placeholder="パスワード" name="password"></br>
                  </div>
               </div>
               <div class="modal-footer">
                  <input id="login" type="submit" class="btn btn-default" value="ログイン">
                  <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="mailCertification();">
                    会員加入
                    </button>
               </div>
            </form>
         </div>
      </div>
   </div>
   <div id = "di">
      <img src="resources/image/main.png"  width="550px" height="300px">
   </div>
   <div id = "dt">
      <h2 id = "ti">ラッコ、君のロッカーはどこ?</h2>
      <br>
      <h4>ラッコは、コインロッカーとどこを合わせた言葉で</h4>
      <h4>&nbsp 皆様にロッカーの位置を提供するサイトです。</h4>   
   </div>
    <div id="dl">
   <footer style="text-align:center">
   <hr style="border: solid 10px #466E84;">
    <p>© Copyright by SCIT Master 38th A - キムパクアンユ </p>
  </footer>
  </div>
   </body>
</html>