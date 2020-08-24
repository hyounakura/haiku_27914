$(function() {
  $('.scroll-bottom__icon').click(function() {
    $('.haiku-middle').animate({
        scrollTop: $('.haiku-middle')[0].scrollHeight
    }, 30);
    return false;
});
})