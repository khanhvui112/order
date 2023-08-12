<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Blog Manager</title>

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
    <link href="/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/css/lib/helper.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">


    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>

<body>
<#--<div class="header">-->
<#--    <div class="container-fluid">-->
<#--        <div class="row">-->
<#--            <div class="col-lg-12">-->
<#--                <div class="float-left">-->
<#--                    <div class="hamburger sidebar-toggle is-active">-->
<#--                        <span class="line"></span>-->
<#--                        <span class="line"></span>-->
<#--                        <span class="line"></span>-->
<#--                    </div>-->
<#--                </div>-->
<#--                <div class="float-right">-->
<#--                    <div class="dropdown dib">-->
<#--                        <div class="header-icon" data-toggle="dropdown">-->
<#--                            <i class="ti-bell"></i>-->
<#--                            <div class="drop-down dropdown-menu dropdown-menu-right">-->
<#--                                <div class="dropdown-content-heading">-->
<#--                                    <span class="text-left">Recent Notifications</span>-->
<#--                                </div>-->
<#--                                <div class="dropdown-content-body">-->
<#--                                    <ul>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Mr. John</div>-->
<#--                                                    <div class="notification-text">5 members joined today </div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Mariam</div>-->
<#--                                                    <div class="notification-text">likes a photo of you</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Tasnim</div>-->
<#--                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Mr. John</div>-->
<#--                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li class="text-center">-->
<#--                                            <a href="#" class="more-link">See All</a>-->
<#--                                        </li>-->
<#--                                    </ul>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                    <div class="dropdown dib">-->
<#--                        <div class="header-icon" data-toggle="dropdown">-->
<#--                            <i class="ti-email"></i>-->
<#--                            <div class="drop-down dropdown-menu dropdown-menu-right">-->
<#--                                <div class="dropdown-content-heading">-->
<#--                                    <span class="text-left">2 New Messages</span>-->
<#--                                    <a href="email.html">-->
<#--                                        <i class="ti-pencil-alt pull-right"></i>-->
<#--                                    </a>-->
<#--                                </div>-->
<#--                                <div class="dropdown-content-body">-->
<#--                                    <ul>-->
<#--                                        <li class="notification-unread">-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/1.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Michael Qin</div>-->
<#--                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li class="notification-unread">-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/2.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Mr. John</div>-->
<#--                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Michael Qin</div>-->
<#--                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/2.jpg" alt="" />-->
<#--                                                <div class="notification-content">-->
<#--                                                    <small class="notification-timestamp pull-right">02:34 PM</small>-->
<#--                                                    <div class="notification-heading">Mr. John</div>-->
<#--                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>-->
<#--                                                </div>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li class="text-center">-->
<#--                                            <a href="#" class="more-link">See All</a>-->
<#--                                        </li>-->
<#--                                    </ul>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                    <div class="dropdown dib">-->
<#--                        <div class="header-icon" data-toggle="dropdown">-->
<#--                                <span class="user-avatar">John-->
<#--                                    <i class="ti-angle-down f-s-10"></i>-->
<#--                                </span>-->
<#--                            <div class="drop-down dropdown-profile dropdown-menu dropdown-menu-right">-->
<#--                                <div class="dropdown-content-heading">-->
<#--                                    <span class="text-left">Upgrade Now</span>-->
<#--                                    <p class="trial-day">30 Days Trail</p>-->
<#--                                </div>-->
<#--                                <div class="dropdown-content-body">-->
<#--                                    <ul>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <i class="ti-user"></i>-->
<#--                                                <span>Profile</span>-->
<#--                                            </a>-->
<#--                                        </li>-->

<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <i class="ti-email"></i>-->
<#--                                                <span>Inbox</span>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <i class="ti-settings"></i>-->
<#--                                                <span>Setting</span>-->
<#--                                            </a>-->
<#--                                        </li>-->

<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <i class="ti-lock"></i>-->
<#--                                                <span>Lock Screen</span>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                        <li>-->
<#--                                            <a href="#">-->
<#--                                                <i class="ti-power-off"></i>-->
<#--                                                <span>Logout</span>-->
<#--                                            </a>-->
<#--                                        </li>-->
<#--                                    </ul>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</div>-->




<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
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
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Đặt cơm</button>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Đặt cơm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="name" class="col-form-label">Tên:</label>
                                    <input type="text" class="form-control" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="menu" class="col-form-label">Món:</label>
                                    <textarea class="form-control" id="menu"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="menu" class="col-form-label">Số lượng:</label>
                                    <textarea class="form-control" id="menu"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="note" class="col-form-label">Ghi chú:</label>
                                    <textarea class="form-control" id="note"></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Trạng thái thanh toán:</label>
                                    <select class="custom-select" id="payment">
                                        <option selected>Chọn trạng thái...</option>
                                        <option value="1">Đã CK</option>
                                        <option value="2">Chưa CK</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">Đặt</button>
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
                                            <th>Món</th>
                                            <th>Số lượng</th>
                                            <th>Ghi chú</th>
                                            <th class="text-center">Trạng thái thanh toán</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <#if orders?size != 0 >
                                            <#list orders as b>
                                                <tr>
                                                    <td>${b.id}</td>
                                                    <td>${b.name}</td>
                                                    <td>${b.menu?string}</td>
                                                    <td>${b.quantity}</td>
                                                    <td>${b.note}</td>
                                                    <td>${b.payment?string?upper_case}</td>
                                                    <td>
                                                        <div class="btn-group btn-group-sm" role="group" aria-label="Hành động">
                                                            <a href="/blogs/edit/${b.id}"
                                                               data-toggle="tooltip" data-placement="top"
                                                               title="Edit" class="btn btn-primary btn-sm">
                                                                <i class='fas fa-edit'></i>
                                                            </a>
                                                            <a href="/blogs/delete/${b.id}"
                                                               class="btn btn-danger btn-sm">
                                                                <i class="fas fa-trash"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
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
<script src="/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="/js/lib/menubar/sidebar.js"></script>
<script src="/js/lib/preloader/pace.min.js"></script>
<!-- sidebar -->
<script>
    $('.hamburger').trigger('click');
    $('.hamburger').on('click', function (){
        if($(this).hasClass('is-active')){
            return false;
        }
    })

</script>
<!-- bootstrap -->

<script src="/js/lib/bootstrap.min.js"></script><script src="/js/scripts.js"></script>
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