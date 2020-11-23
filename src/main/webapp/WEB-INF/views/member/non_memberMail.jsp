<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/jquery-3.4.1.js"></script>

<script type="text/javascript">

function doubleCheck() {
	var email = $("#email").val();
	var flag = false;
	if (email.length == 0) {
		alert("이메일을 입력해주세요!");
		return false;
	}
	if (!email.includes("@")) {
		alert("이메일 형식으로 입력해주세요!");
		$("#email").select();
		return false;
	} else if (!email.includes(".com") || !email.includes(".com")) {
		alert("이메일 형식으로 입력해주세요!");
		$("#email").select();
		return false;
	}
	$.ajax({
		url : "doubleCheck",
		type : "get",
		data : {
			email : email
		},
		async: false,
		
		success : function(data) {
			if (data == "0") {
				alert("사용 가능한 email입니다.");
				flag = true;
			} else {
				alert("이미 사용중인 email입니다.");
			}
		}
	});
	return flag;
}

</script>

<style type="text/css">
body{
	font-family: 고딕체;
}
</style>


<title>이메일 인증</title>
</head>
<body>
<div class="container">
  <h4 style="color:#7C7D7D">비회원 메일 보내기</h4>
  <form action="${pageContext.request.contextPath}/member/mailSending2"
			method="post" onsubmit="return doubleCheck();">
    <div align="center"><!-- 받는 사람 이메일 -->
      <hr>
      <br>
      <input type="text" name="tomail" placeholder="이메일 입력" id="email">
      <input type="submit" value="인증번호 보내기" id="sendKey"><br>
      <br>
      <hr>
    </div>     
  </form>
</div>


</body>
</html>
