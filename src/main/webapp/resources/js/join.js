//회원가입 시 유효성 검사
function formCheck() {
	var email = document.getElementById("email");
	var pw = document.getElementById("password");
	var pw2 = document.getElementById("password2");
	var name = document.getElementById("name");
	var phone = document.getElementById("phone");

	if (!email.value.includes("@")) {
		alert("이메일 형식으로 입력해주세요!");
		email.select();
		return false;
	} else if (!email.value.includes(".com") || !email.value.includes(".com")) {
		alert("이메일 형식으로 입력해주세요!");
		email.select();
		return false;
	}

	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
		alert("비밀번호가 서로 다릅니다.");
		pw.select();
		return false;
	}
	if (!isNaN(name.value)) {
		alert('이름은 문자로 입력해주세요');
		name.select();
		return false;
	}
	if (isNaN(phone.value)) {
		alert('폰 번호는 숫자로 입력해주세요!');
		phone.select();
		return false;
	} else if (phone.value.length != 11) {
		alert("폰 번호는 11자리 입력해주세요!")
		return false;
	}

	return true;

}


