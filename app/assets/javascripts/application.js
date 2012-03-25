//= require jquery
//= require jquery_ujs
//= require plugins/jquery.mousewheel.js
//= require plugins/jquery.jscrollpane.min.js
//= require plugins/jquery.kwicks-1.5.1.js

$(function() {
  thumbnails_scroller = $('.thumnails-scroller');
  if (thumbnails_scroller.length != 0) {
    thumbnails_scroller.height($('.post-body').height());
    thumbnails_scroller.jScrollPane().data('jsp').reinitialise();
  }

  var photo_album_previews = $('.photo-album-container ul');
  $(photo_album_previews).width(
    $(photo_album_previews).find('li').length*$(photo_album_previews).find('li:last-child').outerWidth(true)
  );

  var photo_album_container = $('.photo-album-container');
  if (photo_album_container.length != 0) {
    photo_album_container.bind('jsp-initialised',
        function(event, isScrollable)
        {
            if (photo_album_container.data('jsp') != undefined) {
              photo_album_container.data('jsp').scrollToX(
                $('.photo-current').parent().position().left - 372, true);
            }
        }
    ).jScrollPane().data('jsp').reinitialise();
  }

  $('#slider-inner ul').kwicks({
		max : 567,
		spacing : 0
  });

});
