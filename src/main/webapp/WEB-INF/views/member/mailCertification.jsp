<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/jquery-3.4.1.js"></script>
<script src="../resources/js/mailCertification.js"></script>
<title>이메일 인증</title>
<style type="text/css">
body{
	font-family: 고딕체;
}

</style>
</head>

<body>
<div class="container">
  <h4 style="color:#7C7D7D">メール　認証</h4>
  <form action="${pageContext.request.contextPath}/member/mailSending" method="post" onsubmit="return mailCheck();">
    <div align="center"><!-- 받는 사람 이메일 -->
      <hr>
      <br>
      <input type="text" name="tomail" placeholder="メール　入力" id="email">
      <input type="button" value="重複確認" id="doubleCheck">
      <input type="submit" value="認証番号　送る" id="sendKey"><br>
      <br>
      <hr>
    </div>     
  </form>
</div>
</body>
</html> 
