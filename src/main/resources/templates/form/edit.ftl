<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>EDIT CATEGORY</title>

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
    <link href="//css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="//css/lib/themify-icons.css" rel="stylesheet">
    <link href="//css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="//css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="//css/lib/helper.css" rel="stylesheet">
    <link href="//css/style.css" rel="stylesheet">
</head>

<body>

<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <div class="logo"><a href="index.ftl"><!-- <img src="images/logo.png" alt="" /> --><span>Focus</span></a></div>
            <ul>
                <div class="logo"><a href="index.ftl">
                        <!-- <img src="images/logo.png" alt="" /> --><span>Focus</span></a></div>
                <li class="label">Main</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-home"></i> Dashboard <span
                                class="badge badge-primary">2</span> <span
                                class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="index.ftl">Dashboard 1</a></li>
                        <li><a href="index.ftl">Dashboard 2</a></li>
                    </ul>
                </li>

                <li class="label">Apps</li>
                <li><a href="/category" >
                        <i class="ti-bar-chart-alt"></i>
                        Category Management
                    </a>
                </li>
                <li><a href="/blogs" >
                        <i class="ti-bar-chart-alt"></i>
                        Blogs Management
                    </a>
                </li>

                <li><a class="sidebar-sub-toggle"><i class="ti-target"></i> Pages <span
                                class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="page-login.html">Login</a></li>
                        <li><a href="page-register.html">Register</a></li>
                        <li><a href="page-reset-password.html">Forgot password</a></li>
                    </ul>
                </li>
                <li><a href="../documentation/index.html"><i class="ti-file"></i> Documentation</a></li>
                <li><a><i class="ti-close"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- /# sidebar -->


<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="float-left">
                    <div class="hamburger sidebar-toggle">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
                <div class="float-right">
                    <div class="dropdown dib">
                        <div class="header-icon" data-toggle="dropdown">
                            <i class="ti-bell"></i>
                            <div class="drop-down dropdown-menu dropdown-menu-right">
                                <div class="dropdown-content-heading">
                                    <span class="text-left">Recent Notifications</span>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">5 members joined today </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mariam</div>
                                                    <div class="notification-text">likes a photo of you</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Tasnim</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="text-center">
                                            <a href="#" class="more-link">See All</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown dib">
                        <div class="header-icon" data-toggle="dropdown">
                            <i class="ti-email"></i>
                            <div class="drop-down dropdown-menu dropdown-menu-right">
                                <div class="dropdown-content-heading">
                                    <span class="text-left">2 New Messages</span>
                                    <a href="email.html">
                                        <i class="ti-pencil-alt pull-right"></i>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/1.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Michael Qin</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/2.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Michael Qin</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="images/avatar/2.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="text-center">
                                            <a href="#" class="more-link">See All</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown dib">
                        <div class="header-icon" data-toggle="dropdown">
                                <span class="user-avatar">John
                                    <i class="ti-angle-down f-s-10"></i>
                                </span>
                            <div class="drop-down dropdown-profile dropdown-menu dropdown-menu-right">
                                <div class="dropdown-content-heading">
                                    <span class="text-left">Upgrade Now</span>
                                    <p class="trial-day">30 Days Trail</p>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <i class="ti-user"></i>
                                                <span>Profile</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="ti-email"></i>
                                                <span>Inbox</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ti-settings"></i>
                                                <span>Setting</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="ti-lock"></i>
                                                <span>Lock Screen</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ti-power-off"></i>
                                                <span>Logout</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="content-wrap">
    <div class="main">
        <h3 class="text-primary">EDIT CATEGORY</h3>
        <!-- /# row -->
        <form name="category" action="/category/edit" method="POST" style="
                margin: 0 30%;
            ">

            <div class="hidden" class="form-group">
                <label for="id">Name</label>
                <input class="form-control"
                       type="text"
                       required
                       name="id"
                       value="${(category.id)!''}"
                />
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input class="form-control"
                       type="text"
                       required
                       name="name"
                       placeholder="Input name category..."
                       value="${(category.name)!''}"
                />
            </div>
            <div class="form-group">
                <label for="Active">Active</label>
                <select
                        name="active"
                        class="form-control" id="active">
                    <#--<#list years as year>
                        <option value="${year?c}"<#if (year == .now?string("yyyy"))> selected="selected"</#if>>${year?c}</option>
                    </#list>-->
                    <#if category.active?string == 'true'>
                        <option selected value="TRUE">TRUE</option>
                        <option  value="FALSE">FALSE</option>
                    </#if>
                    <#if category.active?string == 'false'>
                        <option  value="TRUE">TRUE</option>
                        <option selected value="FALSE">FALSE</option>
                    </#if>

                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
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