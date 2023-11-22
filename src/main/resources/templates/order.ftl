<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Đặt cơm</title>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">
    <!-- Styles -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
    <link href="/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/css/lib/helper.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">

    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>

<body>
<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <form>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <a href="/orders?type=2" class="list-group-item list-group-item-action">
                                        Tất cả các ngày
                                    </a>
                                </div>
                                <div class="form-group col-md-3">
                                    <a href="/orders?type=1" class="list-group-item list-group-item-action active">
                                        Hôm nay
                                    </a>
                                </div>
                                <div class="form-group col-md-3">
                                    <a onclick="copyToSky()" href="#" class="list-group-item list-group-item-action">
                                        Copy dán sang Sky
                                    </a>
                                </div>
                            </div>
                        </form>
                        <#if success?? && success?has_content>
                            <div class="d-inline-block" style="background-color: #d7f0ff;">
                                <span class="text-primary">${success}</span>
                            </div>
                        </#if>
                        <#if error?? && error?has_content>
                            <div class="d-inline-block" style="background-color: #d7f0ff;">
                                <span class="text-danger">${error}</span>
                            </div>
                        </#if>

                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <#--                                <a class="btn btn-primary" href="/blogs/insert" role="button">ADD BLOG</a>-->
                                <button type="button" class="btn btn-primary" id="create-order" data-toggle="modal"
                                       onclick="openPopup()" data-whatever="@fat">Đặt cơm
                                </button>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <div class="modal fade" id="modelQR" tabindex="-1" role="dialog" aria-labelledby="modelQRLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    </div>
                </div>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Đặt cơm</h5>
                            <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="modal-form-all" class="insert-order-form">
                                <div class="form-group">
                                    <label for="name" class="col-form-label">Tên:</label>
                                    <input type="text" class="form-control name" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="name" class="col-form-label">Phòng:</label>
                                    <input type="text" class="form-control department   " id="department">
                                </div>
                                <div class="form-group">
                                    <select id="multiple-checkboxes" multiple="multiple">
                                        <#list menus as m>
                                            <#if m.name??>
                                                <option value="${m.name}">${m.name}</option>
                                            </#if>
                                        </#list>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="menu" class="col-form-label">Số lượng:</label>
                                    <input type="number" value="1" class="form-control quantity" id="quantity">
                                </div>
                                <div class="form-group">
                                    <label for="note" class="col-form-label">Ghi chú:</label>
                                    <textarea class="form-control note-order" id="note"></textarea>
                                </div>
<#--                                <div class="form-group">-->
<#--                                    <label class="col-form-label">Trạng thái thanh toán:</label>-->
<#--                                    <select class="custom-select payment" id="payment">-->
<#--                                        <option value="0" selected>Chọn trạng thái...</option>-->
<#--                                        <option value="1">Đã CK</option>-->
<#--                                        <option value="0">Chưa CK</option>-->
<#--                                    </select>-->
<#--                                </div>-->
<#--                                <div class="form-group">-->
<#--                                    <select id="example-single-selected">-->
<#--                                        <option value="1">Option 1</option>-->
<#--                                        <option value="2" selected="selected">Option 2</option>-->
<#--                                        <!-- Option 3 will be selected in advance ... &ndash;&gt;-->
<#--                                        <option value="3" selected="selected">Option 3</option>-->
<#--                                        <option value="4">Option 4</option>-->
<#--                                        <option value="5">Option 5</option>-->
<#--                                        <option value="6">Option 6</option>-->
<#--                                    </select>-->
<#--                                </div>-->
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary close-modal"  data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary submit-insert">Đặt</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <#--                            <div class="card-title">-->
                            <#--                                <h4>Bootstrap Data Table </h4>-->

                            <#--                            </div>-->
                            <div class="bootstrap-data-table-panel">
                                <div class="table-responsive">
                                    <table id="row-select" class="text-center display table table-borderd table-hover">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên</th>
                                            <th>Phòng</th>
                                            <th>Món</th>
                                            <th>Số lượng</th>
                                            <th>Ghi chú</th>
                                            <th>Thời gian</th>
                                            <th>Nội dung CK</th>
                                            <th class="text-center">Trạng thái thanh toán</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <#if orders?size != 0 >
                                            <#assign index = 1>
                                            <#list orders as o>
                                                <tr>
                                                    <td>${index}</td>
                                                    <#assign index = index + 1>
                                                    <#if o.name??>
                                                         <td>${o.name}</td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>
                                                    <#if o.department??>
                                                        <td>${o.department}</td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>
                                                    <#if o.menu??>
                                                        <td>${o.menu}</td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>
                                                    <td>${o.quantity}</td>
                                                    <#if o.note??>
                                                        <td>${o.note}</td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>
