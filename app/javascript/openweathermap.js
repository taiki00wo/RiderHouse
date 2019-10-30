$(document).on('turbolinks:load', function() {
  var API_KEY = '87c9b797acb182d8bf9070b90c72a99f' //envに格納
  var city = 'Tokyo'; //現在地の緯度・経度に変更
  var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(data) {
    var insertHTML = "";
    var cityName = '<h2>' + data.city.name + '</h2>';
    $('#city-name').html(cityName);
    for (var i = 0; i <= 8; i = i + 2) {
      insertHTML += buildHTML(data, i);
    }
    $('#weather').html(insertHTML);
  })
  .fail(function(data) {
    console.log('取得に失敗しました');
  });
});


function buildHTML(data, i) {
  var Week = new Array("（日）","（月）","（火）","（水）","（木）","（金）","（土）");
  var date = new Date (data.list[i].dt_txt);
  date.setHours(date.getHours() + 9);
  var month = date.getMonth()+1;
  var day = month + "月" + date.getDate() + "日" + Week[date.getDay()];
  var time = date.getHours() + "：00";
  var icon = data.list[i].weather[0].icon;
  var html =
    '<div class="weather-report d-inline-block">' +
      '<img src="http://openweathermap.org/img/w/' + icon + '.png">' +
      '<div class="weather-date">' + day + '</div>' +
      '<div class="weather-time">' + time + '</div>' +
      '<div class="weather-temp">' + Math.round(data.list[i].main.temp) + '℃' + '</div>' +
    '</div>';
  return html
}