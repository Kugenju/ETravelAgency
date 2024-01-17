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
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>起始时间</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>终止时间</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>交通方式</label>
                                                        <select class="form-control bg-ash border-none">
							                                                        <option></option>
							                                                        <option>高铁</option>
							                                                        <option>大巴</option>
							                                                        <option>飞机</option>
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
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>价格</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>旅行天数</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
            
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>酒店列表</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>导游列表</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="basic-form">
                                                    <div class="form-group">
                                                        <label>景点列表</label>
                                                        <input type="text" class="form-control border-none input-flat bg-ash" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5 sbmt-btn" type="button">保存</button>
                                        <button class="btn btn-default btn-lg m-b-10 m-l-5 sbmt-btn" type="button">重置</button>
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