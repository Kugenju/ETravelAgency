<%@ Page Title="" Language="C#"  MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TravelAgency.Views.Admin.Register" %>
<!DOCTYPE html> <!-- 作为登陆网站，与客户数据库进行连接--> <html xmlns="http://www.w3.org/1999/xhtml"> <head runat="server"> <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>     <meta charset="utf-8"> 		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  		<title>旅行社管理系统</title> 		<meta name="description" content=""> 		<meta name="keywords" content="">                <!-- Styles -->
    <link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/lib/unix.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet"> </head>


<body class="bg-primary">
    <div class="unix-login">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                    <div class="login-content">
                        <div class="login-form">
                            <h4>注册</h4>
                            <form runat="server">
                                <div class="form-group">
                                    <label>用户名</label>
                                    <input id="UserName" class="form-control" type="" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>住址</label>
                                    <input id="address" class="form-control" type="" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>密码</label>
                                    <input id="password" class="form-control" type="" runat="server" />
                                </div>

                                <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-flat m-b-30 m-t-30" Text="注册" OnClick="PerformRegisterBtn_Click" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>