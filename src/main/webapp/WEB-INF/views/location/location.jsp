<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>team project</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
    <style>
      .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
      .map_wrap {position:relative;width:100%;height:350px;}
      .radius_border{border:1px #919191;border-radius:5px;}  
      
      #category {position:absolute;top:42px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 1;}
      #category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
      #category li.on {background: #eee;}
      #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
      #category li:last-child{margin-right:0;border-right:0;}
      #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
      #category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
      #category li .hotel {background-position: -10px 0;}
      #category li .cafe {background-position: -10px -36px;}
      #category li .store {background-position: -10px -72px;}
      #category li.on .category_bg {background-position-x:-46px;}
      
      .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
      .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
      .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
      .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
      .placeinfo a{color:#fff;text-decoration: none;}
      .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
      .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #466E84;background: #466E84 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
      .placeinfo .tel {color:#0f7833;}
      .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
      
      .custom_mylocation {position:absolute;top:10px;right:150px;overflow:hidden;width:65px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
      .custom_mylocation span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
      .custom_mylocation .selected_btn {color:black;background:#f5f5f5;}
      
      .custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
      .custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
      .custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
      .custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
      .custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
      .custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
      .custom_typecontrol .selected_btn:hover {color:#fff;}   
      .custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
      .custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
      .custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
      .custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}
      
      #menu_wrap {position:absolute;top:0;left:0;bottom:0;height:20px;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:#fff;z-index: 1;font-size:12px;border-radius: 10px;}
      #menu_wrap .option{text-align: center;}
      #menu_wrap .option p {margin:10px 0;}  
      #menu_wrap .option button {margin-left:5px;}
      
      .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
       #centerAddr {display:block;margin-top:2px;font-weight: normal;}
       .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;} 
       
       .tabledetail {width : 450px;margin-left: auto;margin-right: auto;text-align : center;}
       .tableinfo {width : 150px; margin-left: auto;margin-right: auto;text-align : center;}
      th {background-color : white;font-weight : bold;}
      td {background-color : #466E84; font-style: white; color:white;}
      tr{height: 50px;}
      h2{text-align : center;}
   </style>
</head>
<body>
<div id="details" class="modal"></div>
<div class="map_wrap">
<div id="map" style="max-width: 100%;max-height: 100%;bottom: 0;left: 0;margin: auto;overflow: auto;position: fixed;right: 0;top: 0;"></div>
   <ul id="category">
      <li id="AD5" data-order="0"> 
         <span class="category_bg hotel"></span>宿泊施設
      </li>  
      <li id="CE7" data-order="4"> 
         <span class="category_bg cafe"></span>カフェ
      </li>  
      <li id="CS2" data-order="5"> 
         <span class="category_bg store"></span>コンビニ
      </li>     
      <li id="CS2" data-order="6"> 
         <a href="/teamProject"><span class="category_bg store"></span>Home</a>
      </li> 
   </ul>
   <!-- 현위치 컨트롤 div 입니다 -->
   <div class="custom_mylocation radius_border">
        <span id="mylocation" class="selected_btn" onclick="setMylocation()">現在地</span>
    </div>
    <!-- 지도타입 컨트롤 div 입니다 -->
    <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">地図</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">スカイビュー</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
    <!-- 지도 키워드 검색 컨트롤 div -->
    <div id="menu_wrap">
        <div class="option">
            <div>
                <form onsubmit="searchLocker(); return false;">
                                     場所 : <input type="text" id="keyword" size="15"> 
                    <button type="submit">検索</button> 
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bcb7274cccb8c4155735e8bfad1f4776&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.511112, 127.059812), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨 
    }; 

//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
    
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//장소 검색 객체를 생성합니다(마우스클릭, 항목선택)
var ps = new kakao.maps.services.Places(map); 

//장소 검색 객체를 생성합니다(조건 검색만)
var searchps = new kakao.maps.services.Places();  

var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 키워드로 장소를 검색합니다
searchLocker();

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var mylocation = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
   mylocation_info = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
   
   var num = document.getElementById(currCategory).getAttribute('data-order');
    var content = '<div class="placeinfo">' +
                    '<a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '<span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '<span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '<span title="' + place.address_name + '">' + place.address_name + '</span>';
    }   
    content += '<span class="tel">' + place.phone + '</span>';
    if(num == 0){
      content += '<span>';
      content += '<a class="tel" href = "https://www.yanolja.com/search/' +place.place_name+ '">야놀자</a>';
      content += '<a class="tel" href = "https://www.hotelscombined.co.kr/Search?search='+place.place_name+'&useStored=false&languageCode=KO&currencyCode=KRW">호텔스컴바인</a>';
      content += '</span>';
    }    
    content += '</div>' + '<div class="after"></div>';

    
    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

//현 위치 클릭시 실행
function setMylocation() {
   // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
   if (navigator.geolocation) {

      // 지도의 레벨을 2로 바꿉니다
      map.setLevel(2);
      
       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
       navigator.geolocation.getCurrentPosition(function(position) {
       
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

       // 지도 중심좌표를 접속위치로 변경합니다
       map.setCenter(locPosition);
      });
       
   } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 경고를 설정합니다
       var locPosition = new kakao.maps.LatLng(37.511112, 127.059812);
       alert("現在位置を検索できません。");
   }
}

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">';
                content += '<span class="title">현재 주소정보</span>' + detailAddr + '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            mylocation.setPosition(mouseEvent.latLng);
            mylocation.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 상세 주소정보를 표시합니다
            mylocation_info.setContent(content);
            mylocation_info.open(map, mylocation);
        }   
    });
});

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 현재 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

