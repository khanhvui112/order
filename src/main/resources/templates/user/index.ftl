<!DOCTYPE html>
<html lang="en">
  <head>
    <title>BLOG WEBSITE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="user//css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="user//css/animate.css">
    
    <link rel="stylesheet" href="user//css/owl.carousel.min.css">
    <link rel="stylesheet" href="user//css/owl.theme.default.min.css">
    <link rel="stylesheet" href="user//css/magnific-popup.css">

    <link rel="stylesheet" href="user//css/aos.css">

    <link rel="stylesheet" href="user//css/ionicons.min.css">

    <link rel="stylesheet" href="user//css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="user//css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="user//css/flaticon.css">
    <link rel="stylesheet" href="user//css/icomoon.css">
    <link rel="stylesheet" href="user//css/style.css">
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight img" style="background-image: url(http://localhost:8080/user/images/sidebar-bg.jpg);">
			<h1 id="colorlib-logo" class="mb-4"><a href="/">BLOG</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="/">Home</a></li>
					<#if categories?size != 0 >
						<#list categories as c>
							<li><a href="#">${c.name}</a></li>
						</#list>
					</#if>

				</ul>
			</nav>

			<div class="colorlib-footer">
				<div class="mb-4">
					<h3>Subscribe for newsletter</h3>
					<form action="#" class="colorlib-subscribe-form">
            <div class="form-group d-flex">
            	<div class="icon"><span class="icon-paper-plane"></span></div>
              <input type="text" class="form-control" placeholder="Enter Email Address">
            </div>
          </form>
				</div>
				<p class="pfooter"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
	    	<div class="container px-0">
	    		<div class="row no-gutters">

					<#if blogs?size != 0 >
						<#list blogs as b>
							<div class="col-md-4 d-flex">
								<div class="blog-entry ftco-animate">
									<a href="/blogs/details/${b.id}" class="img" style="background-image: url(http://localhost:8080/user/images/image_4.jpg);"></a>
									<div class="text p-4">
										<h3 class="mb-2"><a href="blog-show.ftl">${b.title}</a></h3>
										<div class="meta-wrap">
											<p class="meta">
												<span><i class="icon-calendar mr-2"></i>${b.createTime}</span>
												<span><a href="/blogs/details/${b.id}"><i class="icon-folder-o mr-2"></i>Travel</a></span>
												<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
											</p>
										</div>
										<p class="mb-4">${b.content}</p>
										<p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
									</div>
								</div>
							</div>
						</#list>
					</#if>

	    		</div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="user//js/jquery.min.js"></script>
  <script src="user//js/jquery-migrate-3.0.1.min.js"></script>
  <script src="user//js/popper.min.js"></script>
  <script src="user//js/bootstrap.min.js"></script>
  <script src="user//js/jquery.easing.1.3.js"></script>
  <script src="user//js/jquery.waypoints.min.js"></script>
  <script src="user//js/jquery.stellar.min.js"></script>
  <script src="user//js/owl.carousel.min.js"></script>
  <script src="user//js/jquery.magnific-popup.min.js"></script>
  <script src="user//js/aos.js"></script>
  <script src="user//js/jquery.animateNumber.min.js"></script>
  <script src="user//js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="user//js/google-map.js"></script>
  <script src="user//js/main.js"></script>
    
  </body>
</html>