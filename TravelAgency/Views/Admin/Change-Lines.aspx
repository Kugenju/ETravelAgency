<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Change-Lines.aspx.cs" Inherits="TravelAgency.Views.Admin.Change_Lines" EnableEventValidation="false"%>
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
                                    <li class="active">修改线路</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <section id="main-content">
                    <form runat="server">
                        <div class="card alert">
                            <div class="row">
                                <div class="card alert">
                                    <div class="card-body">
                                        <div class="card-header m-b-20">
                                            <h4>线路信息</h4>
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
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>名称</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="LineName" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>起始时间</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="StartTime" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>终止时间</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="EndTime" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>交通方式</label>
                                                        <select class="form-control bg-ash border-none" id="Transport" runat="server">
							                                                        <option></option>
							                                                        <option>高铁</option>
							                                                        <option>大巴</option>
							                                                        <option>航空</option>

						                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>交通费用</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="TransFee" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>价格</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="Price" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>旅行天数</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="AllDay" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
            
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>酒店列表</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="HotelsL" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>导游列表</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="GuidesL" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>景点列表</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" id="SpotsL" runat="server"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Button ID="EditBtn" class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5" runat="server" Text="保存修改" OnClick="EditBtn_Click"/>
                                       
                                    </div>
                                </div>
                        </div>
                        </div>
                                                <div class="row">
                            <div class="col-md-6">
                                <div class ="card alert">
                                    <div class="card-body">
                                        <div class="card-header">
                                            <label>酒店信息</label>
                                        </div>
                                        <div class="table-responsive">
                                            <asp:GridView class="table student-data-table m-t-20" ID="ALHGV" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="AddHotel" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="酒店ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="HIL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "HotelID").ToString()%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="酒店名称">
                                                    <ItemTemplate>
                                                        <asp:Label ID="HNL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "HotelName").ToString()%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="地址">
                                                    <ItemTemplate>
                                                        <asp:Label ID="HAL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Address")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="价格">
                                                    <ItemTemplate>
                                                        <asp:Label ID="HPL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price")%>'></asp:Label>
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
                                    <div class ="card-body">
                                        <div class="card-header">
                                            <label>导游信息</label>
                                        </div>
                                            <div class="table-responsive">
                                                <asp:GridView class="table student-data-table m-t-20" ID="ALGGV" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="AddGuide" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
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

                                                </Columns>
                                                <pagertemplate>
                                                    <table>
                                                        <tr>
                                                            <td style="width:100%; text-align:right">
                                                                <asp:Label ID="PagerMsg" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="GPreBtn" class="btn btn-group-left btn-outline-navy m-b-10 m-l-5" runat="server" Text="上一页" OnClick="GPreBtnClick" />
                                                    <asp:Button ID="GNextBtn" class="btn btn-group-right btn-outline-navy m-b-10 m-l-5" runat="server" Text="下一页" OnClick="GNextBtnClick" />
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
                            <div class="col-md-6">
                                <div class="card alert">
                                    <div class="card-body">
                                        <div class="card-header">
                                            <label>景点信息</label>
                                        </div>
                                        <div class="table-responsive">
                                            <asp:GridView class="table student-data-table m-t-20" ID="ALSGV" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="AddSpot" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="景点ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SIL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SpotID").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                
                                                    <asp:TemplateField HeaderText="景点名称">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SNL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SpotName").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                
                                                    <asp:TemplateField HeaderText="地址">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SAL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Address")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                
                                                    <asp:TemplateField HeaderText="价格">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SPL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price")%>'></asp:Label>
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
                                                    <asp:Button ID="SPreBtn" class="btn btn-group-left btn-outline-navy m-b-10 m-l-5" runat="server" Text="上一页" OnClick="PreBtnClick" />
                                                    <asp:Button ID="SNextBtn" class="btn btn-group-right btn-outline-navy m-b-10 m-l-5" runat="server" Text="下一页" OnClick="NextBtnClick" />
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