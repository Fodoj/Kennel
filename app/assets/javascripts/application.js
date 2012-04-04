//= require jquery
//= require jquery_ujs
//= require plugins/jquery.mousewheel.js
//= require plugins/jquery.jscrollpane.min.js
//= require plugins/jquery.kwicks-1.5.1.js
//= require plugins/bootstrap-tooltip.js

$(function() {
  var thumbnails_scroller = $('.thumbnails-scroller');
  if (thumbnails_scroller.length != 0) {
    thumbnails_scroller.height($('.post-body').height()).jScrollPane({
      autoReinitialise: true
    });
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
            var api = photo_album_container.data('jsp');
            if (api != undefined) {
              api.scrollToX(
                $('.photo-current').parent().position().left - 372, true);
              api.reinitialise();
              photo_album_container.bind(
              'mousewheel',
                      function (event, delta, deltaX, deltaY)
                      {
                          api.scrollByX(delta*-80);
                          return false;
                      }
              );
            }
        }
    ).jScrollPane().data('jsp').reinitialise()
  }

  $('#slider-inner ul').kwicks({
		max : 567,
		spacing : 0
  });

  $('.thumbnail-album').hover(
      function() {
        $(this).find('.caption').animate({
          height: '2em'
        }, 100, function() {
        });
      },
      function() {
        $(this).find('.caption').animate({
          height: '1em'
        }, 100, function() {
        });
      }
  );

  $(".more-pet").click(function() {
      var descs = $(this).closest('.pet-description');
      descs.find('.more-description').show();
      descs.find('.short-description').hide();
      return false;
  });

  $(".less-pet").click(function() {
      var descs = $(this).closest('.pet-description');
      descs.find('.more-description').hide();
      descs.find('.short-description').show();
      return false;
  });

  $("[rel=tooltip]").tooltip();

});
