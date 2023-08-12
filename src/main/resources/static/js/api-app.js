const API_ORDER = '/api/order/'

$(document).ready(function () {
    $(".submit-insert").click(function () {
        var api = API_ORDER;
        const form = $('.form-order-insert');
        let name = $('.name');
        let menu = $('.menu');
        let quantity = $('.quantity');
        let note = $('.note-order');
        var payment = $($('.payment').find(":selected")).val();
        var dataBody = '';
        if($(this).hasClass('submit-update')){
            api += 'update'
            dataBody = JSON.stringify({
                id: name.attr('id-order'),
                name: name.val(),
                menu: menu.val(),
                quantity: parseInt(quantity.val()),
                note: note.val(),
                payment: parseInt(payment)
            })
        }else{
            api += 'insert'
            dataBody = JSON.stringify({
                name: name.val(),
                menu: menu.val(),
                quantity: parseInt(quantity.val()),
                note: note.val(),
                payment: parseInt(payment)
            })
        }
        $('.alert').remove();
        $.ajax({
            type: 'POST',
            contentType: "application/json",
            url: api,
            data: dataBody,
            success: function (resp) {
                if (!resp.success) {
                    var html = `<div style="top:0!important;position: fixed!important;" class="myAlert-top alert alert-danger">
                          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                          <strong>Thất bại!</strong> ` + resp.message + `
                        </div>`;
                    $('#exampleModal').append(html);
                    setTimeout(function () {
                        $('.alert').remove();
                    }, 1000)
                } else {
                    var html = `<div style="top:0!important;position: fixed!important;" class="myAlert-top alert alert-success">
                          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                          <strong>Thành công!</strong>
                        </div>`;
                    $('#exampleModal').append(html);
                    setTimeout(function () {
                        $('.alert').remove();
                    }, 1000);
                    $('button[data-dismiss="modal"]').trigger('click');
                    window.location.reload();
                }
            }
        });
    });
});
