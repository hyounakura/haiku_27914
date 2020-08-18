$(function(){
  let path =  location.pathname
  if (path !== "/haikus/new") {
    setTimeout(function(){
      $(".haiku-new-middle__kami__content").animate({opacity: "0.7"}, 7000);
    }, 1500);
    setTimeout(function(){
      $(".haiku-new-middle__naka__content").animate({opacity: "0.7"}, 7000);
    }, 6000);
    setTimeout(function(){
      $(".haiku-new-middle__simo__content").animate({opacity: "0.7"}, 7000);
    }, 11000);
  };
});