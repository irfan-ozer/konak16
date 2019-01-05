$('#wecallyou').on('click', function(e) {
    e.preventDefault();
    $('#modal-wecallyou').modal('show');
});



$('#wecallyou-button').on('click', function (e) {
    e.preventDefault();

    var modal = $('#modal-wecallyou');
    var fullname = $('input[name="fullname"]', modal).val();
    var phone = $('input[name="phone"]', modal).val();
    var alert = $('#modal-wecallyou').find('.alert');
    var href = $('#wecallyou').attr('href');

    alert.addClass('hide').html('');

    $.post(href, {'fullname': fullname, 'phone': phone}, function(response) {

        if (response.success) {
            modal.find('.modal-body').html(response.message);
            $('#wecallyou-button').hide();
        } else {
            alert.html(response.message);
            alert.removeClass('hide');
        }
    }, 'json');
});
