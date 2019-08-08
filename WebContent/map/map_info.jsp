<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<h2>
	<div class="padding-bottom-8"><font style="font-weight: bold;">클린하우스</font>는 어디에?</div>
</h2>

<form style="border: 2px solid #00c7ae;" action="index.do" method="get">
	<div role="group" class="input-group border-thick" style="border: 0px;">
		<input type="text" placeholder="원하는 지역을 입력해주세요." autocomplete="off" value="" class="form-control with-button" 
		name="search_place">
		<div class="input-group-btn">
      		<button class="btn btn-default with-text" type="submit">
        		<i class="glyphicon glyphicon-search"></i>
      		</button>
    	</div>
	</div>
	<div style="border-top:  1px solid #9CC232;">
		<div id="map" style="width:100%;height:600px;"></div>
	</div>
<div onclick="myFunction()" style="cursor:pointer;
	position: absolute;
    margin: -70px 0px 0px 20px;
    z-index: 100;">
	<img src="<%=ctxPath %>/assets/img/now_location3.jpg" style="width: 40px;
    border: 2px solid #000000;">
</div>

</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b5898e68bc3f653068f9a262d1297dc&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.5003147,126.5300349), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
//http://apis.map.kakao.com/web/sample/addr2coord/
//여러개list : https://devtalk.kakao.com/t/topic/55564/7
var addrMap = {};
function addValueToKey(key, value) {
	addrMap[key] = addrMap[key] || [];
	addrMap[key].push(value);
}


var listData = [];

console.log(listData);
<c:forEach items="${rl}" var="item">
	listData.push("${item.map_addr_front}");
</c:forEach>
listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
        	
        	var imageSrc = '<%=ctxPath %>/assets/img/cleanhouse_pointer.png',// 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(25, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
         	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다
                
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition, 
                image: markerImage // 마커이미지 설정 
            });
            
            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
            	content : iwContent
            });
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);  
            
         	// 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
              // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });
            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });
        } 
    });
});
//주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
function myFunction() {
//현재위치 설정
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}
// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
}
</script>
</body>
</html>