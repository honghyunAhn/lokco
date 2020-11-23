<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/teamProject/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		//작성하기 버튼에 onclick 이벤트로 formSubmit 함수를 연결
		$('#formButton').on('click', formSubmit);
		var IMP = window.IMP;
		IMP.init('imp41341699');
		$("#cancle").on("click",function(){
			alert("결제가 취소되었습니다");
			window.location = "/teamProject";
			});
	});

// 	$(document).ready(function() {
// 		//작성하기 버튼에 onclick 이벤트로 formSubmit 함수를 연결
// // 		$('#formButton').on('submit', formSubmit);
// 		var IMP = window.IMP;
// 		IMP.init('imp41341699');
// 	});

	function formSubmit() {

// 		'samsung':삼성페이,
// 		'card':신용카드,
// 		'trans':실시간계좌이체,
// 		'vbank':가상계좌,
// 		'phone':휴대폰소액결제
// 		var pay_method = $('input:radio[name="method"]:checked').val();
		var flag = false;
		var amount = '${locker_price}';
		var locker_name = '${locker_name}';
		var num = ${locker_n};
		var name = '('+num+'번)'+locker_name;
		var email = '${sessionScope.email}';
		//사용자가 입력한 내용을 서버로 전송.
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name,
		    amount : '1500', //상품 가격
		    locker_name : $('#locker_name').val(),
		    phone : $('#phone').val(),
		    buyer_email : email,
		    buyer_name : email
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        var flag = true;
// 		        msg += '고유ID : ' + rsp.imp_uid;
// 		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
			    }

		    alert(msg);
// 			document.id.action="pay/paycomplete";
// 		    document.form.submit();
		if(flag){
			<%-- 결제 성공 시 결제 내약 변경 후 메인페이지로 --%>
			window.location = "/teamProject/pay/paid?locker_n="+num+'&locker_name='+locker_name;
		}else{
			<%-- 결제 취소 시 그냥 메인 페이지로 --%>
			window.location="/teamProject";
		}
		});
	}

</script>
<link href="../resources/css/joinForm.css" rel="stylesheet">

<style type="text/css">
body {
    background-image: url("http://localhost:8888/teamProject/resources/image/joinForm.png");
    background-repeat:no-repeat;
    background-size : cover;
}
</style>

<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
<div style="width: 400px; height: 500px;margin: auto;">
  <div class="container" style=" margin-top: 150px; position: relative; left: 61px;">
    <h1>決済内容の確認</h1>
<p></p>
    
    <h2>ロッカー名: ${locker_name}</h2>
    

    <h2>ロッカー番号: ${locker_n}</h2>
   

    <h2>サイズ: ${locker_size}</h2>
     
    <h2>価格: ${locker_price}</h2> 
     <button type="button" class="cancelbtn" id="cancle" style="width: 80px; position: ">Cancel</button>
    <button type="submit"  id="formButton" class="signupbtn" style="background-color:#466E84; width: 80px;">Pay</button>
  </div>
  
</div>











</body>
