<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/jquery-3.4.1.js"></script>
<script src="../resources/js/mailCertification.js"></script>
<script type="text/javascript">
function goBack(){
   window.location="mail";
}
</script>
<style type="text/css">
body{
	font-family: 고딕체;
}

</style>

<title>이메일 인증번호 체크</title>
</head>
<body>
   <h4 style="color:#7C7D7D">認証番号　チェック</h4>
   <hr>
   <br>
   
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="text" name="sendKey" placeholder="認証番号　入力" id="key" required="required"> 
    </div>     
    <br>
    <hr>
    <div align="center">
      <input type="button" value="確認" id="check"> <input type="button" value="戻る" onclick="goBack();">
    </div>





</body>
</html>