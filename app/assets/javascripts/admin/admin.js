//= require ./plugins/jquery.dataset.js
//= require jquery_nested_form

$(function() {
    $(".pet-form").submit(function() {
      form = $(this);
      form.find('.pet-sex-value').val(
        form.find('.pet-type-buttons .active').dataset('sex')
      );
    });
});
