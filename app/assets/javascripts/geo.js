$(function(){
  function getPosition() {
    navigator.geolocation.getCurrentPosition(

      function(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        const latitudeObj = `<input value=${latitude} type="hidden" name='latitude'>`;
        const longitudeObj = `<input value=${longitude} type="hidden" name='longitude'>`;
        const element = document.getElementById('haiku-form');
        element.insertAdjacentHTML("beforeend", latitudeObj);
        element.insertAdjacentHTML("beforeend", longitudeObj);
        debugger
        element.submit();
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

  $(".submit-haiku").on('click', function(){
    getPosition();
    return false;
  });
});