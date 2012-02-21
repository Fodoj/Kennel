//= require ./plugins/jquery.dataset.js
//= require rails.validations
//= require jquery_nested_form
//= require ckeditor/ckeditor


$(function() {
    $(".pet-form").submit(function() {
      form = $(this);
      form.find('.pet-sex-value').val(
        form.find('.pet-type-buttons .active').dataset('sex')
      );
    });
});
