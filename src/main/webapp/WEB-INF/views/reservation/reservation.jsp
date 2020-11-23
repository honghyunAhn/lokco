<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/jquery-3.4.1.js"></script>
<title>예약 페이지</title>
<style type="text/css">
body {
    background-image: url("http://localhost:8888/teamProject/resources/image/joinForm.png");
    background-repeat:no-repeat;
    background-size : cover;
	font-family: 고딕체;
}
.reservation {
   background-color: #6495ED;
   border: none;
   color: white;
   width: 100px;
   height: 80px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   margin: 4px 2px;
   cursor: pointer;
}

.reservation1 {
   background-color: #FFC0CB;
   border: none;
   color: white;
   width: 100px;
   height: 80px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   margin: 4px 2px;
   cursor: pointer;
}

.reserved {
   background-color: #FF0000;
   border: none;
   color: white;
   width: 100px;
   height: 80px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   margin: 4px 2px;
}

</style>
<script>
$(function(){
   $(".reservation").on("click", reservation);
   $(".reservation1").on("click", reservation);
});
function reservation(){
   var num = $(this).attr("data-num");
   var locker_name = '${locker_name}';
   $.ajax({
      url : "reservation",
      data : {
         locker_name : locker_name,
         num : num
      },
      type : "get",

      success : function(result){
            if(${sessionScope.email!=null}){
            if(confirm('예약성공하셨습니다.\n예약 결제하시겠습니까?(카드 결제)')){
               location ="../pay/cfpay?locker_name="+locker_name+"&locker_n="+num;
           }else{
              alert('예약 성공하셨습니다.\n메인 페이지로 이동합니다');
              location="/teamProject";
         }
      } else {
            alert('예약 성공하셨습니다.\n메인 페이지로 이동합니다');
            location="/teamProject";
         }
   }
   });
}


</script>
</head>
<body>
   <c:if test="${requestScope.flag == true}">
      <script>alert("로그인 성공하셨습니다");</script>
   </c:if>
   <h2 style="text-align: center;">[${sessionScope.locker_name}의 예약
      페이지]</h2>
   
   <div><table style="border-style: none; margin-left: 670px;">
      <tr>
         <td colspan="2" style="font-size: 15px;"><b style="font-family: 고딕체">予約できる数: ${number}개</b></td>
      </tr>
      <tr>
         <td><img src="../resources/image/blue.png" width="12.5px" height="10px"> :<b style="font-family: 고딕체">소형</b></td>
      
         <td><img src="../resources/image/pink3.png"  width="12.5px" height="10px"> : <b style="font-family: 고딕체">대형</b></td>
      </tr>
   </table></div>
   <c:if test="${length=='length'}">
      <div style="width: 720px; margin: 0 auto; margin-top: 50px;">
         <!-- 전체를 감싸는 div <-- 이걸 활용해서 디자인 꾸미세요 -->
         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="0" end="4">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番 不可"
                                 disabled="disabled" class="reserved">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>

         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="5" end="9">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 disabled="disabled" class="reserved">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left; margin-right: 30px">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="10" end="14">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>
                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="15" end="19">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番 不可"
                                 disabled="disabled" class="reserved">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>

         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="20" end="24">
                  <tr>
                     <%--                      <td>${list.locker_n}番</td> --%>
                     <%--                      <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>


      </div>
   </c:if>

   <c:if test="${length2=='length2'}">
      <div style="width: 550px; margin: 0 auto; margin-top: 50px;">
         <!-- 전체를 감싸는 div <-- 이걸 활용해서 디자인 꾸미세요 -->
         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="0" end="4">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="5" end="9">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 disabled="disabled" class="reserved">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left; margin-right: 30px">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="10" end="14">
                  <tr>
                     <%--                <td>${list.locker_n}番</td> --%>
                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>
                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="15" end="19">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>
                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>

      </div>
   </c:if>

   <c:if test="${length3=='length3'}">
      <div style="width: 400px; margin: 0 auto; margin-top: 50px;">
         <!-- 전체를 감싸는 div <-- 이걸 활용해서 디자인 꾸미세요 -->
         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="0" end="4">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>
                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left; margin-right: 30px;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="5" end="9">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>

                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>

                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 disabled="disabled" class="reserved">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div style="border-style: none; float: left;">
            <table>
               <c:forEach items="${lockerList}" var="list" begin="10" end="14">
                  <tr>
                     <%--                   <td>${list.locker_n}番</td> --%>
                     <%--                   <td>SIZE:${list.locker_size}/가격:${list.locker_price}</td> --%>
                     <td><c:choose>
                           <c:when test="${list.reserved=='no'&& list.locker_size=='소형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation" data-num="${list.locker_n}">
                           </c:when>

                           <c:when test="${list.reserved=='no'&& list.locker_size=='대형'}">
                              <input type="button" value="${list.locker_n}番 予約"
                                 class="reservation1" data-num="${list.locker_n}">
                           </c:when>
                           <c:otherwise>
                              <input type="button" value="${list.locker_n}番  不可"
                                 class="reserved" disabled="disabled">
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </div>
   </c:if>
</body>
</html>