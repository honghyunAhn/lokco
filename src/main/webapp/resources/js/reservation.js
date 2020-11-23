// 예약할 시, 로그인이 안 돼있을 경우 다른 페이지로 넘겨주는 Ajax
$(function(){
   //예약 페이지
//   $("#reservation").on("click",function(){
   
   
function reservation(){
   $.ajax({
      url : "reservation/loginCheck",
      type : "get",
      success : function(result){
         console.log(typeof(result));
         console.log(result === "");
         if(result !== ""){
            alert("予約ページに移動します。");
            location.href='reservation/reservationPage';
         }else{
            alert("ログインや非会員認証が必要です。");
            window.open("member/loginConfirm", 'certification',
            'top=200,left=500,width=360,height=130');
         }
      }
   });   
}
   //예약 내역 페이지
   $("#reservationList").on("click",function(){
      $.ajax({
         url : "reservation/loginCheck",
         type : "get",
         success : function(result){
            console.log(typeof(result));
            console.log(result === "");
            if(result !== ""){
               alert("予約ページに出ます。");
               window.open("reservation/reservationList", 'certification',
               'top=200,left=500,width=700,height=200');
            }else{
               alert("ログインや非会員認証が必要です。");
               window.open("member/loginConfirm2", 'certification',
               'top=200,left=500,width=700,height=200');
            }
         }
      });   
   });   
});