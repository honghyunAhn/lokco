<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約内訳確認ページ</title>
<script src="../resources/js/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function(){
	$(".cancle").on("click",function(){
		var locker_name =$(this).closest('tr').find('.name').html();
		var locker_n = $(this).attr("data-num");
		$.ajax({
			url : "cancle",
			type : "get",
			data : {
				locker_name : locker_name,
				locker_n : locker_n
				},
			success : function(){
				alert("キャンセル完了しました。");
				location.reload();
			}
		});
	});
	$(".pay").on("click",function(){
		var locker_name =$(this).closest('tr').find('.name').html();
		var locker_n = $(this).attr("data-num");
		alert("決済リストに移動します。");
		window.close();
		opener.window.location ="../pay/cfpay?locker_name="+locker_name+"&locker_n="+locker_n;
		});
	



});
</script>
<style type="text/css">
.cancle {
	background-color: #fbffff;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
.pay {
	background-color: #fbffff;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}



</style>

</head>
<body>
<div style="text-align: right;">
	<h3>${email}さんの予約内訳</h3>
</div>
	<c:if test="${check==1}">
		<script type="text/javascript">
			alert("予約内訳がありません");
			this.close();
		</script>
	</c:if>
	
	<c:if test="${check!=1}">
	<table border="1" style="margin: auto;">
<tr align = "center" bgcolor="#466E84" style="color: white;">
	<td>
		コインロッカー名
	</td>
	
	<td>
		コインロッカー 番号
	</td>
	
	<td>
		予約日時
	</td>
	<c:if test="${sessionScope.email!=null}">
	<td>
		결제 여부
	</td>
	<td>
		決済
	</td>
	</c:if>
	<td>
		キャンセル
	</td>

</tr>

<c:forEach items="${list}" var="list">
	<tr align = "center">
		<td class="name">${list.locker_name}</td>
		<td>${list.locker_n}</td>
		<td>${list.inputdate}</td>
		
		<c:if test="${sessionScope.email!=null}">
		<td>${list.paid}</td>
		<%-- 결제 내역없으면 활성화 --%>
		<c:if test="${list.paid=='no'}"><td><input type="button" class="pay" value="決済" 
		data-num="${list.locker_n}" style="width: 80px;"></td>
		</c:if>
		
		<%-- 결제 내역있으면 비활성화 --%>
		<c:if test="${list.paid=='yes'}"><td><input type="button" class="pay" value="決済 完了" disabled="disabled" style="width: 80px;"></td>
		</c:if>
		</c:if>
		<td><input type="button" class="cancle" value="キャンセル" data-num="${list.locker_n}" style="width: 80px;"></td>
	</tr>
	
	
</c:forEach>

</table>
</c:if>





</body>
</html>