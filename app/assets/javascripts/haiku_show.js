$(function(){
  let path =  location.pathname
  if (path !== "/haikus/new") {
    setTimeout(function(){
      $(".haiku-show-middle__kami__content").animate({opacity: "0.7"}, 7000);
    }, 1500);
    setTimeout(function(){
      $(".haiku-show-middle__naka__content").animate({opacity: "0.7"}, 7000);
    }, 6000);
    setTimeout(function(){
      $(".haiku-show-middle__simo__content").animate({opacity: "0.7"}, 7000);
    }, 11000);
    setTimeout(function(){
      $(".haiku-show-btn__favorite, .haiku-show-btn__created-at").animate({opacity: "1"}, 5000);
    }, 15000);
  };
});