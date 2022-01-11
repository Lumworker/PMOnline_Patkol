<%@ Page Title="Monitering" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMMoniter.aspx.cs" Inherits="PMOnline.PMMoniter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .max-wide {
            max-width: 100%;
        }

        .datepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        .ui-datepicker {
            z-index: 2 !important;
        }

        .btn-margin-left {
            margin-left: 2px;
        }

        .TextBoxCost {
            text-align: center;
            display: block;
            height: 100%;
            padding: 5px 5px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }

        .textSummary {
            font-size: 15px;
            font-weight: bold;
        }
        .panel-default > .panel-heading{
            background-color: #ffffff;
            border-color: #f5f5f5;
        }
    </style>
    <div style="overflow: hidden; width: 0; height: 0;">
    <asp:TextBox runat="server" ID="snsstcExportYear" />
    <asp:TextBox runat="server" ID="snstxtExportITTagGroup" />
</div>
    <%--========Start Tab Menu===========--%>
    <div class="panel nav-tab panel-default" style="margin-top: 2em;">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="nav-item active">
                    <a href="#Dashboard" class="nav-link" role="tab" data-toggle="tab" id="TabDashboard">Dashboard</a>
                </li>
                <li class="nav-item ">
                    <a href="#ReportAssign" class="nav-link" data-toggle="tab" role="tab">Report Assign</a>
                </li>
                <li class="nav-item ">
                    <a href="#Export" class="nav-link" data-toggle="tab" role="tab">Export</a>
                </li>
                <li class="nav-item ">
                    <a href="#Work" class="nav-link" data-toggle="tab" role="tab" id="TabWork">Work</a>
                </li>
            </ul>

            <%--========Start Tab===========--%>
            <div class="panel-body">
                <div class="tab-content">
                    <%--------------------Tab Dashboard-------------------------%>
                    <div class="tab-pane active" role="tabpanel" id="Dashboard">
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-body">
                                    <%--Start Chart--%>
                                    <div class="row">
                                        <div class="form-group col-md12">
                                                <asp:Label ID="Label14" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Year"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <select class="form-control max-wide" id="stcDashboardYear">
                                                    </select>
                                                </div>
                                            </div>
                                        <div class="col-md-12">
                                            <h2 style="font-weight: bold;">Dashboard</h2>
                                            <div id="graphCost" style="width: 100%; height: 300px; max-width: 100%;"></div>
                                            <div id="legend"></div>
                                        </div>
                                    </div>
                                    <h4 style="font-weight: bold;" id="textChartdetail">รายละเอียดของกราฟ</h4>
                                    <div class="row" style="margin-top: 15px;" id="divChartdetail">
                                        <%--<div class="col-md-12">
                                            <div class="col-md-3 col-sm-3 col-xs-12  form-group LabelBoxCost">
                                                <b>กราฟ A </b>
                                            </div>
                                            <div id="BoxSummary" class="col-md-9 col-sm-9 col-xs-12 form-group TextBoxCost " style="margin: inherit;">
                                                <a href="javascript:void(0)" class="clickModalCostDetail">
                                                    <span id="SumCostA1" class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #f44336;">5</span>
                                                    <span id="SumCostA2" class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #FF9800;">13</span>
                                                    <span id="SumCostA3" class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #398439;">14</span>
                                                </a>
                                            </div>
                                        </div>--%>
                                        <%--<div class="col-md-12">
                                            <div class="col-md-3 col-sm-3 col-xs-12  form-group LabelBoxCost">
                                                <b>กราฟ B </b>
                                            </div>
                                            <div id="BoxSummary2" class="col-md-9 col-sm-9 col-xs-12 form-group TextBoxCost " style="margin: inherit;">
                                                <a href="javascript:void(0)" class="clickModalCostDetail">
                                                    <span id="SumCostB1" class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #f44336;">16</span>
                                                    <span id="SumCostB2" class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #FF9800;">19</span>
                                                    <span id="SumCostB3" class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #398439;">13</span>
                                                </a>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <%--End Chart--%>
                                </div>
                            </div>
                        </div>
                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-body">
                                    <%--Start SpicalCase--%>
                                    <div class="col-md-12">
                                        <div class="row" style="margin-bottom: 5px;">
                                            <h2>รายงานผลกรณีตรวจสอบพิเศษ</h2>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-12">
                                                <div class="col-md-6">
                                                    <div class="col-md-3 col-xs-12">
                                                        <b style="color: #f44336;">- Danger</b>
                                                    </div>
                                                    <a class="col-md-9 col-xs-12 form-group TextBoxCost textSummary modalSpicalCase clickDetailSpicalCase" data-type="Danger" href="javascript:void(0)">
                                                        <span id="textSpicalDanger"></span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-6">
                                                    <div class="col-md-3 col-xs-12">
                                                        <b style="color: #FF9800;">- Warning</b>
                                                    </div>
                                                    <a class="col-md-9 col-xs-12 form-group TextBoxCost textSummary modalSpicalCase clickDetailSpicalCase" data-type="Warning" href="javascript:void(0)">
                                                        <span id="textSpicalWarning"></span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-6">
                                                    <div class="col-md-3 col-xs-12">
                                                        <b style="color: #398439;">- Normal</b>
                                                    </div>
                                                    <a class="col-md-9 col-xs-12 form-group TextBoxCost textSummary modalSpicalCase clickDetailSpicalCase" data-type="Normal" href="javascript:void(0)">
                                                        <span id="textSpicalNormal"></span>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <%--End SpicalCase--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab Rate=====================-->
                    <%--------------------Tab ReportAssign-------------------------%>
                    <div class="tab-pane fade" role="tabpanel" id="ReportAssign">

                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row" style="margin-bottom: 5px;">
                                            <h2 style="font-weight: bold;">Report Assign</h2>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label1" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Year"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <select class="form-control max-wide" id="stcYear">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label2" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Site Ref"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <select class="form-control max-wide" id="SiteRef">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label18" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="IT Tag Group"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="txtITTagGroup" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                                        <div class="input-group-btn">
                                                            <button id="buttonSearch_TagGroup" class="btn btn-default" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="IT Tag"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="txtITTag" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                                        <div class="input-group-btn">
                                                            <button id="buttonSearchItTag" class="btn btn-default" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รหัสพนักงาน"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="txtEmpnum" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                                        <div class="input-group-btn">
                                                            <button id="buttonSearchEmp" class="btn btn-default" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--End Search--%>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-md-8 col-xs-12">
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="button" id="btnClearReport" class="btn btn-warning btn-block" style="float: right;">Clear</button>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="button" id="btnSearchReport" class="btn btn-info btn-block" style="float: right;">Search</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <table class="table table-hover table-bordered center" style="width: 100%" id="tableReportingAssign">
                                                <thead>
                                                    <tr>
                                                        <th>Site Ref</th>
                                                        <th>IT Tag</th>
                                                        <th>Emp Num</th>
                                                        <th>Name</th>
                                                        <th>Assign Date</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab ReportAssign=====================-->
                    <%--------------------Tab Export-------------------------%>
                    <div class="tab-pane fade" role="tabpanel" id="Export">

                        <div class="panel-group">
                            <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row" style="margin-bottom: 5px;">
                                            <h2 style="font-weight: bold;">Report Assign</h2>
                                        </div>
                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                                <asp:Label class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Year"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <select class="form-control max-wide" id="stcExportYear">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <%--///---- Body1--%>
                                            <div class="col-md-6 col-xs-12" style="margin-bottom:2rem">
                                                <h4 style="font-weight: bold;">Checklist</h4>
                                                    <asp:Label class="col-md-6 col-xs-12 " runat="server" Font-Bold="True" Text="IT Tag Group"></asp:Label>
                                                    <div class="col-md-6 col-xs-12" style="margin-bottom: 2rem">
                                                        <div class="input-group">
                                                            <input type="text" id="txtExportITTagGroup" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                                            <div class="input-group-btn">
                                                                <button id="buttonSearchExport_TagGroup" class="btn btn-default" type="button">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Button runat="server" Class="btn btn-warning  btn-block btn-lg max-wide" Text="Export Checklist" ID="exportTableC" OnClick="exportTableC_onClick" disabled/>
                                            </div>

                                            <%--///---- Body2--%>
                                            <div class="col-md-6">
                                                <h4 style="font-weight: bold; margin-bottom: 6.5rem;">SpicalCase</h4>
                                                <asp:Button runat="server" Class="btn btn-warning btn-block btn-lg max-wide" Text="Export Spcical case" ID="exportTableS" OnClick="exportTableS_onClick" disabled/>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab Export=====================-->
                    <%--------------------Tab Work-------------------------%>
                    <div class="tab-pane fade" role="tabpanel" id="Work">
                        <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em;">
                                <div class="panel-body">
                                    <%--Start Chart--%>
                                    <div class="row">
                                        <div class="form-group col-md-6 col-xs-12">
                                            <asp:Label ID="Label4" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Year"></asp:Label>
                                            <div class="col-md-9 col-xs-12">
                                                <select class="form-control max-wide" id="stcDashboardYear_Work">
                                                </select>
                                            </div>
                                        </div>
                                         <div class="form-group col-md-6 col-xs-12">
                                                <asp:Label class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="IT Tag Group"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                      <div class="input-group">
                                                        <input type="text" id="txtITTagGroup_Work" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                                        <div class="input-group-btn">
                                                            <button id="buttonSearch_TagGroup_Work" class="btn btn-default" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="col-md-12">
                                            <h2 style="font-weight: bold;">Workload</h2>
                                            <h3 style="font-weight: bold;">Total : <span id="Worktotal"></span></h3>
                                            <div id="graphCost_Work" style="width: 100%; height: 300px; max-width: 100%;">
                                            <span style="font-size: 20px; font-weight: bold; margin-left: 35px;">กรุณาเเลือกข้อมูล</span>
                                            </div>
                                            <div id="legend_Work" style="text-align:center"></div>
                                        </div>
                                        <div class="col-md-12">
                                        <h4 style="font-weight: bold;" id="textWorkdetail">รายละเอียดของกราฟ</h4>
                                        <div class="row" style="margin-top: 15px;" id="divWorkdetail">
                                            <span style="font-size: 20px; font-weight: bold; margin-left: 35px;">กรุณาเเลือกข้อมูล</span>
                                        </div>
                                        </div>
                                    </div>
                                    <%--End Chart--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--================End Tab Work=====================-->
                </div>
            </div>
        </div>
    </div>


    <%--========End Tab=============--%>
    <div class="modal fade" id="ModalSearch" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 20em; max-width: 100%; text-align: center;">
                    <table id="TableListCustomer" class="table table-bordered table-responsive">
                        <thead id="Thead2" runat="server">
                            <tr>
                                <th>Group ID</th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearch'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modal Search Group--%>

    <div class="modal fade" id="ModalSearchITTag" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search IT Tag</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="input-group">
                            <input type="text" id="textSearchItTag" class="form-control" style="min-width: 100%" />
                            <div class="input-group-btn">
                                <button id="" class="btn btn-default" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>IT Tag</th>
                                <th>Site</th>
                                <th>Emp Num</th>
                                <th>Name</th>
                            </tr>
                        </thead>
                        <tbody id="TBodySearchITTag">

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <%--End ModalSearchITTag--%>

    <div class="modal fade" id="ModalSearchEmp" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search Group</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div id="search_box_Emp">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table class="table table-bordered table-responsive">
                        <thead runat="server">
                            <tr>
                                <th>Emp Num</th>
                                <th>Name </th>
                            </tr>
                        </thead>
                        <tbody id='TBodySearchEmp'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <%--End ModalSearchEmp--%>

    <div class="modal fade" id="ModalSpicalCase" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">SpicalCase : <span id="TitleSpicalCase"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <table class="table table-hover table-bordered center" style="width: 100%" id="TBSpicalCase">
                        <thead>
                            <tr>
                                <th>IT TAG</th>
                                <%--<th>Site</th>--%>
                                <th>Remark</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--End ModalSpicalCase--%>

    <div class="modal fade"  id="ModalDashboardDetail" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-lg" style="width: 90%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">IT Tag Group : <span id="TitleDashboardDetail"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <%--========Start Tab Menu===========--%>
                    <div class="panel nav-tab panel-default" style="margin-top: 2em;">
                        <div class="panel-heading">
                            <ul class="nav nav-tabs">
                                <li class="nav-item active">
                                    <a href="#TABALL" class="nav-link" role="tab" data-toggle="tab">ALL</a>
                                </li>
                                <li class="nav-item ">
                                    <a href="#TABInprocess" class="nav-link" data-toggle="tab" role="tab">Complete</a>
                                </li>
                                <li class="nav-item ">
                                    <a href="#TABComplete" class="nav-link" data-toggle="tab" role="tab">Inprogress</a>
                                </li>
                            </ul>

                            <%--========Start Tab===========--%>
                                <div class="tab-content">
                                    <%--------------------Tab TABALL-------------------------%>
                                    <div class="tab-pane active" role="tabpanel" id="TABALL">
                                        <div class="panel-group">
                                            <div class="panel panel-default" style="margin-top: 1em;overflow-y: auto; border-color:#fff;">
                                                <div class="panel-body">
                                                    <%--Start Chart--%>
                                                    <div class="row">
                                                        <table class="table table-hover table-bordered center" style="width: 100%;max-height:80%" id="TBDashBoardDetailALL">
                                                            <thead>
                                                                <tr>
                                                                    <th>IT TAG</th>
                                                                    <th>EmpNum</th>
                                                                    <th>Name</th>
                                                                    <th>Status</th>
                                                                    <th>site_ref</th>
                                                                    <th>Assign_By</th>
                                                                    <th>Assign_Date</th>
                                                                    <th>Checker Name</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--================End Tab TABALL=====================-->
                                    </div>
                                    <%--------------------Tab TABALL-------------------------%>
                                    <div class="tab-pane fade" role="tabpanel" id="TABInprocess">
                                        <div class="panel-group">
                                            <div class="panel panel-default" style="margin-top: 1em;overflow-y: auto; border-color:#fff;">
                                                <div class="panel-body">
                                                    <%--Start Chart--%>
                                                    <div class="row">
                                                        <table class="table table-hover table-bordered center" style="width: 100%;max-height:80%" id="TBDashBoardDetailComplete">
                                                            <thead>
                                                                <tr>
                                                                    <th>IT TAG</th>
                                                                    <th>EmpNum</th>
                                                                    <th>Name</th>
                                                                    <th>Status</th>
                                                                    <th>site_ref</th>
                                                                    <th>Assign_By</th>
                                                                    <th>Assign_Date</th>
                                                                    <th>Cheker Name</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <!--================End Tab TABALL=====================-->
                                    </div>
                                    <%--------------------Tab TABALL-------------------------%>
                                    <div class="tab-pane fade" role="tabpanel" id="TABComplete">
                                        <div class="panel-group">
                                            <div class="panel panel-default" style="margin-top: 1em;overflow-y: auto; border-color:#fff;">
                                                <div class="panel-body">
                                                    <%--Start Chart--%>
                                                    <div class="row">
                                                        <table class="table table-hover table-bordered center" style="width: 100%;max-height:80%" id="TBDashBoardDetailInprocess">
                                                            <thead>
                                                                <tr>
                                                                    <th>IT TAG</th>
                                                                    <th>EmpNum</th>
                                                                    <th>Name</th>
                                                                    <th>Status</th>
                                                                    <th>site_ref</th>
                                                                    <th>Assign_By</th>
                                                                    <th>Assign_Date</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <!--================End Tab TABALL=====================-->
                                    </div>
                                </div>
                                </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
    <%--End ModalSpicalCase--%>
    <div class="modal fade"  id="ModalDashboardDetail_Work" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-lg" style="width: 90%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">WorkLoad Detail : <span id="TitleDashboardDetail_Work"></span></h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="panel-group">
                        <div class="panel panel-default" style="margin-top: 1em; overflow-y: auto; border-color: #fff;">
                            <div class="panel-body">
                                <%--Start Chart--%>
                                <div class="row">
                                    <table class="table table-hover table-bordered center" style="width: 100%; max-height: 80%" id="TBDashBoardDetailALL_Work">
                                        <thead>
                                            <tr>
                                               <%-- [Position],[Cost_Center],[Level],[Emp_Num],[Assign_ID],[Username],[Fullname],[CheckDate]
                                                ,[Status_On_Click],[IT_TAG],[IT_TAG_GROUP],[EmpNum_Assign],[Status_Assign],[Assign_Date],[site_ref],[Reject_Remark]--%>
                                                <th>IT TAG</th>
                                                <th>Group</th>
                                                <th>Site</th>
                                                <th>สถานะปัจุบัน</th>
                                                <%--<th>Assign_ID</th>--%>
                                                <th>รหัสพนักงาน</th>
                                                <th>ชือ</th>
                                                <th>วันที่ปฎิบัติ</th>
                                                <th>สถานะที่ปฎิบัติ</th>
                                                <th>ผู้มอบหมาย</th>
                                                <th>วันที่มอบหมาย</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
            </div>
        </div>
    <%--End ModalSpicalCase--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#navBar").css("display", "block");
            var username = sessionStorage.getItem('username');
           
            GetYear()
            GetExportYear()
            GetDashboardYear()
            GetDashboardYear_Work()

            //Set Data Table
            var TBSpicalCase = $("#TBSpicalCase").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            //TBSpicalCase;
            var TBDashBoardDetailALL = $("#TBDashBoardDetailALL").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            //TBDashBoardDetailALL;
            var TBDashBoardDetailALL_Work = $("#TBDashBoardDetailALL_Work").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            //TBDashBoardDetailALL_Work;
            var TBDashBoardDetailInprocess = $("#TBDashBoardDetailInprocess").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            //TBDashBoardDetailInprocess;
            var TBDashBoardDetailComplete = $("#TBDashBoardDetailComplete").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            //TBDashBoardDetailComplete;
            var tableReportingAssign = $("#tableReportingAssign").DataTable({
                searching: true,
                responsive: true,
                "searching": false,
                "order": []
            });

            //Get GetDashboard
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetDashboard")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                data: JSON.stringify({ year: $("#stcDashboardYear").val() }),
                success: GetDashboard
            })
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetDashboard_SpecialCase")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                data: JSON.stringify({ year: $("#stcDashboardYear").val() }),
                success: GetDashboard_SpecialCase
            })
            
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                var target = $(e.target).attr("href"); // activated tab
                if (target == "#Dashboard") {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%=ResolveUrl("default.aspx/GetDashboard")%>",
                        contentType: "application/json; charset = utf-8",
                        dataType: "json",
                        data: JSON.stringify({ year: $("#stcDashboardYear").val() }),
                        success: GetDashboard
                    })
                }
                else if (target == "#Work") {
                    if ( $("stcDashboardYear_Work").val() != "" && $("#txtITTagGroup_Work").val() != ""){
                        GetDashboard_Work();
                        }
                }
                //alert(target);
            });

            $(document).on("change", "#stcDashboardYear", function () {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("default.aspx/GetDashboard")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({ year: $("#stcDashboardYear").val() }),
                    success: GetDashboard
                })
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("default.aspx/GetDashboard_SpecialCase")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({ year: $("#stcDashboardYear").val() }),
                    success: GetDashboard_SpecialCase
                })
            });

            $(document).on("change", "#stcExportYear, #txtExportITTagGroup", function () {
                $("#MainContent_snsstcExportYear").val($("#stcExportYear").val());
                check_Export_Checklist();
                check_Export_Special();
            });

            $(document).on("change", "#stcDashboardYear_Work", function () {
                if ( $("#txtITTagGroup_Work").val() != "" ) {
                    GetDashboard_Work()
                    console.log('change Year')
                }
            });
            //Get Search Report
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetSite_ref")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSiteRef
            })
            
            
            //Get SpeicalCase Report
            $(document).on("click", ".modalSpicalCase", function () {
                var modaltype = $(this).attr("data-type");
                GetReportAssign_Special(modaltype);
                if (modaltype == 'Danger') {
                    $("#TitleSpicalCase").css("color", "#f44336")
                }
                else if (modaltype == 'Warning') {
                    $("#TitleSpicalCase").css("color", "#FF9800")
                }
                else if (modaltype == 'Normal') {
                    $("#TitleSpicalCase").css("color", "#398439")
                }
                $("#TitleSpicalCase").text(modaltype);
                $("#ModalSpicalCase").modal("show");
            });
            $("#btnSearchReport").on('click', function () {
                LoadtableReportingAssign();
            });
            $(document).on("click", "#btnClearReport", function () {
                $("#SiteRef").val($("#SiteRef option:first").val());
                $("#stcYear").val($("#stcStatus option:first").val());
                $("#txtITTagGroup").val('');
                $("#txtITTag").val('');
                $("#txtEmpnum").val('');
                LoadtableReportingAssign();
            });
           
            //function Search Report
            $("#buttonSearchItTag").on('click', function () {
                var search = "";
                GETIT_TAG(search);
            });
            $("#buttonSearchEmp").on('click', function () {
                var search = "";
                var button = '<input type="text" id="EmployeeSearch" placeholder="Search.." class="form-control max-wide" autocomplete="off">';
                $("#search_box_Emp").empty();
                $("#search_box_Emp").append(button);
                $("#ModalSearchEmp").modal("show");
                GetHR_Employee(search);
            });
            $("#buttonSearch_TagGroup").on('click', function () {
                var search = '';
                var button = '<input type="text" id="txtSearchItTagGroup" placeholder="Search Group.." class="form-control max-wide" autocomplete="off">'
                $("#search_box").empty();
                $("#search_box").append(button);
                $("#ModalSearch").modal("show");
                GetIT_TAG_Group(search);
            });
            $("#buttonSearchExport_TagGroup").on('click', function () {
                var search = '';
                var button = '<input type="text" id="txtSearchExportItTagGroup" placeholder="Search Group.." class="form-control max-wide" autocomplete="off">'
                $("#search_box").empty();
                $("#search_box").append(button);
                $("#ModalSearch").modal("show");
                GetIT_TAG_Group_forexport(search);
            });
            $("#buttonSearch_TagGroup_Work").on('click', function () {
                var search = '';
                var button = '<input type="text" id="txtSearchItTagGroup_work" placeholder="Search Group.." class="form-control max-wide" autocomplete="off">'
                $("#search_box").empty();
                $("#search_box").append(button);
                $("#ModalSearch").modal("show");
                GetIT_TAG_Group_Work(search);
            });
            $("#textSearchItTag").on("keyup", function () {
                var search = $("#textSearchItTag").val();
                GETIT_TAG(search);
            });
            $(document).on("keyup", "#EmployeeSearch", function () {
                var search = $("#EmployeeSearch").val();
                GetHR_Employee(search);
            });
            $(document).on("keyup", "#txtSearchItTag", function () {
                var search = $("#txtSearchItTag").val();
                GetIT_TAG_Group(search)
            });
            $(document).on("keyup", "#txtSearchItTagGroup", function () {
                var search = $("#txtSearchItTagGroup").val();
                GetIT_TAG_Group(search)
            });
            $(document).on("keyup", "#txtSearchExportItTagGroup", function () {
                var search = $("#txtSearchExportItTagGroup").val();
                GetIT_TAG_Group_forexport(search)
            });
            $(document).on("keyup", "#txtSearchItTagGroup_work", function () {
                var search = $("#txtSearchItTagGroup_work").val();
                GetIT_TAG_Group_Work(search)
            });
            $(document).on("click", ".selectITTag", function () {
                var IT_TAG = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtITTag").val(IT_TAG);
                $("#ModalSearchITTag").modal("hide");
            });
            $(document).on("click", ".selectEmp", function () {
                var Emp_Num = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtEmpnum").val(Emp_Num);
                $("#ModalSearchEmp").modal("hide");
            });
            $(document).on("click", ".selectGroup", function () {
                var IT_Tag_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtITTagGroup").val(IT_Tag_Group);
                $("#ModalSearch").modal("hide");
            });
            $(document).on("click", ".selectExportGroup", function () {
                var IT_Tag_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtExportITTagGroup").val(IT_Tag_Group);
                $("#MainContent_snstxtExportITTagGroup").val(IT_Tag_Group);
                check_Export_Checklist();
                $("#ModalSearch").modal("hide");
            });
            $(document).on("click", ".selectGroup_Work", function () {
                var IT_Tag_Group = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#txtITTagGroup_Work").val(IT_Tag_Group);
                GetDashboard_Work();
                $("#ModalSearch").modal("hide");
            });
            //Get Data
            LoadtableReportingAssign();

            
            //Show Dashboard_Work Detail
            $(document).on("click", ".clickModalDashboardDetail_Work", function () {
                var Empnum = $(this).attr("data-empnum");
                var fullname = $(this).attr("data-fullname");
                var IT_TAG_GROUP = $("#txtITTagGroup_Work").val();
                $("#TitleDashboardDetail_Work").text(fullname);
                TBDashBoardDetailALL_Work.clear().draw();
                 $.ajax({
                     type: "post",
                     async: false,
                     url: "<%= ResolveUrl("Default.aspx/VW_PMOnline_Monitoring_Checker_Deteil") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Empnum: Empnum, IT_TAG_GROUP: IT_TAG_GROUP }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Position], [Cost_Center], [Level], [Emp_Num], [Assign_ID], [Username], [Fullname], [CheckDate],
                                //[Status_On_Click], [IT_TAG], [IT_TAG_GROUP], [EmpNum_Assign], [Status_Assign], [Assign_Date], [site_ref], [Reject_Remark]
                                var Position = val[0];
                                var Cost_Center = val[1];
                                var Level = val[2];
                                var Emp_Num = val[3];
                                var Assign_ID = val[4];
                                var Username = val[5];
                                var Fullname = val[6];
                                var CheckDate = val[7];
                                var Status_On_Click = val[8];
                                var IT_TAG = val[9];
                                var IT_TAG_GROUP = val[10];
                                var EmpNum_Assign = val[11];
                                var Status_Assign = val[12];
                                var Assign_Date = val[13];
                                var site_ref = val[14];
                                var Reject_Remark = val[15];
                                TBDashBoardDetailALL_Work.row.add([
                                    IT_TAG,
                                    IT_TAG_GROUP,
                                    site_ref,
                                    Status_Assign,
                                    Username,
                                    Fullname,
                                    CheckDate,
                                    Status_On_Click,
                                    EmpNum_Assign,
                                    Assign_Date,

                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + IT_TAG + '</a></td>',
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + Remark + '</a></td>',
                                ]).draw(false);

                            });

                            //console.log(response.d);
                        }
                        
                            $("#ModalDashboardDetail_Work").modal("show");
                    }
                });
            });

            //Show Dashboard Detail
            $(document).on("click", ".clickModalDashboardDetail", function () {
                var IT_TAG_GROUP = $(this).attr("data-it_tag_group");
                console.log(IT_TAG_GROUP);
                $("#TitleDashboardDetail").text(IT_TAG_GROUP);
                
                TBDashBoardDetailALL.clear().draw();
                TBDashBoardDetailComplete.clear().draw();
                TBDashBoardDetailInprocess.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetDashboardDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTagGroup: IT_TAG_GROUP ,year : $("#stcDashboardYear").val(),status:'' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[IT_TAG],[IT_TAG_GROUP],[EmpNum],[Name],[Status],[site_ref],[Reject_Remark],[Assign_EmpNum],[Assign_Name],[Assign_Date] 
                                var ID = val[0];
                                var IT_TAG = val[1];
                                var IT_TAG_GROUP = val[2];
                                var EmpNum = val[3];
                                var Name = val[4];
                                var Status = val[5];
                                var site_ref = val[6];
                                var Reject_Remark = val[7];
                                var Assign_Num = val[8];
                                var Assign_Name = val[9];
                                var Assign_Date = val[10];
                                var CheckerName = val[11] != "" ? val[11] : 'ยังไม่มีผู้ตรวจ';
                                TBDashBoardDetailALL.row.add([
                                    IT_TAG,
                                    EmpNum,
                                    Name,
                                    StatusColor(Status),
                                    site_ref,
                                    Assign_Name,
                                    Assign_Date,
                                    CheckerName,
                                 
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + IT_TAG + '</a></td>',
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + Remark + '</a></td>',
                                ]).draw(false);
                            });
                        }
                    }
                });
                //Call TB ALL
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetDashboardDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTagGroup: IT_TAG_GROUP ,year : $("#stcDashboardYear").val(),status:'Complete' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[IT_TAG],[IT_TAG_GROUP],[EmpNum],[Name],[Status],[site_ref],[Reject_Remark],[Assign_EmpNum],[Assign_Name],[Assign_Date] 
                                var ID = val[0];
                                var IT_TAG = val[1];
                                var IT_TAG_GROUP = val[2];
                                var EmpNum = val[3];
                                var Name = val[4];
                                var Status = val[5];
                                var site_ref = val[6];
                                var Reject_Remark = val[7];
                                var Assign_Num = val[8];
                                var Assign_Name = val[9];
                                var Assign_Date = val[10];
                                var CheckerName = val[11] != "" ? val[11] : 'ยังไม่มีผู้ตรวจ';
                                TBDashBoardDetailComplete.row.add([
                                    IT_TAG,
                                    EmpNum,
                                    Name,
                                    StatusColor(Status),
                                    site_ref,
                                    Assign_Name,
                                    Assign_Date,
                                 CheckerName,
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + IT_TAG + '</a></td>',
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + Remark + '</a></td>',
                                ]).draw(false);
                            });
                        }
                    }
                });
                //Call TB Complete
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetDashboardDetail") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ITTagGroup: IT_TAG_GROUP ,year : $("#stcDashboardYear").val(),status:'Inprocess' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[IT_TAG],[IT_TAG_GROUP],[EmpNum],[Name],[Status],[site_ref],[Reject_Remark],[Assign_EmpNum],[Assign_Name],[Assign_Date] 
                                var ID = val[0];
                                var IT_TAG = val[1];
                                var IT_TAG_GROUP = val[2];
                                var EmpNum = val[3];
                                var Name = val[4];
                                var Status = val[5];
                                var site_ref = val[6];
                                var Reject_Remark = val[7];
                                var Assign_Num = val[8];
                                var Assign_Name = val[9];
                                var Assign_Date = val[10];
                                var CheckerName = val[11] != "" ? val[11] : 'ยังไม่มีผู้ตรวจ';
                                TBDashBoardDetailInprocess.row.add([
                                    IT_TAG,
                                    EmpNum,
                                    Name,
                                    StatusColor(Status),
                                    site_ref,
                                    Assign_Name,
                                    Assign_Date,
                                 
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + IT_TAG + '</a></td>',
                                    //'<td><a href="./PMOnline/PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + Remark + '</a></td>',
                                ]).draw(false);
                            });
                        }
                    }
                });
                //Call TB nonComplete

                $("#ModalDashboardDetail").modal("show");
            });


            function GetReportAssign_Special(type) {
                //$("#IMGUpload").modal("show");
                TBSpicalCase.clear().draw();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/GetReportAssign_Special") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ type: type, year: $("#stcDashboardYear").val() }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[IT_TAG],[site_ref],[Type],[Remark] 
                                var ID = val[0];
                                var IT_TAG = val[1];
                                var site_ref = val[2];
                                var Type = val[3];
                                var Remark = val[4];
                                TBSpicalCase.row.add([
                                    //IT_TAG,
                                    //site_ref,
                                    //Remark,
                                    //'<td><a href="./ListReport.aspx?ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + Remark + '</a></td>',
                                    //'<td><a href="./ListReport.aspx?ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + IT_TAG + '</a></td>',
                                    '<td><a href="./PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + IT_TAG + '</a></td>',
                                    '<td><a href="./PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" target="_blank" >' + Remark + '</a></td>',
                                ]).draw(false);
                            });
                        }
                    }
                });
                $("#IMGUpload").modal("hide");
            }
            function LoadtableReportingAssign() {
                //$("#IMGUpload").modal("show");
                tableReportingAssign.clear().draw();
                var stcYear = $("#stcYear").val();
                var SiteRef = $("#SiteRef").val();
                var IT_TAG_Group = $("#txtITTagGroup").val();
                var IT_TAG = $("#txtITTag").val();
                var EmpNum = $("#txtEmpnum").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/IT_TAG_Assign_ListReport") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ stcYear: stcYear, SiteRef: SiteRef, IT_TAG_Group: IT_TAG_Group, IT_TAG: IT_TAG, EmpNum: EmpNum }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //SELECT DISTINCT [ID],[IT_TAG],[Status],[site_ref],[EmpNum],[IT_TAG_GROUP],[Assign_Date]
                                var ID = val[0];
                                var IT_TAG = val[1];
                                var Status = val[2];
                                var site_ref = val[3];
                                var EmpNum = val[4];
                                var IT_TAG_GROUP = val[5];
                                var Assign_Date = val[6];
                                var Fullname = val[7];
                                var button = ''
                                tableReportingAssign.row.add([
                                    site_ref,
                                    IT_TAG,
                                    EmpNum,
                                    Fullname,
                                    Assign_Date,
                                    '<td class="center" ><a href="./ListReport.aspx?ID='+ID+'&ITTAG_ID='+IT_TAG+'"  class="btn btn-info btn-block" target="_blank" >Report</a></td> ',
                                ]).draw(false);
                            });
                        }
                        $("#IMGUpload").modal("hide");
                        //$("#divDataTable").css("display", "")
                    }
                });
            }

            function GetDashboard_Work() {
                $("#legend_Work").empty();
                $("#graphCost_Work").empty();
                $("#divWorkdetail").empty();
                var fragment = "";
                var dataMorris = [];
                var year = $("#stcDashboardYear_Work").val();
                var IT_TAG_GROUP = $("#txtITTagGroup_Work").val();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Monitoring_Checker") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ year: year, IT_TAG_GROUP: IT_TAG_GROUP }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                console.log(index)
                                    var Empnum = val[0];
                                    var label = val[1];
                                    var value = val[2];
                                if (index == 0) {
                                    $("#Worktotal").text(value);
                                }else if (index == 1) {
                                    //Set Chart ONLY ยอดคงเหลือ
                                    dataMorris.push({
                                        "value": value,
                                        "label": label
                                    });
                                    //Set WorkDetail ONLY ยอดคงเหลือ
                                    fragment += '<div class="col-md-12">';
                                    fragment += '<div class="col-md-3 col-sm-3 col-xs-12  form-group LabelBoxCost">';
                                    fragment += '<b> ยอดงานคงเหลือ </b>';
                                    fragment += '</div>';
                                    fragment += '<div class="col-md-9 col-sm-9 col-xs-12 form-group TextBoxCost " style="margin: inherit;">';
                                    fragment += '<div class="clickModalDashboardDetail_Work">';
                                    fragment += '<span class="col-md-12  col-xs-12 textSummary" style="color: ##5bc0de;">' + value + '</span>';
                                    fragment += '</div>';
                                    fragment += '</div>';
                                    fragment += '</div>';
                                }else {
                                    //Set Chart ALL checker
                                    dataMorris.push({
                                        "value": value,
                                        "label": label
                                    });
                                    //Set WorkDetail ALL checker
                                    fragment += '<div class="col-md-12">';
                                    fragment += '<div class="col-md-3 col-sm-3 col-xs-12  form-group LabelBoxCost">';
                                    fragment += '<b>' + label + ' </b>';
                                    fragment += '</div>';
                                    fragment += '<div id="BoxSummary_work" class="col-md-9 col-sm-9 col-xs-12 form-group TextBoxCost " style="margin: inherit;">';
                                    //if (value == '0') {
                                    //    fragment += '<div class="clickModalDashboardDetail_Work">';
                                    //    fragment += '<span class="col-md-12  col-xs-12 textSummary" style="color: ##5bc0de;">' + value + '</span>';
                                    //    fragment += '</div>';
                                    //}
                                    //else {
                                        fragment += '<a href="javascript:void(0)" class="clickModalDashboardDetail_Work" data-Empnum="' + Empnum + '" data-fullname="'+label+'">';
                                        fragment += '<span class="col-md-12  col-xs-12 textSummary" style="color: ##5bc0de;">' + value + '</span>';
                                        fragment += '</a>';
                                    //}
                                   
                                    fragment += '</div>';
                                    fragment += '</div>';
                                }

                            });
                            
                            $("#divWorkdetail").append(fragment);
                        }
                        //Sort object
                        //dataMorris.sort(function (a, b) {
                        //    return a.label - b.label;
                        //})
                        graphMorris_work(dataMorris, "graphCost_Work", "legend_Work");
                    }
                });
            }
            function GetDashboard(response) {
                $("#legend").empty();
                $("#graphCost").empty();
                $("#divChartdetail").empty();
                var fragment = "";
                var dataMorris = [];
                //var dataMorris = [
                //    { y: 'กราฟ A', a: 5, b: 13, c: 14 },
                //    { y: 'กราฟ B', a: 16, b: 19, c: 13 }
                //];
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        //SELECT [IT_TAG_GROUP],[CountAll],[CountComplete],[CountNonComplete]
                        //Create Chart
                        var IT_TAG_GROUP = val[0];
                        var CountAll = val[1];
                        var CountComplete = val[2] == ""? 0 : val[2] ;
                        var CountNonComplete = val[3];
                        var myObj = { y: IT_TAG_GROUP, a: CountAll, b: CountComplete, c: CountNonComplete };
                        dataMorris.push(myObj);

                        //Create รายละเอียดของกราฟ
                        fragment += '<div class="col-md-12">';
                        fragment += '<div class="col-md-3 col-sm-3 col-xs-12  form-group LabelBoxCost">';
                        fragment += '<b>IT Tag Group :' + IT_TAG_GROUP + ' </b>';
                        fragment += '</div>';
                        fragment += '<div id="BoxSummary" class="col-md-9 col-sm-9 col-xs-12 form-group TextBoxCost " style="margin: inherit;">';
                        fragment += '<a href="javascript:void(0)" class="clickModalDashboardDetail" data-IT_TAG_GROUP="' + IT_TAG_GROUP + '">';
                        fragment += '<span class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: ##5bc0de;">' + CountAll + '</span>';
                        fragment += '<span class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #398439;">' + CountComplete + '</span>';
                        fragment += '<span class="col-lg-4 col-md-6 col-sm-4 col-xs-12 textSummary" style="color: #f44336;">' + CountNonComplete + '</span>';
                        fragment += '</a>';
                        fragment += '</div>';
                        fragment += '</div>';
                    });
                    $("#divChartdetail").append(fragment);
                }
                if (dataMorris != '') {
                    graphMorris(dataMorris, "graphCost", "legend");
                    $("#divChartdetail").css('display','block');
                    $("#textChartdetail").css('display', 'block');
                }
                else {
                    $("#graphCost").append(' <span style="font-size: 20px;font-weight: bold;margin-left:35px;">ไม่มีข้อมูลปีดังกล่าว</span> ');
                    $("#divChartdetail").css('display','none');
                    $("#textChartdetail").css('display','none');

                }
            }
            function GetDashboard_SpecialCase(response) {
                var fragment = "";
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var Type = val[0];
                        var Count = val[1];
                        if (Type == 'Normal') {
                            console.log(Type);
                            $("#textSpicalNormal").text(Count);
                        } else if (Type == 'Warning') {
                            console.log(Type);
                            $("#textSpicalWarning").text(Count);
                        } else if (Type == 'Danger') {
                            console.log(Type);
                            $("#textSpicalDanger").text(Count);
                        }
                    });
                    
                    $(".clickDetailSpicalCase").addClass('modalSpicalCase');
                }
                else {

                    $(".clickDetailSpicalCase").removeClass('modalSpicalCase');
                    $("#textSpicalNormal").text('ไม่มีข้อมูลปีดังกล่าว');
                    $("#textSpicalWarning").text('ไม่มีข้อมูลปีดังกล่าว');
                    $("#textSpicalDanger").text('ไม่มีข้อมูลปีดังกล่าว');
                }
            }

       
            //End Jquery
        });

        function check_Export_Checklist() {
            var Year = $("#stcExportYear").val();
            var Group = $("#txtExportITTagGroup").val();
            if (Year != '' & Group != '') {
                $("#MainContent_exportTableC").prop("disabled", false);
            }
        }
        function check_Export_Special() {
            var Year = $("#stcExportYear").val();
            if (Year != '') {
                $("#MainContent_exportTableS").prop("disabled", false);
            }
        }

        function GetSiteRef(response) {
            var siteRef = '';
            siteRef += '<option value="">====== Select a company ======</option>';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var company = val[1];
                    siteRef += '<option value="' + ID.trim() + '">' + company + '</option>';
                });
            }
            $("#SiteRef").append(siteRef);
        }
        

        function GetHR_Employee(search) {
            $("#TBodySearchEmp").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/HR_Employee") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var Emp_Num = val[0];
                            var Language = val[1];
                            var Emp_Prefix = val[2];
                            var Emp_FirstName = val[3];
                            var Emp_LastName = val[4];
                            var Emp_Level = val[5];
                            var name = Emp_Prefix + " " + Emp_FirstName + " " + Emp_LastName;
                            console.log(name);
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectEmp">' + Emp_Num + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectEmp">' + name + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearchEmp").append(fragment);
                }
            });
        }

        function GETIT_TAG(search) {
            console.log(search);
            $("#TBodySearchITTag").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GETIT_TAG") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var IT_TAG_CODE = val[0];
                            var site_ref = val[1];
                            var EmpNum = val[2];
                            var Fullname = val[3];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + IT_TAG_CODE + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + site_ref + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + EmpNum + '</a></td>';
                            fragment += '<td><a href="javascript:void(0)" class="selectITTag">' + Fullname + '</a></td>';
                            fragment += '</tr>';
                        });
                    }
                    $("#TBodySearchITTag").append(fragment);
                }
            });
            $("#ModalSearchITTag").modal("show");
        }


        function GetIT_TAG_Group(search) {
            $("#TBodySearch").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Group") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var IT_TAG_GROUP = val[0];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup">' + IT_TAG_GROUP + '</a></td>';
                            fragment += '</tr>';
                            //console.log(IT_TAG_GROUP);
                        });
                    }
                    $("#TBodySearch").append(fragment);
                }
            });
            $("#ModalSearch").modal("show");
        }
        function GetIT_TAG_Group_forexport(search) {
            $("#TBodySearch").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Group") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var IT_TAG_GROUP = val[0];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectExportGroup">' + IT_TAG_GROUP + '</a></td>';
                            fragment += '</tr>';
                            //console.log(IT_TAG_GROUP);
                        });
                    }
                    $("#TBodySearch").append(fragment);
                }
            });
            $("#ModalSearch").modal("show");
        }
        function GetIT_TAG_Group_Work(search) {
            $("#TBodySearch").empty();
            var fragment = "";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetIT_TAG_Group") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: search }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var IT_TAG_GROUP = val[0];
                            fragment += '<tr>';
                            fragment += '<td><a href="javascript:void(0)" class="selectGroup_Work">' + IT_TAG_GROUP + '</a></td>';
                            fragment += '</tr>';
                            //console.log(IT_TAG_GROUP);
                        });
                    }
                    $("#TBodySearch").append(fragment);
                }
            });
            $("#ModalSearch").modal("show");
        }
        function GetYear() {
            $('#stcYear').append('<option value="">====== Select a Year ======</option>');
            for (i = new Date().getFullYear(); i > 2018; i--) {
                $('#stcYear').append($('<option />').val(i).html(i));
            }
        }
        function GetExportYear() {
            $('#stcExportYear').append('<option value="">====== Select a Year ======</option>');
            for (i = new Date().getFullYear(); i > 2018; i--) {
                $('#stcExportYear').append($('<option />').val(i).html(i));
            }
        }
        function GetDashboardYear() {
            for (i = new Date().getFullYear(); i > 2018; i--) {
                $('#stcDashboardYear').append($('<option />').val(i).html(i));
            }
        } function GetDashboardYear_Work() {
            for (i = new Date().getFullYear(); i > 2018; i--) {
                $('#stcDashboardYear_Work').append($('<option />').val(i).html(i));
            }
        }

        function graphMorris(dataMorris, element, legend) {
            var browsersChart = new Morris.Bar({
                element: element,
                data: dataMorris,
                xkey: ['y'],
                ykeys: ['a', 'b', 'c'],
                labels: ['ALL','Complete', 'Inprogress'], // ที่โชว์ออกมา
                barColors: ['#5bc0de', '#398439', '#f44336'], // ที่โชว์ออกมา
                gridTextSize: 12,
                gridTextColor: '#000',
                hideHover: 'auto',
                resize: true,
                xLabelMargin: 10,
                xLabelAngle: 60
            }).on('click', function (i, row) {
                //alert(row.y + " : " + row.a + " : " + row.b + " : " + row.c);
                });
            
            browsersChart.options.labels.forEach(function (label, i) {
                var legendItem = $('<span></span>').text(label).prepend('<span>&nbsp;</span>');
                legendItem.find('span')
                    .css('backgroundColor', browsersChart.options.barColors[i])
                    .css('width', '20px')
                    .css('display', 'inline-block')
                    .css('margin', '5px');
                $('#' + legend).append(legendItem)
            });
        }
        function graphMorris_work(dataMorris, element, legend) {
            var browsersChart = new Morris.Donut({
                element: element,
                data: dataMorris ,
                // dataMorris = [
                //    { value: 70, label: 'foo' },
                //    { value: 15, label: 'bar' },
                //    { value: 20, label: 'baz' },
                //    { value: 10, label: 'A really really long label' }
                //];
                backgroundColor: '#ccc',
                labelColor: '#212121',
                colors: [
                    '#90A4AE',
                    '#FBC02D',
                    '#1E88E5',
                    '#00897B',
                    '#43A047',
                    '#F4511E',
                    '#5D4037',
                    '#6A1B9A',
                    '#0277BD',
                    '#212121',
                    '#FF5722',
                    '#E91E63',
                    '#00E5FF',
                    '#673AB7'
                    //'#795548',
                    //'#CDDC39'
                ],
                formatter: function (x) { return x  }
            });

            browsersChart.options.data.forEach(function (label, i) {
                //var legendItem = $('<span></span>').text(label['value'] + " " + label['label']).prepend('<i>&nbsp;</i>');
                var legendItem = $('<span></span>').text(label['label']).prepend('<i>&nbsp;</i>');
                legendItem.find('i')
                    .css('backgroundColor', browsersChart.options.colors[i])
                    .css('width', '20px')
                    .css('display', 'inline-block')
                    .css('margin', '5px')
                $('#' + legend).append(legendItem)
            });

            
        }
        function StatusColor(Status) {
                if (Status == 'Awaiting MA' || Status == 'Awaiting Approve') {
                    var txtStatus = '<tr><span style="color:#FF9800">' + Status + '</span></tr>';
                } else if (Status == 'Complete') {
                    var txtStatus = '<tr><span style="color:#398439">' + Status + '</span></tr>';
                } else if (Status == 'Reject') {
                    var txtStatus = '<tr><span style="color:red">' + Status + '</span></tr>';
                }
                return (txtStatus);
            }

    </script>


</asp:Content>
