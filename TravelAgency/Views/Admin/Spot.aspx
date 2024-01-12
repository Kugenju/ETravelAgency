<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Spot.aspx.cs" Inherits="TravelAgency.Views.Admin.Spot" %>
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
                                <h1>仪表盘</h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">仪表盘</a></li>
                                    <li class="active">景点</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <section id="main-content">
                    <form runat="server">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card alert">
                                    <div class="card-header pr">
                                        <h4>修改景点信息</h4>
                                    </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>景点名称</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="SNameTb" runat="server"/>
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>地址</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="SAddressTb" runat="server"/>
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>价格</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="50" id="SPriceTb" runat="server" />
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <label id="ErrMsg" runat="server"></label>
                                        </div>
                                        <asp:Button ID="EditBtn" class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5" runat="server" Text="修改" OnClick="EditBtn_Click"/>
                                        <asp:Button ID="ResetBtn" class="btn btn-default btn-lg m-b-10 m-l-5" runat="server" Text="删除" OnClick="ResetBtn_Click"/>
                                </div>
                                <div class="card alert">
                                    <div class="card-header pr">
                                        <h4>添加景点信息</h4>
                                    </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>景点名称</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="SNTb" runat="server">
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>地址</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="SATb" runat="server">
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>价格</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="50" id="SPTb" runat="server" />
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <label id="Msg" runat="server"></label>
                                        </div>
                                        <asp:Button ID="SaveBtn" class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5" runat="server" Text="保存" OnClick="SaveBtn_Click"/>
                                        <asp:Button ID="Res" class="btn btn-default btn-lg m-b-10 m-l-5" runat="server" Text="重置" OnClick="Res_Click"/>
                                </div>
                            </div>
                            <div class="col-md-9">
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
                                    <div class="card-body">
                                    <div class="table-responsive">
                                        <asp:GridView class="table student-data-table m-t-20" ID="SGV" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="SGV_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="景点名称" />
                                                <asp:BoundField HeaderText="地址" />
                                                <asp:BoundField HeaderText="价格" />
                                                <asp:TemplateField HeaderText="行为">

                                                </asp:TemplateField>
                                            </Columns>
                                            
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            
                                        </asp:GridView>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
