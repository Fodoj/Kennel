//= require jquery
//= require jquery_ujs
//= require plugins/jquery.mousewheel.js
//= require plugins/jquery.jscrollpane.min.js

$(function() {
  $('.thumbnails-scroller').css('height', $('.post-body').height());
  $('.thumbnails-scroller').jScrollPane({
    autoReinitialise: true
  });
});
