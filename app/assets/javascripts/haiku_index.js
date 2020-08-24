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

  function canfav(data){
    let html = `<i class="fa fa-star" data-icon-id=${data}></i>`
    return html
  };

  function removefav(data){
    let html = `<i class="far fa-star"  data-icon-id=${data}></i>`
    return html
  };

  let path =  location.pathname
  if (path == "/") {
    navigator.geolocation.watchPosition(

      function(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        const distance = $("select").val();
        $.ajax({
          url: "/",
          type: "GET",
          dataType: 'json',
          data: {latitude: latitude, longitude: longitude, distance: distance}
        })
        .done(function(haikus) {
          if (haikus.length !== 0) {
            $(".haiku-middle").empty();
            $.each(haikus, function(i, haiku) {
              $(".haiku-middle").append(buildHTML(haiku));
              if (haiku.favorites){
                $(`div[data-haiku-id='${haiku.id}']`).find(".haiku-middle__contents__content__left").append(canfav(haiku.id));
              }else{
                $(`div[data-haiku-id='${haiku.id}']`).find(".haiku-middle__contents__content__left").append(removefav(haiku.id));
              };
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

    $(document).on('click', '.far', function() {
      const haiku_id = $(this).parents('.haiku-middle__contents').data();
      $.ajax({
        url: "/favorites",
        type: "POST",
        dataType: 'json',
        data: haiku_id
      })
      .done(function(data) {
        $(`i[data-icon-id=${data.id}]`).remove();
        $(`div[data-haiku-id=${data.id}]`).find('.haiku-middle__contents__content__left').append(canfav(data.id));
      })
      .fail(function() {
        alert('error');
      });
    });

    $(document).on('click', '.fa', function() {
      const haiku_id = $(this).parents('.haiku-middle__contents').data();
      $.ajax({
        url: `/favorites/${haiku_id.haikuId}`,
        type: "DELETE",
        dataType: 'json',
        data: haiku_id
      })
      .done(function(data) {
        $(`i[data-icon-id=${data.id}]`).remove();
        $(`div[data-haiku-id=${data.id}]`).find('.haiku-middle__contents__content__left').append(removefav(data.id));
      })
      .fail(function() {
        alert('error');
      });
    });
  };
});