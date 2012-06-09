//= require jquery
//= require jquery_ujs
//= require ./plugins/jquery.dataset.js
//= require ./plugins/jquery.wysiwyg.js
//= require ./plugins/wysiwyg.link.js
//= require ./plugins/jquery.tablesorter.min.js
//= require ../plugins/jquery.mousewheel.js
//= require ../plugins/jquery.jscrollpane.min.js
//= require rails.validations
//= require jquery_nested_form
//= require bootstrap.js
$(function() {

    //Update sex hidden field before form submit
    $(".pet-form").submit(function() {
      form = $(this);
      form.find('.pet-sex-value').val(
        form.find('.pet-type-buttons .active').dataset('sex')
      );
    });

    check_owner();
    $("#pet_owned").change(function() {
      check_owner();
    });


    //Posts wyiwyg text editor
    $(".editor").wysiwyg({
      controls: {
        copy: false,
        cut: false,
        insertImage: false,
        outdent: false,
        pase: false,
        redo: false,
        removeFormat: false,
        superscript: false,
        subscript: false,
        undo: false,
        code: false,
        cssWrap: false,
        h1: false,
        h2: false,
        h3: false,
        insertTable: false,
        insertHorizontalRule: false,
        increaseFontSize: {visible:  true },
        decreaseFontSize: {visible:  true }
      }
    });


    //Show new person form on pet new/edit page
    $('.pet-new-person').click(function(e) {
      var holder = $(this).closest('.controls');
      holder.find('select').hide();
      holder.find('input').show();
      $(this).hide();
      return false;
    });


    //Sort pets tables
    $("#table-pets").tablesorter({
      cssAsc: "asc",
      cssDesc: "desc"
    });


    //Post photos chooser
    $(".photos-chooser .choosable").toggle(
      function() {
        var that = $(this);
        that.addClass("choosed");
        that.closest(".choosable-container").find('input').attr('checked', true);
      },
      function() {
        var that = $(this);
        that.removeClass("choosed");
        that.closest(".choosable-container").find('input').attr('checked', false);
      }
    );

    $(".show-photos-chooser").click(function() {
      $(this).closest(".controls").find('select').remove();
    });

    $("#photos-chooser-modal").on('hide', function() {
        var choosed_count = $(".choosed").length;
        $(".show-photos-chooser").text("Выбрать фотографии ("+choosed_count+")")
    });
});

var check_owner = function() {
  if ( $("#pet_owned").is(":checked") ) {
    $("#pet_owner_id").attr("disabled", true);
    $("#new_owner_name").attr("disabled", true);
    $("#pet_owner_id").val("");
  }
  else {
    $("#pet_owner_id").attr("disabled", false);
    $("#new_owner_name").attr("disabled", false);
  }
}
