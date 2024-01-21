<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TravelAgency.Views.Admin.index" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyBody" runat="server">
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>您好, <span>欢迎进入系统</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">仪表盘</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                 <section id="main-content">
                    <form runat="server">
                      <div class="row">
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-five">
                                    <div class="stat-icon">
                                        <i class="ti-home bg-primary"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-heading color-primary">用户</div>
                                        <div class="stat-text">
                                            <asp:Label ID="USERCOUNT" runat="server" Text="Label"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-five">
                                    <div class="stat-icon">
                                        <i class="ti-file bg-success"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-heading color-success">导游数</div>
                                        <div class="stat-text"><asp:Label ID="GUIDECOUNT" runat="server" Text="Label"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-five">
                                    <div class="stat-icon">
                                        <i class="ti-info bg-danger"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-heading color-primary">旅行线路</div>
                                        <div class="stat-text"><asp:Label ID="LINECOUNT" runat="server" Text="Label"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-five">
                                    <div class="stat-icon bg-warning">
                                        <i class="ti-world"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-heading color-primary">总利润</div>
                                        <div class="stat-text"><asp:Label ID="TOTALPROFIT" runat="server" Text="Label"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card alert">
                                    <div class="card-header pr">
                                        <label>每月营收</label>
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
                                    <div class="card-body">
                                        <div class="table-responsive">
                                             <asp:GridView class="table student-data-table m-t-20" ID="MONTHPANEL" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="月份" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="MON" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "month").ToString()%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        
                                                        <asp:TemplateField HeaderText="收益" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="PROFIT" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MonthProfit").ToString()%>'></asp:Label>
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
                            <div class="col-lg-6">
                                <div class="card alert">
                                    <div class="card-header pr">
                                        <label>线路营收</label>
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
                                    <div class="card-body">
                                        <div class="table-responsive">
                                             <asp:GridView class="table student-data-table m-t-20" ID="LineStats" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="线路名称" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="LNAME" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LineName").ToString()%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="选择人数" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="NUMP" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "members").ToString()%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="总收益" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="PROFIT" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TotalProfit").ToString()%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="开始时间" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="StartTime" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StartTime").ToString()%>'></asp:Label>
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
                                                        <asp:Button ID="PreBtn2" class="btn btn-group-left btn-outline-navy m-b-10 m-l-5" runat="server" Text="上一页" OnClick="PreBtnClick2" />
                                                        <asp:Button ID="NextBtn2" class="btn btn-group-right btn-outline-navy m-b-10 m-l-5" runat="server" Text="下一页" OnClick="NextBtnClick2" />
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
</asp:Content>

