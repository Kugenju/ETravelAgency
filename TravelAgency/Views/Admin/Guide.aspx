<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Guide.aspx.cs" Inherits="TravelAgency.Views.Admin.Guide" EnableEventValidation="false" %>
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
                                    <li class="active">导游</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <section id="main-content" >
                    <form runat="server">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card alert">
                                    <div class="card-header pr">
                                        <h4>导游信息管理</h4>
                                    </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>姓名</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="GNameTb" runat="server">
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>联系方式</label>
                                                <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="GContactTb" runat="server">
                                            </div>
                                        </div>
                                        <div class="basic-form m-t-20">
                                            <label id="ErrMsg" runat="server"></label>
                                        </div>
                                        <asp:Button ID="EditBtn" class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5" runat="server" Text="修改" OnClick="EditBtn_Click"/>
                                        <asp:Button ID="ResetBtn" class="btn btn-default btn-lg m-b-10 m-l-5" runat="server" Text="添加" OnClick="SaveBtn_Click"/>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="card alert">
                                    <div class="card-header pr">
                                        <h4></h4>
                                        <div class="search-action">
                                            <div class="search-type dib">
                                                <input class="form-control input-rounded" placeholder="Search by Name" type="text">
                                            </div>
                                            <div class="search-type dib">
                                                <input class="form-control input-rounded" placeholder="Search by Contact" type="text">
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
                                            <asp:GridView class="table student-data-table m-t-20" ID="GGV" runat="server" AutoGenerateSelectButton="True" OnRowDeleting="GGV_Del" OnSelectedIndexChanged="GGV_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="导游ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GIL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "GuideID").ToString()%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                
                                                <asp:TemplateField HeaderText="导游名称">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GNL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "GuideName").ToString()%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                
                                                <asp:TemplateField HeaderText="导游联系方式">
                                                    <ItemTemplate>
                                                        <asp:Label ID="GCL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Contact").ToString()%>'></asp:Label>
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
                    </form>
                </section>
            </div>

        </div>
    </div>
</asp:Content>
