$(function(){
  let path =  location.pathname
  if (path == "/haikus/new") {
    $(".form-kami")[0].focus();
    $(".form-kami").on('keydown', function(e){
      let val = $(".form-kami").val()
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
        $(".haiku-new-middle__kami__content").html(val);
        $(".haiku-new-middle__kami__content").animate({opacity: "0.7"}, 7000);
        $(".form-naka")[0].focus();
      return false
      };
    });

    $(".form-naka").on('keydown', function(e){
      let val = $(".form-naka").val()
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
        $(".haiku-new-middle__naka__content").html(val);
        $(".haiku-new-middle__naka__content").animate({opacity: "0.7"}, 7000);
        $(".form-simo")[0].focus();
      return false
      };
    });

    $(".form-simo").on('keydown', function(e){
      let val = $(".form-simo").val()
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
        $(".haiku-new-middle__simo__content").html(val);
        $(".haiku-new-middle__simo__content").animate({opacity: "0.7"}, 7000);
        $(".submit-haiku")[0].focus();
        return false
      };
    });
  };
});