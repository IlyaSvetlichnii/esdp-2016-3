function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
}

(function() {
    setInterval(function() {
        var cnt = 0
        $('form :input[type=radio]').each(function() {
            if ($(this).prop("checked") == true) {
                cnt ++
            }
        });

        if (cnt != 20) {
            $('#register').attr('disabled', 'disabled');
        } else {
            $('#register').removeAttr('disabled');
        }
    }, 1000);
})()