<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="TravelAgency.Views.Admin.Hotel" %>
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
                                    <li class="active">酒店</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <section id="main-content" >
                    <form runat="server">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="card alert">
                                <div class="card-header pr">
                                    <h4>添加新酒店</h4>
                                </div>
                                    <div class="basic-form m-t-20">
                                        <div class="form-group">
                                            <label>酒店名称</label>
                                            <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="HNameTb" runat="server">
                                        </div>
                                    </div>
                                    <div class="basic-form m-t-20">
                                        <div class="form-group">
                                            <label>酒店地址</label>
                                            <input type="text" class="form-control border-none input-flat bg-ash" placeholder="" id="HAddressTb" runat="server">
                                        </div>
                                    </div>
                                    <div class="basic-form m-t-20">
                                        <div class="form-group">
                                            <label>价格</label>
                                            <input type="text" class="form-control border-none input-flat bg-ash" placeholder="300" id="HPriceTb" runat="server">
                                        </div>
                                    </div>
                                    
                                    <asp:Button ID="SaveBtn" class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5 sbmt-btn" runat="server" Text="保存" OnClick="SaveBtn_Click" />
                                    <asp:Button ID="ResetBtn" class="btn btn-default btn-lg m-b-10 m-l-5 sbmt-btn" runat="server" Text="重置" OnClick="ResetBtn_Click"/>
                                    <div class="basic-form m-t-20">
                                        <label id="ErrMsg" runat="server"></label>
                                    </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="card alert">
                                <div class="card-header pr">
                                    <h4></h4>
                                    <div class="search-action">
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="Search by Hotel" type="text">
                                        </div>
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="Search by Room..." type="text">
                                        </div>
                                        <div class="search-type dib">
                                            <input class="form-control input-rounded" placeholder="Search by bed" type="text">
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
                                    <div id="Htable" class="card-body">
                                        <asp:GridView class="table student-data-table m-t-20" ID="HGV" runat="server"  OnSelectedIndexChanged="HGV_SelectedIndexChanged" AutoGenerateSelectButton="True" OnPageIndexChanged="HGV_PageIndexChanged" OnPageIndexChanging="HGV_PageIndexChanging">
                                            <%--<PagerTemplate>
                                                当前第
                                                <!--((GridView)Container.NamingContainer)就是为了得到当前的控件-->
                                                <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                                                页/共
                                                <!--得到分页页面的总数-->            
                                                <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                                                页
                                                 <!--如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument-->
                                                <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                                    Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                                    CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
                                               <!--如果该分页是尾页，那么该连接就不会显示了-->
                                                <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                                    Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                                    Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
                                                转到第
                                                <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                                                <!--这里将CommandArgument即使点击该按钮e.newIndex 值为3--> 
                                                <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="3"
                                                    CommandName="Page" Text="GO" />
                                            </PagerTemplate>--%>
                                        </asp:GridView>
                                    </div>
                            </div>
                        </div>
                        <!-- /# column -->

                    </div>
                    <!-- /# row -->

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