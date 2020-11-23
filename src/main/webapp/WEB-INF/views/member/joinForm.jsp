<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<script src="../resources/js/jquery-3.4.1.js"></script>
<script src="../resources/js/join.js"></script>
<link href="../resources/css/joinForm.css" rel="stylesheet">
<style type="text/css">
body {
    background-image: url("http://localhost:8888/teamProject/resources/image/joinForm.png");
    background-repeat:no-repeat;
    background-size : cover;
}
</style>

</head>
<body>
<form action="join" method="post" onsubmit="return formCheck();">
  <div class="container" style="width: 400px;margin: 0 auto;">
    <h1>회원가입</h1>
    <hr>
    
    <b>Email</b>
    
    <input type="text" name="email" id="email" required value="${sessionScope.email}" readonly="readonly"/> 
 
   

    <b>Password</b>
    <input type="password" placeholder="비밀번호 입력" id="password" name="password" required/>

    <b>Repeat Password</b>
    <input type="password" placeholder="비밀번호 재 입력" id="password2"required/>
    <div class="clearfix">
    <b>Name</b>
    <input type="text" placeholder="이름 입력" name="name" id="name" required/>

    <b>Phone</b><span>(-는 제외해주세요)</span>
    <input type="text" placeholder="폰번호 입력" name="phone" id="phone" required/>
       <div class="clearfix">
      <a href="http://localhost:8888/teamProject"><button type="button" class="cancelbtn">Cancel</button></a>
      <button type="submit" class="signupbtn" style="background-color:#466E84;">Sign Up</button>
    </div>
  </div>
  </div>
</form>

</body>
