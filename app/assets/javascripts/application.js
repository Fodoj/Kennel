//= require jquery
//= require jquery_ujs
//= require plugins/jquery.mousewheel.js
//= require plugins/jquery.jscrollpane.min.js
//= require plugins/jquery.kwicks-1.5.1.js
//= require plugins/bootstrap-tooltip.js

$(function() {

  //Photos scroller on blog post page
  var thumbnails_scroller = $('.thumbnails-scroller');
  if (thumbnails_scroller.length != 0) {
    thumbnails_scroller.height($('.post-body').height()).jScrollPane({
      autoReinitialise: true
    });
  }

  //Photos scroller on photo viewer page
  var photo_album_previews = $('.photo-album-container ul');
  $(photo_album_previews).width(
    $(photo_album_previews).find('li').length*$(photo_album_previews).find('li:last-child').outerWidth(true)
  );

  var photo_album_container = $('.photo-album-container');
  if (photo_album_container.length != 0) {
    photo_album_container.jScrollPane({
      autoReinitialise: true
    }).data('jsp');

    var api = photo_album_container.data('jsp');

    //Scroll to opened photo on load
    api.scrollToX(
      $('.photo-current').parent().position().left - 372, true);

    //Horizontal scrolling for mouse wheel
    photo_album_container.bind(
              'mousewheel',
                      function (event, delta, deltaX, deltaY)
                      {
                          api.scrollByX(delta*-80);
                          return false;
                      }
    );;
  }

  //Main page slider
  $('#slider-inner ul').kwicks({
		max : 567,
		spacing : 0
  });


  //Switchers for more\less description on pet page
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

  //Tooltip everything that moves
  $("[rel=tooltip]").tooltip();

  //Pet page avatar switcher on thumb hover
  $('.pet-avatar-switcher').click(
      function() {
        var new_photo = $(this).data('title-photo');
        var new_thumb = $(this).find('img').attr('src');
        var avatar = $('.photo-pet-avatar');

        $(this).data('title-photo', avatar.attr('src'));
        $(this).find('img').attr('src', avatar.data('thumb-photo'));


        avatar.attr('src', new_photo);
        avatar.data('thumb-photo', new_thumb);
        return false;
      }
  );

});