<#--                                                    <#if o.createTime??>-->
<#--                                                        <td>${o.createTime}</td>-->
<#--                                                    <#else>-->
<#--                                                        <td></td>-->
<#--                                                    </#if>-->
                                                    <#if o.qrPayment??>
                                                        <td class="qr-code" index="${o.id}">
                                                            <div class="btn-group btn-group-sm" role="group" aria-label="Hành động">
                                                                <a onclick="showQR(${o.id})"
                                                                   data-toggle="tooltip" data-placement="top"
                                                                   title="Hiển thị QR" class="btn btn-primary btn-sm text-white">
                                                                    <img id="qr-${o.id}" style="width: 50px;" src="${o.qrPayment}"/>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>
                                                    <#if o.description??>
                                                        <td>${o.description}</td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>
                                                    <td class="${(o.payment==1)?string("bg-primary","bg-danger")}">${(o.payment==1)?string("Đã CK","Chưa CK")}</td>
                                                    <td>
                                                        <div class="btn-group btn-group-sm" role="group" aria-label="Hành động">
                                                            <a onclick="editOrder(${o.id})"
                                                               data-toggle="tooltip" data-placement="top"
                                                               title="Edit" class="btn btn-primary btn-sm text-white">
                                                                <i class='fa fa-edit'></i>
                                                            </a>
                                                            <a  href="/orders/delete/${o.id}"
                                                               class="btn btn-danger btn-sm">
                                                                <i class="fa fa-trash"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <#if (index > orders?size)>
                                                <tr>
                                                    <td class="text-primary">Tổng</td>
                                                    <td class="text-danger">${orders?size}</td>
                                                </tr>
                                                </#if>
                                            </#list>
                                        </#if>
                                        <#--                                            draw list category    -->
                                        <#if orders?size == 0  >
                                            <tr>
                                                <td>
                                                    <span>Chưa có ai đặt cơm bị rỗng</span>
                                                </td>
                                            </tr>
                                        </#if>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer">
                            <p>2018 © Admin Board. - <a href="#">example.com</a></p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<!-- jquery vendor -->
<script src="/js/lib/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<script src="/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="/js/lib/menubar/sidebar.js"></script>
<script src="/js/lib/preloader/pace.min.js"></script>
<!-- sidebar -->
<script>
    $('.hamburger').trigger('click');
    $('.hamburger').on('click', function () {
        if ($(this).hasClass('is-active')) {
            return false;
        }
    })

</script>
<!-- bootstrap -->

<script src="/js/lib/bootstrap.min.js"></script>
<script src="/js/scripts.js"></script>
<script src="/js/api-app.js"></script>
<script>
    function editOrder(id){
        var lst = JSON.parse('${orderJsons}');
        $('#exampleModal').modal();
        $.each(lst , function(index, o) {
            if(o.id == id){
                $('.name').val(o.name);
                $('.department').val(o.department);
                $('.name').attr('id-order', o.id);
                // $('.menu').val(o.menu);
                var menus = (o.menu.replaceAll(', ',',')).split(',');
                $("#multiple-checkboxes").val(menus);
                $("#multiple-checkboxes").multiselect("refresh");
                $('.quantity').val(o.quantity);
                $('.note-order').val(o.note);
                $(".payment").val(o.payment).change();
                var form = $('.submit-insert');
                form.removeClass('submit-insert');
                form.addClass('submit-update');
                form.text('Cập nhật')
            }
        });
    }

    function showQR(id){
        var src = $('#qr-'+id).attr('src');
        $('#modelQR').modal();
        const parent = $('#modelQR').find('.modal-content');
        parent.empty();
        parent.append('<img src="'+src+'"/>')
    }

    function copyToSky(){
        var lst = JSON.parse('${orderJsons}');
        $('.open-popup').trigger('click')
        var value = '';
        $.each(lst , function(index, o) {
            value += o.name+ ' '+ o.quantity+'s: '+o.menu+''+'('+o.note+') \n' ;
        });
        let copyElement = document.createElement("textarea");
        copyElement.style.position = 'fixed';
        copyElement.style.opacity = '0';
        let valueContent = value;
        copyElement.textContent = valueContent;
        var body = document.getElementsByTagName('body')[0];
        body.appendChild(copyElement);
        copyElement.select();
        document.execCommand('copy');
        body.removeChild(copyElement);
        var html = `<div style="top:0!important;position: fixed!important;" class="myAlert-top alert alert-success">
                          <span style="color: white;">Copy thành công!</span>
                        </div>`;
        $('body').append(html);
        setTimeout(function () {
            $('.alert').remove();
        }, 1000);
    }
    function openPopup(){
        $('#exampleModal').modal();
    }
    $(document).ready(function() {
        $(".qr-code").hover(function(){
            $('#modelQR').modal();
            var id = $(this).attr('index');
            showQR(id);
            // $(this).css("background-color", "yellow");
        }, function(){
            $('#modelQR').modal('hide');
        });
        $('#multiple-checkboxes').multiselect({
            nonSelectedText: 'Chọn món',
            buttonText: function(options, select) {
                var numberOfOptions = $(this).children('option').length;
                if (options.length === 0) {
                    return this.nonSelectedText + '';
                } else {
                    var selected = '';
                    options.each(function() {
                        var label = ($(this).attr('label') !== undefined) ?
                            $(this).attr('label') : $(this).html();
                        selected += label + ', ';
                    });
                    return selected.substr(0, selected.length - 2) + '';

                }
            }
        });
        // $('.multiselect-selected-text').text('Chưa chọn món nào');
        $('.multiselect').removeClass('btn-default');
        $('.multiselect').addClass('btn-primary');
    });
</script>
<!-- scripit init-->
<#--    <script src="/js/lib/data-table/datatables.min.js"></script>
    <script src="/js/lib/data-table/dataTables.buttons.min.js"></script>-->
<script src="/js/lib/data-table/jszip.min.js"></script>
<script src="/js/lib/data-table/pdfmake.min.js"></script>
<script src="/js/lib/data-table/vfs_fonts.js"></script>
<script src="/js/lib/data-table/buttons.html5.min.js"></script>
<script src="/js/lib/data-table/buttons.print.min.js"></script>
<script src="/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="/js/lib/data-table/datatables-init.js"></script>

</body>

</html>