<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TravelAgency.Admin.login" EnableEventValidation="false"%>  <!DOCTYPE html> <!-- 作为登陆网站，与客户数据库进行连接--> <html xmlns="http://www.w3.org/1999/xhtml" lang="en"> <head runat="server"> <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>     <meta charset="utf-8"> 		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  		<title>旅行社管理系统</title> 		<meta name="description" content=""> 		<meta name="keywords" content="">               <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">  		<link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.css">     <link rel="stylesheet" href="../../assets/css/animate.css">     <link rel="stylesheet" href="../../assets/fonts/ionicons/css/ionicons.min.css">          <link rel="stylesheet" href="../../assets/css/owl.carousel.min.css">          <link rel="stylesheet" href="../../assets/fonts/flaticon/font/flaticon.css">      <link rel="stylesheet" href="../../assets/fonts/fontawesome/css/font-awesome.min.css">     <link rel="stylesheet" href="../../assets/css/bootstrap-datepicker.css">     <link rel="stylesheet" href="../../assets/css/select2.css">           <link rel="stylesheet" href="../../assets/css/helpers.css">     <link rel="stylesheet" href="../../assets/css/style.css">     <!--css、字体等风格设定 --> </head> <body>     <!-- 以下为导航栏-->     <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">       <div class="container">         <a class="navbar-brand" href="/">旅行社管理系统</a>         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">           <span><i class="ion-navicon"></i></span>         </button>         <div class="collapse navbar-collapse" id="probootstrap-menu">           <ul class="navbar-nav ml-auto">             <li class="nav-item active"><a class="nav-link" href="login.aspx">Home</a></li>             <li class="nav-item"><a class="nav-link" >Lines</a></li>             <li class="nav-item"><a class="nav-link" >Guides</a></li>             <li class="nav-item"><a class="nav-link">Travel With Us</a></li>             <li class="nav-item"><a class="nav-link">Contact</a></li>           </ul>         </div>       </div>     </nav>     <!-- END nav -->     <!-- 以下页面的为背景、主标题、登陆界面框包括输入框等 -->    <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('../../assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5"  id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">旅行，让你的心灵自由飞翔</h2>
            <p class="lead mb-5 probootstrap-animate">
              

            </p>
              <a href="onepage.html" role="button" class="btn btn-primary p-3 mr-3 pl-5 pr-5 text-uppercase d-lg-inline d-md-inline d-sm-block d-block mb-3">Contact Us</a> 
            </p>
          </div> 
          <div class="col-md probootstrap-animate">
            <form action="#" class="probootstrap-form" runat="server">
              <div class="form-group">
                <div class="row mb-3">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single">邮箱</label>
                      <input type="email" class="form-control" id="EmailTb"/>

                    </div>
                  </div>
                </div>
                <!-- END row -->
                <div class="row mb-5">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-departure">密码</label>
                      <input type="password" class="form-control" id="PasswordTb"/>
                    </div>
                  </div>
                </div>
                <!-- END row -->
                <div class="row">
                  <div class="col-md">
                    <label for="round" class="mr-5"><input type="radio" id="round" name="direction">  用户</label>
                    <label for="oneway"><input type="radio" id="oneway" name="direction">  管理员</label>
                  </div>
                  <div class="col-md">
                    <asp:Button ID="LoginBtn" runat="server" Text="登陆" class="btn btn-primary btn-block"/>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    
    </section>
    <!-- END section -->      <section class="probootstrap_section" id="section-feature-testimonial">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-12 text-center mb-5 probootstrap-animate">
            <h2 class="display-4 border-bottom probootstrap-section-heading">为什么我们热爱旅行</h2>
            <blockquote class="">
              <p class="lead mb-4"><em>人生就是一次充满未知的旅行，在乎的是沿途的风景，在乎的是看风景的心情，旅行不会因为美丽的风景终止。走过的路成为背后的风景，不能回头不能停留，若此刻停留，将会错过更好的风景，保持一份平和，保持一份清醒。享受每一刻的感觉，欣赏每一处的风景，这就是人生。</em></p>
              <p class="probootstrap-author">
                <a href="#" target="_blank">
                  <img src="../../assets/images/person_1.jpg" alt="Free Template by ProBootstrap.com" class="rounded-circle">
                  <span class="probootstrap-name">James Smith</span>
                  <span class="probootstrap-title">Chief Executive Officer</span>
                </a>
              </p>
            </blockquote>

          </div>
        </div>
        
      </div>
    </section>
    <!-- END section -->      <section class="probootstrap_section" id="section-city-guides">
      <div class="container">
        <div class="row text-center mb-5 probootstrap-animate">
          <div class="col-md-12">
            <h2 class="display-4 border-bottom probootstrap-section-heading">世界顶级景点</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="../../assets/images/img_1.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <div class="probootstrap-text">
                <h3>Buena</h3>
              </div>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="../../assets/images/img_2.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Road</h3>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="../../assets/images/img_3.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Australia</h3>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="../../assets/images/img_4.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Japan</h3>
            </a>
          </div>
        </div>
      </div>
    </section>      <footer class="probootstrap_section probootstrap-border-top">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-3">
            <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
            <ul class="list-unstyled">
              <li><a href="#" target="_blank">Home</a></li>
              <li><a href="#" target="_blank">About</a></li>
              <li><a href="#" target="_blank">Services</a></li>
              <li><a href="#" target="_blank">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-3">
            <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
            <ul class="list-unstyled">
              <li><a href="#" target="_blank">Home</a></li>
              <li><a href="#" target="_blank">About</a></li>
              <li><a href="#" target="_blank">Services</a></li>
              <li><a href="#" target="_blank">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-3">
            <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
            <ul class="list-unstyled">
              <li><a href="#" target="_blank">Home</a></li>
              <li><a href="#" target="_blank">About</a></li>
              <li><a href="#" target="_blank">Services</a></li>
              <li><a href="#" target="_blank">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-3">
            <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
            <ul class="list-unstyled">
              <li><a href="#" target="_blank">Home</a></li>
              <li><a href="#" target="_blank">About</a></li>
              <li><a href="#" target="_blank">Services</a></li>
              <li><a href="#" target="_blank">Contact</a></li>
            </ul>
          </div>
        </div>
      </div>
    </footer>      <!-- 以下为页面依赖的js脚本 -->     <script src="../../assets/js/jquery.min.js"></script>
    
    <script src="../../assets/js/popper.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/owl.carousel.min.js"></script>

    <script src="../../assets/js/bootstrap-datepicker.js"></script>
    <script src="../../assets/js/jquery.waypoints.min.js"></script>
    <script src="../../assets/js/jquery.easing.1.3.js"></script>

    <script src="../../assets/js/select2.min.js"></script>

    <script src="../../assets/js/main.js"></script> </body> </html> 