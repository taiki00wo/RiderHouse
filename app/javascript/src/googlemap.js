document.addEventListener('turbolinks:load', function(){
  getCurrentLocation();
});

//現在地の取得
function getCurrentLocation() {
  navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
}

//initMapに現在地の位置情報を渡す
function successCallback(position) {
  var currentLocation = { lat: position.coords.latitude, lng: position.coords.longitude };
  initMap(currentLocation);
}

function errorCallback(error) {
  var currentLocation = { lat: 35.678877, lng: 139.770320 };
  initMap(currentLocation);
  console.log(error);
}

function initMap(currentLocation){
  var marker = [];
  var infoWindow = [];

  if (currentLocation) {
    //現在の緯度と経度をcenter
    var center = { lat: currentLocation.lat, lng: currentLocation.lng };
  } else {
    //デフォルトの位置情報
    var center = { lat: 35, lng: 136 };
  }

  let map = new google.maps.Map(document.getElementById('map'), {
  center: center, //地図の中心点
  zoom: 8 //地図の拡大・縮小
  });

  for (var i = 0; i < gon.riderhouses.length; i++ ) {
    // マーカーの追加
    marker[i] = new google.maps.Marker({ 
      // マーカーを立てる位置を指定
      position: {lat: gon.riderhouses[i].latitude, lng: gon.riderhouses[i].longitude}, 
      // マーカーを立てる地図を指定
      map: map 
    });

    // 吹き出しの追加
    infoWindow[i] = new google.maps.InfoWindow({ 
      // 吹き出しに表示する内容
      content: `<div class="map">${gon.riderhouses[i].name}</div>` 
    });

    markerEvent(i);
  }

  function markerEvent(i) {  
    // マーカーをクリックしたとき
    marker[i].addListener('click', function() { 
      // 吹き出しの表示
      infoWindow[i].open(map, marker[i]); 
    });
  }
}