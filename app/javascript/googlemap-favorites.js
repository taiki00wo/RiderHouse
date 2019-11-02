function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: gon.riderhouse.latitude, lng: gon.riderhouse.longitude},
  zoom: 15
  });

  marker = new google.maps.Marker({ // マーカーの追加
    position: {lat: gon.riderhouse.latitude, lng: gon.riderhouse.longitude}, // マーカーを立てる位置を指定
    map: map // マーカーを立てる地図を指定
  });

  infoWindow = new google.maps.InfoWindow({ // 吹き出しの追加
    content: `<div class="map-favorites">${gon.riderhouse.name}</div>` // 吹き出しに表示する内容
  });
  marker.addListener('click', function() { // マーカーをクリックしたとき
    infoWindow.open(map, marker); // 吹き出しの表示
  });
}