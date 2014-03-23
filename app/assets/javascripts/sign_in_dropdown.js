var set_focus_to_email = function() {
    $('input[type=email]').focus();
}

var set_focus_to_search = function() {
    $('input#q').focus();
}

$('.sign-in-dropdown > a').hover(
    set_focus_to_email,
    set_focus_to_search
);

$('.sign-in-dropdown .dropdown-content').hover(
    set_focus_to_email,
    set_focus_to_search
);
