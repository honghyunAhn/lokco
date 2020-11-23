$(function() {
	//이메일 중복확인
	$("#sendKey").hide();
	$("#doubleCheck").on("click", function() {
		var email = $("#email").val();
		if (email.length == 0) {
			alert("중복확인할 이메일을 입력해주세요!");
			return;
		}
		if (!email.includes("@")) {
			alert("이메일 형식으로 입력해주세요!");
			$("#email").select();
			return;
		} else if (!email.includes(".com") || !email.includes(".com")) {
			alert("이메일 형식으로 입력해주세요!");
			$("#email").select();
			return;
		}
		$.ajax({
			url : "doubleCheck",
			type : "get",
			data : {
				email : email
			},
			success : function(data) {
				if (data == "0") {
					alert("사용 가능한 email입니다.");
					$("#sendKey").show();
				} else {
					alert("이미 사용중인 email입니다.");
					$("#sendKey").hide();
				}
			}
		});

	});
});


//이메일 인증번호 확인
$(function() {
	
	$("#check").on("click", function() {
		var key = $("#key").val();
		if (key.length == 0) {
			alert("인증번호를 입력해주세요!");
			return;
		}

		$.ajax({
			url : "keyCheck",
			type : "get",
			data : {
				checkKey : key
			},
			success : function(result) {
				if (result == "0") {
					alert("인증확인 완료");
					opener.location.href ="joinForm";
					window.close();
				} else {
					alert("인증에 실패했습니다");
					$("#key").val("");
				}
			}
		});

	});
});
