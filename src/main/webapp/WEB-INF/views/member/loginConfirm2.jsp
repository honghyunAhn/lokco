<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 확인 페이지</title>
<style type="text/css">
	h3{
		text-align: center;
	}
</style>
<script src="../resources/js/jquery-3.4.1.js"></script>
<script>
   function mailCertification() {
      alert("이메일 인증 페이지로 넘어갑니다");
      window.location = "non_memberMail";
   }
   $(function() {
      $("#login").on("click", check); 
      $("#confirm").on("click", check2);
      });

function check(){
   var email = $("#email").val();
   var password = $("#password").val();
   $.ajax({
      url : "login2",
      type : "get",
      data : {
         email : email,
         password : password
      },
      success : function(result) {
         if (result == 0) {
            alert("로그인에 성공하셨습니다");
            window.location = "../reservation/reservationList";
            
         } else {
            alert("아이디 혹은 비밀번호를 확인해주세요");
            return;
         }
      }
   });
}

//비회원 조회
function check2(){
   var email2 = $("#email2").val();
   var password = $("#password").val();
   $.ajax({
      url : "non_login",
      type : "get",
      data : {
         email2 : email2,
      },
      success : function(result) {
         if (result == 1) {
            alert("예약 내역페이지로 이동합니다");
            window.location ="../reservation/reservationList";
         } else {
            alert("인증받으신 이메일을 확인하세요");
            return;
         }
      }
   });
}         
</script>
</head>
<body>

	<h3>[로그인 / 비회원 인증]</h3>

   <div style="margin-left: 180px; margin-top: 20px;">
      <div style="display: inline-table;">
         <fieldset style="border: solid 2px #7C7D7D; text-align:center">
            <legend style="font-family:고딕; font-size:20px ;color:#7C7D7D;">ログイン</legend>
            <input  type="text" id="email" placeholder="이메일"><br>
            <input  type="password" id="password" placeholder="비밀번호"><br>
            <input type="button" id="login" value="로그인">
         </fieldset>
      </div>
      
      <div style="display: inline-table;">
         <fieldset style="border: solid 2px #7C7D7D; text-align:center; width: 100px; height: 98px;">
         <legend style="font-family:고딕; font-size:20px; color:#7C7D7D"> 非会員 </legend>
         
         <c:if test="${sessionScope.email2==null}">
         <input type="button" value="비회원 인증" onclick="mailCertification();" style="position: relative; top: 25px;">
         </c:if>
         </fieldset>
      </div>
   </div>
</body>
</html>