//키워드 검색을 요청하는 함수입니다
function searchLocker() {
    var searchkeyword = document.getElementById('keyword').value;
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    if (searchkeyword)
         searchps.keywordSearch(searchkeyword, placesLockerCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesLockerCB(searchdata, searchstatus) {
    if (searchstatus === kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 검색된 위치를 표시합니다
        displayLocker(searchdata);
    } else if (searchstatus === kakao.maps.services.Status.ZERO_RESULT) {
        alert('検索結果がありません。');
        return;
    } else if (searchstatus === kakao.maps.services.Status.ERROR) {
        alert('検索中にエラーが発生しました。');
        return;
    }
}

// 검색된 위치를 표시합니다
function displayLocker(searchLocker) {
    var searchmenuEl = document.getElementById('menu_wrap'),
    searchbounds = new kakao.maps.LatLngBounds();
    for ( var i=0; i<1; i++ ) {
        // 마커를 생성합니다
        var searchplacePosition = new kakao.maps.LatLng(searchLocker[i].y, searchLocker[i].x);
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        searchbounds.extend(searchplacePosition);
    }
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(searchbounds);
    map.setLevel(2);
}

// 마커 이미지의 이미지 주소입니다
var markerimageSrc = "../resources/image/locker.jpg"; 

//라커 정보 
var markerpositions = ${location};
for (var i = 0; i < markerpositions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var markerimageSize = new kakao.maps.Size(24, 24); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(markerimageSrc, markerimageSize); 

    var markerinfowindow = new kakao.maps.InfoWindow({
    });
    
      var a = Number(markerpositions[i].locker_gps.split(",")[0])
   var b = Number(markerpositions[i].locker_gps.split(",")[1])

    var setlo = new kakao.maps.LatLng(a, b);
    
    // 마커를 생성합니다
    var set_marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: setlo, // 마커를 표시할 위치
        title : markerpositions[i].locker_name, // 마커의 타이틀, 마커에 마우스를 클릭하면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });

    kakao.maps.event.addListener(set_marker, 'click', makeOverListener(map, set_marker, i));
}

function detail(locker_name) {
   $.ajax({
      url : "detail",
      type : "post",
      data : {
         locker_name : locker_name
      },
      success : function(info){
         var temp = '';
         temp += '<h2>'+locker_name+'detail</h2>';
         temp += '<table class = "tabledetail">';
         temp += '<tr>';
         temp += '<td>住所</td>';
         temp += '<th>'+info.locker_address+'</th>';
         temp += '</tr>';
         temp += '<tr>';
         temp += '<td>サイズ</td>';
         temp += '<th>'+info.locker_size+'</th>';
         temp += '</tr>';
         temp += '<tr>';
         temp += '<td>数量</td>';
         temp += '<th>'+info.locker_num+'</th>';
         temp += '</tr>';
         temp += '<tr>';
         temp += '<td>お支払い方法</td>';
         temp += '<th>'+info.locker_payment+'</th>';
         temp += '</tr>';
         temp += '<tr>';
         temp += '<td>料金</td>';
         temp += '<th>'+info.locker_money+'</th>';
         temp += '</tr>';
         temp += '<tr>';
         temp += '<td>使用時間</td>';
         temp += '<th>'+info. locker_usetime+'</th>';
         temp += '</tr>';
         temp += '</table>';
         $("#details").html(temp);
      },
      error : function(e){
         alert(JSON.stringify(e));
      }
   });
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, set_marker, i) {
    return function() {
       var content = '<table class = "tableinfo">';
          content += '<tr>';
          content += '<td>';
        content += '<a href="#details" rel="modal:open" onclick="detail(\'' + markerpositions[i].locker_name + '\')" >' + markerpositions[i].locker_name + '</a>';   
        content += '</td>';
        content += '</tr>';
        content += '<tr>';
      content += '<th>';
       content += '<a href = "https://map.kakao.com/link/to/'+markerpositions[i].locker_name+','+markerpositions[i].locker_gps+'">経路検索</a>';
       content += '&nbsp';
       content += '&nbsp';
       content += '&nbsp';
        content += '<a href = "javascript:test(\'' + markerpositions[i].locker_name + '\')">予約</a>';
//         content += '<a href = "../reservation/reservationPage?locker_name=' + markerpositions[i].locker_name + '">예약</a>';

       content += '</th>';
       content += '</tr>';
       content += '</table>'
       markerinfowindow.setContent(content);
       markerinfowindow.open(map, set_marker);
    };
}

function test(locker_name) {
   $.ajax({
      url : "../reservation/loginCheck",
      type : "get",
      success : function(result){
         console.log(typeof(result));
         console.log(result === "");
         if(result !== ""){
            alert("予約ページに移動します。");
            location.href='../reservation/reservationPage?locker_name='+locker_name;
         }else{
            window.open("../member/loginConfirm?locker_name="+locker_name, 'certification',
            'top=200,left=500,width=400,height=180');
         }
      }
   });   
}
</script>


</body>
</html>