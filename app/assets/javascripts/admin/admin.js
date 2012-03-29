//= require jquery
//= require jquery_ujs
//= require ./plugins/jquery.dataset.js
//= require ./plugins/jquery.wysiwyg.js
//= require ./plugins/wysiwyg.link.js
//= require rails.validations
//= require jquery_nested_form
//= require bootstrap.js
$(function() {
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
});

var check_owner = function() {
  if ( $("#pet_owned").is(":checked") ) {
    $("#pet_owner_id").attr("disabled", true);
    $("#pet_owner_id").val("");
  }
  else {
    $("#pet_owner_id").attr("disabled", false);
  }
}
