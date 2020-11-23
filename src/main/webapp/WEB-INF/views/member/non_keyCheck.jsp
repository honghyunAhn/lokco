<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>이메일 인증번호 체크</title>
<script src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
//이메일 인증번호 확인
$(function() {
	$("#check").on("click", function() {
		var key = $("#key").val();
		if (key.length == 0) {
			alert("인증번호를 입력해주세요!");
			return;
		}

		$.ajax({
			url : "keyCheck2",
			type : "get",
			data : {
				checkKey : key
			},
			success : function(result) {
				if (result == "0") {
					alert("인증확인 완료");
					opener.location.href ="/teamProject";
					window.close();
				} else {
					alert("인증에 실패했습니다");
					$("#key").val("");
				}
			}
		});

	});
});
function goBack(){
	window.location = "non_memberMail";
}


</script>
<style type="text/css">
body{
	font-family: 고딕체;
}

</style>
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