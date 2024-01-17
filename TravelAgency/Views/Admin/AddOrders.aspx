<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrders.aspx.cs" Inherits="TravelAgency.Views.Admin.AddOrders" EnableEventValidation="false"%>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>旅行社管理后台</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ================= Favicon ================== -->

    <link href="../../assets/css/lib/chartist/chartist.min.css" rel="stylesheet">
    <link href="../../assets/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="../../assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="../../assets/css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="../../assets/css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="../../assets/css/lib/weather-icons.css" rel="stylesheet" />
    <link href="../../assets/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="../../assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/css/lib/unix.css" rel="stylesheet">
    <link href="../../assets/css/admin/style.css" rel="stylesheet">
</head>
<body>

        <!-- /# sidebar -->
    <div class="header">
        <div class="pull-left">
            <div class="logo"><a href="#"><!-- <img src="assets/images/logo.png" alt="" /> --><span>旅行社管理系统</span></a></div>
            <div class="hamburger sidebar-toggle">
                <span class="line"></span>
                <span class="line"></span>
                <span class="line"></span>
            </div>
        </div>
        <div class="pull-right p-r-15">
            <ul>
                <li class="header-icon dib"><a href="#search"><i class="ti-search"></i></a></li>
                <li class="header-icon dib"><img class="avatar-img" src="../../assets/images/avatar/1.jpg" alt="" /> <span class="user-avatar">Admin<i class="ti-angle-down f-s-10"></i></span>
                    <div class="drop-down dropdown-profile">
                        <div class="dropdown-content-heading">
                            <span class="text-left">Upgrade Now</span>
                            <p class="trial-day">30 Days Trail</p>
                        </div>
                        <div class="dropdown-content-body">
                            <ul>
                                <li><a href="#"><i class="ti-settings"></i> <span>Setting</span></a></li>
                                <li><a href="#"><i class="ti-help-alt"></i> <span>Help</span></a></li>
                                <li><a href="#"><i class="ti-lock"></i> <span>Lock Screen</span></a></li>
                                <li><a href="#"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                            </ul>
                        </div>
                    </div>
                </li>


            </ul>
        </div>
    </div>

    <div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>访客界面</h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">访客界面</a></li>
                                <li class="active">订单</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <section id="main-content">
                <form runat="server">
                    <div class="row">
                        <div>
                            <div class="card alert">
                                <div class="card-header pr">
                                    <h4></h4>
                                    <div class="search-action">
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="Search by Name" type="text">
                                        </div>
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="Search by Address" type="text">
                                        </div>
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="Search by Price" type="text">
                                        </div>
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="search" type="text">
                                        </div>
                                    </div>
                                    <div class="card-header-right-icon">
                                        <ul>
                                            <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                            <li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                                <ul class="card-option-dropdown dropdown-menu">
                                                    <li><a href="#"><i class="ti-loop"></i> Update data</a></li>
                                                    <li><a href="#"><i class="ti-menu-alt"></i> Detail log</a></li>
                                                    <li><a href="#"><i class="ti-pulse"></i> Statistics</a></li>
                                                    <li><a href="#"><i class="ti-power-off"></i> Clear ist</a></li>
                                                </ul>
                                            </li>
                                            <li class="doc-link"><a href="#"><i class="ti-link"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card alert">
                                        <div class="card-header pr">
                                            <h4>线路详情</h4>
                                        </div>
                                            <div class="basic-form m-t-20">
                                                <div class="form-group">
                                                    <label>线路名称</label>
                                                    <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="HNameTb" runat="server">
                                                </div>
                                            </div>
                                            <div class="basic-form m-t-20">
                                                <div class="form-group">
                                                    <label>起始时间</label>
                                                    <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="HAddressTb" runat="server">
                                                </div>
                                            </div>
                                            <div class="basic-form m-t-20">
                                                <div class="form-group">
                                                    <label>终止时间</label>
                                                    <input type="text" class="form-control border-none input-flat bg-ash" placeholder="300" id="HPriceTb" runat="server">
                                                </div>
                                            </div>
                                            <div class="basic-form m-t-20">
                                                <div class="form-group">
                                                    <label>交通方式</label>
                                                    <input type="text" class="form-control border-none input-flat bg-ash" placeholder="300" id="Text1" runat="server">
                                                </div>
                                            </div>
                                            <div class="basic-form m-t-20">
                                                <div class="form-group">
                                                    <label>费用</label>
                                                    <input type="text" class="form-control border-none input-flat bg-ash" placeholder="300" id="Text2" runat="server">
                                                </div>
                                            </div>
                                            <div class="basic-form m-t-20">
                                                <label id="ErrMsg" runat="server"></label>
                                            </div>
                                            <asp:Button ID="EditBtn" class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5" runat="server" Text="提交订单" />
                                            <asp:Button ID="ResetBtn" class="btn btn-default btn-lg m-b-10 m-l-5" runat="server" Text="重置" />
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                <div class="card-body">
                                    <div class="table-responsive">
                                            <asp:GridView class="table student-data-table m-t-20" ID="OLGV" runat="server" AutoGenerateSelectButton="True" OnRowDeleting="OLGV_Del" OnSelectedIndexChanged="OLGV_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="线路ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LineID").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                            
                                                    <asp:TemplateField HeaderText="线路名称">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LNA" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LineName").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                            
                                                    <asp:TemplateField HeaderText="开始时间">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LST" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StartTime").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="结束时间">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LET" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EndTime").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="交通方式">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LTR" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Transportaion").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="价格">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LP" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="操作">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="delbutton" runat="server" CommandName="Delete" CausesValidation="false">删除</asp:LinkButton>
                                                        </ItemTemplate>
                            
                                                    </asp:TemplateField>

                                                </Columns>
                                                <pagertemplate>
                                                    <table>
                                                        <tr>
                                                            <td style="width:100%; text-align:right">
                                                                <asp:Label ID="PagerMsg" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="PreBtn" class="btn btn-group-left btn-outline-navy m-b-10 m-l-5" runat="server" Text="上一页" OnClick="PreBtnClick" />
                                                    <asp:Button ID="NextBtn" class="btn btn-group-right btn-outline-navy m-b-10 m-l-5" runat="server" Text="下一页" OnClick="NextBtnClick" />
                                                </pagertemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            </asp:GridView>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer">
                                <p>This dashboard was generated on <span id="date-time"></span> <a href="#" class="page-refresh">Refresh Dashboard</a></p>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>

    <div id="search">
        <button type="button" class="close">×</button>
        <form>
            <input type="search" value="" placeholder="type keyword(s) here" />
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>


        

    <script src="../../assets/js/lib/jquery.min.js"></script>
    <!-- jquery vendor -->
    <script src="../../assets/js/lib/jquery.nanoscroller.min.js"></script>
    <!-- nano scroller -->
    <script src="../../assets/js/lib/menubar/sidebar.js"></script>

</body>
</html>
