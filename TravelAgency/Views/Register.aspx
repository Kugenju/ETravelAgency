<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TravelAgency.Views.Register" EnableEventValidation="false"%>

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
            <li class="nav-item"><a class="nav-link" >Lines</a></li>
            <li class="nav-item"><a class="nav-link" >Guides</a></li>
            <li class="nav-item"><a class="nav-link">Travel With Us</a></li>
            <li class="nav-item"><a class="nav-link">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->
    <!-- 以下页面的为背景、主标题、登陆界面框包括输入框等 -->
   <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('../assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5"  id="section-home">
      <div class="overlay"></div>
        <div class="container">
            <div class="probootstrap-animate col-md">
                  <form action="#" class="probootstrap-form" runat="server">
                    <div class="form-group">
                      <div class="row mb-3">
                        <div class="col-md">
                          <div class="form-group">
                            <h1 class="align-content-center">注册账号</h1><!--账号对应用户密码 -->
                            <label for="id_label_single">账号</label>
                            <input type="" class="form-control border-none input-flat bg-ash" id="Usb" runat="server"/>
                          </div>
                        </div>
                      </div>
                        <div class="row mb-5">
                          <div class="col-md">
                            <div class="form-group">
                              <label for="probootstrap-date-departure">昵称</label>
                              <input type="" class="form-control border-none input-flat bg-ash" id="CuName" runat="server"/>
                            </div>
                          </div>
                        </div>
                        <div class="row mb-5">
                          <div class="col-md">
                            <div class="form-group">
                              <label for="probootstrap-date-departure">地址</label>
                              <input type="" class="form-control border-none input-flat bg-ash" id="CuAddress" runat="server"/>
                            </div>
                          </div>
                        </div>
                        <div class="row mb-5">
                          <div class="col-md">
                            <div class="form-group">
                              <label for="probootstrap-date-departure">电话号码</label>
                              <input type="" class="form-control border-none input-flat bg-ash" id="PhoneNumber" runat="server"/>
                            </div>
                          </div>
                        </div>
                      <!-- END row -->
                      <div class="row mb-5">
                        <div class="col-md">
                          <div class="form-group">
                            <label for="probootstrap-date-departure">密码</label>
                            <input type="password" class="form-control border-none input-flat bg-ash" id="Passwordt" runat="server"/>
                          </div>
                        </div>
                      </div>
                    <div class="row mb-5">
                      <div class="col-md">
                        <div class="form-group">
                          <label for="probootstrap-date-departure">确认密码</label>
                          <input type="password" class="form-control border-none input-flat bg-ash" id="Passwordt2" runat="server"/>
                        </div>
                      </div>
                    </div>
                        <div>
                            <asp:CheckBox id="CheckBox1" runat="server" />
                            <asp:Label ID="Label1" runat="server" Text="Label">是否接受用户协议</asp:Label>
                        </div>
                      <!-- END row -->
                      <div class="row">
                        <div class="col-md">
                            <asp:Button ID="Butt2" runat="server" Text="注册" class="btn btn-primary btn-block" OnClick="Register_Click"/>
                        </div>
                      </div>

                    <div class="row">
                        <div class="col-md">
                            <label id="ErrMsg" runat="server"></label>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
        </div>
    
    </section>
    <!-- END section -->

    
    <!-- END section -->

    

    

    <!-- 以下为页面依赖的js脚本 -->
    <script src="../assets/js/jquery.min.js"></script>
    
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>

    <script src="../assets/js/bootstrap-datepicker.js"></script>
    <script src="../assets/js/jquery.waypoints.min.js"></script>
    <script src="../assets/js/jquery.easing.1.3.js"></script>

    <script src="../assets/js/select2.min.js"></script>

    <script src="../assets/js/main.js"></script>
</body>
</html>

