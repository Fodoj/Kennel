//= require jquery
//= require jquery_ujs
//= require plugins/jquery.mousewheel.js
//= require plugins/jquery.jscrollpane.min.js
//= require plugins/jquery.kwicks-1.5.1.js

$(function() {
  $('.thumbnails-scroller').height($('.post-body').height());
  $('.thumbnails-scroller').jScrollPane({
    autoReinitialise: true
  });

  photo_album_previews = $('.photo-album-container ul');
  $(photo_album_previews).width(
    $(photo_album_previews).find('li').length*$(photo_album_previews).find('li:last-child').outerWidth(true)
  );
  $('.photo-album-container').jScrollPane({
    autoReinitialise: true
  });

  $('#slider-inner ul').kwicks({
		max : 568,
		spacing : 0
  });

});
