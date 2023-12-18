<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TravelAgency.Admin.login" %>

<!DOCTYPE html>
<!-- 作为登陆网站，与客户数据库进行连接-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<title>旅行社管理系统</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
    
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">

		<link rel="stylesheet" href="../assets/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="../assets/fonts/ionicons/css/ionicons.min.css">
    
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    
    <link rel="stylesheet" href="../assets/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="../assets/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../assets/css/select2.css">
    

    <link rel="stylesheet" href="../assets/css/helpers.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <!--css、字体等风格设定 -->
</head>
<body>
    <!-- 以下为导航栏-->
    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
        <a class="navbar-brand" href="/">旅行社管理系统</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a class="nav-link" href="login.aspx">Home</a></li>
            <li class="nav-item"><a class="nav-link" >City Guides</a></li>
            <li class="nav-item"><a class="nav-link" >Services</a></li>
            <li class="nav-item"><a class="nav-link">Travel With Us</a></li>
            <li class="nav-item"><a class="nav-link">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->
    <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5"  id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Explore The World With Ease</h2>
            <p class="lead mb-5 probootstrap-animate">
              

            </p>
              <a href="onepage.html" role="button" class="btn btn-primary p-3 mr-3 pl-5 pr-5 text-uppercase d-lg-inline d-md-inline d-sm-block d-block mb-3">See OnePage Verion</a> 
            </p>
          </div> 
          <div class="col-md probootstrap-animate">
            <form action="#" class="probootstrap-form">
              <div class="form-group">
                <div class="row mb-3">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single">From</label>

                      <label for="id_label_single" style="width: 100%;">
                        <select class="js-example-basic-single js-states form-control" id="id_label_single" style="width: 100%;">
                          <option value="Australia">Australia</option>
                          <option value="Japan">Japan</option>
                          <option value="United States">United States</option>
                          <option value="Brazil">Brazil</option>
                          <option value="China">China</option>
                          <option value="Israel">Israel</option>
                          <option value="Philippines">Philippines</option>
                          <option value="Malaysia">Malaysia</option>
                          <option value="Canada">Canada</option>
                          <option value="Chile">Chile</option>
                          <option value="Chile">Zimbabwe</option>
                        </select>
                      </label>


                    </div>
                  </div>
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single2">To</label>
                      <div class="probootstrap_select-wrap">
                        <label for="id_label_single2" style="width: 100%;">
                        <select class="js-example-basic-single js-states form-control" id="id_label_single2" style="width: 100%;">
                          <option value="Australia">Australia</option>
                          <option value="Japan">Japan</option>
                          <option value="United States">United States</option>
                          <option value="Brazil">Brazil</option>
                          <option value="China">China</option>
                          <option value="Israel">Israel</option>
                          <option value="Philippines">Philippines</option>
                          <option value="Malaysia">Malaysia</option>
                          <option value="Canada">Canada</option>
                          <option value="Chile">Chile</option>
                          <option value="Chile">Zimbabwe</option>
                        </select>
                      </label>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- END row -->
                <div class="row mb-5">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-departure">Departure</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" id="probootstrap-date-departure" class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                  <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-arrival">Arrival</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" id="probootstrap-date-arrival" class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                </div>
                <!-- END row -->
                <div class="row">
                  <div class="col-md">
                    <label for="round" class="mr-5"><input type="radio" id="round" name="direction">  Round</label>
                    <label for="oneway"><input type="radio" id="oneway" name="direction">  Oneway</label>
                  </div>
                  <div class="col-md">
                    <input type="submit" value="Submit" class="btn btn-primary btn-block">
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    
    </section>
    <!-- END section -->
</body>
</html>
