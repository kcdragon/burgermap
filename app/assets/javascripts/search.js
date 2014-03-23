$('.sort-by').change(function() {
    selection = $('.sort-by option:selected').val();
    $('input[name=sort]').val(selection);
    $('#search-form').submit();
});
