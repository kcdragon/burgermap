$('.sort-by').change(function() {
    selection = $('.sort-by option:selected').val();
    $('input[name=sort]').val(selection);
    $('#search-form button').trigger('click'); // using trigger instead of submit since it works with Turbolinks
});
