$(function(){

  function buildHTML(haiku){
    let html = `<div class="haiku-middle__contents" data-haiku-id=${haiku.id}>
    <div class="haiku-middle__contents__content">
    <div class="haiku-middle__contents__content__left">
    <div class="haiku-middle__contents__content__left__name">
    <a href="/users/${haiku.user_id}">
    <span>${haiku.name}さん</span>
    </a>
    </div>
    <div class="haiku-middle__contents__content__left__haiku">
    <span>${haiku.prefecture}${haiku.city}${haiku.ward}で一句詠みました。</span>
    <span class="haiku-created-at">${haiku.created_at}前</span>
    </div>
    </div>
    <a href="/haikus/${haiku.id}">
    <div class="haiku-middle__contents__content__right">
    <div class="haiku-middle__contents__content__right__haidoku">
    拝読
    </div>
    </div>
    </a>
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
        const distance = $("select").val();
        console.log(distance);
        $.ajax({
          url: "/",
          type: "GET",
          dataType: 'json',
          data: {latitude: latitude, longitude: longitude, distance: distance}
        })
        .done(function(haikus) {
          if (haikus.length !== 0) {
            let insertHTML = '';
            $.each(haikus, function(i, haiku) {
              insertHTML += buildHTML(haiku)
              $(".haiku-middle").empty();
              $(".haiku-middle").append(insertHTML);
            });
          }
        })
        .fail(function() {
          alert('error');
        });
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

// if( navigator.geolocation ){
//   // 現在位置を取得できる場合の処理
//   console.log('ok')
//   } else {
//   // 現在位置を取得できない場合の処理
//   }