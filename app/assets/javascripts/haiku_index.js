$(function(){
  function buildHTML(haiku){
    let html = `<div class="haiku-middle__contents" data-haiku-id=${haiku.id}>
    <div class="haiku-middle__contents__content">
    <div class="haiku-middle__contents__content__left">
    <span>${haiku.name}さんが${haiku.prefecture}${haiku.city}${haiku.ward}で一句詠みました。</span>
    </div>
    <div class="haiku-middle__contents__content__right">
    <span>日付</span>
    </div>
    </div>
    </div>`
    return html;
  };

  let path =  location.pathname
  if (path == "/") {
    navigator.geolocation.watchPosition(

      function(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        $.ajax({
          url: "/",
          type: "GET",
          dataType: 'json',
          data: {latitude: latitude, longitude: longitude}
        })
        .done(function(haikus) {
          if (haikus.length !== 0) {
            let insertHTML = '';
            $.each(haikus, function(i, haiku) {
              insertHTML += buildHTML(haiku)
              $(".haiku-middle").empty();
              $(".haiku-middle").prepend(insertHTML);
            });
          }
        })
      },

      function(error) {
        switch(error.code) {
          case 1:
            alert("位置情報の利用が許可されていません");
            break;
          case 2:
            alert("現在位置が取得できませんでした");
            break;
          case 3:
            alert("タイムアウトになりました");
            break;
          default:
            alert("その他のエラー(エラーコード:"+error.code+")");
            break;
        };
      }
    );
  };
});