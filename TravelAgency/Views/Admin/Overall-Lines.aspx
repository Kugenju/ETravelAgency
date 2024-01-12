<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Overall-Lines.aspx.cs" Inherits="TravelAgency.Views.Admin.Overall_Lines" %>
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
                                    <li class="active">线路总览</li>
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
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <asp:GridView ID="OLGV" class="table student-data-table m-t-20" runat="server"></asp:GridView>
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