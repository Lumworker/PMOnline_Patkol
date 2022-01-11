<%@ Page Title="Reporting" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMReportingCheckllist.aspx.cs" Inherits="PMOnline.PMReportingCheckllist" %>

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

        #qrcode img {
            margin: auto;
        }
    </style>
    <div class="page-header">
        <h2>Reporting Checklist</h2>
        <%--        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
            </div>
        </div>--%>
    </div>

    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Site Ref"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="SiteRef">
                                </select>
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

                    <!--END Row-->
                    <div class="row">

                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รหัสพนักงาน"></asp:Label>
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
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12 " runat="server" Font-Bold="True" Text="Status"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <select class="form-control max-wide" id="stcStatus">
                                    <option value="" selected>====== Select Status ======</option>
                                    <option value="Awaiting MA">Awaiting MA</option>
                                    <option value="Awaiting Approve">Awaiting Approve</option>
                                    <option value="Complete">Complete</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END Row-->

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
            <!--panel-body-->

            <!--panel-default-->
            <div class="panel panel-default" style="margin-top: 1em; display: none" id="divDataTable">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered center" style="width: 100%" id="tableReportingAssign">
                                    <thead>
                                        <tr>
                                            <th>Site Ref</th>
                                            <th>Tag Code</th>
                                            <th>Emp Num</th>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Assign Date</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListReportingChecklist">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--panel-body-->
            </div>
            <!--panel-default-->
        </div>
        <!--Panel-Group -->
    </div>



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
                            <input type="text" id="textSearchItTag" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" />
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
                        <tbody id='TBodySearchITTag'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

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

    <div class="modal fade" id="ModalChecklist" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12" style="text-align: Left;">
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 32em; max-width: 100%; text-align: center;">
                    <div class="row">
                        <div class='col-md-12 col-sm-12 col-xs-12' id="qrcode" style="text-align: center; margin-top: 10px;">
                        </div>
                    </div>
                    <div class="row">
                        <div class='col-md-12 col-sm-12 col-xs-12' style="margin-top: 10px;">
                            <span style="">OR Copy Link</span>
                        </div>
                        <div class='col-md-12 col-sm-12 col-xs-12' style="text-align: center; margin-top: 10px;">
                            <div class="input-group">
                                <input type="text" id="qrlink" class="form-control" style="min-width: 100%" />
                                <div class="input-group-btn">
                                    <button id="buttonSearchItTagGroup" onclick="CopytoClipboard();" class="btn btn-default" type="button">
                                        <i class="glyphicon glyphicon-copy"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" style="text-align: center;">
                    <div class="row form-group">
                        <div class='col-md-12 col-sm-12 col-xs-12' style="margin-bottom: 10px;">
                            <span style="font-weight: bold; font-size: 15px">Detail</span>
                        </div>
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <a href="./" class="btn btn-info btn-block btn-lg btnChecklistDetail">View Checklist</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--- End Modal QRCode --->

    <script type="text/javascript">
        $(document).ready(function () {
            $("#navBar").css("display", "block");
            var username = sessionStorage.getItem('username');
            var tableReportingAssign = $("#tableReportingAssign").DataTable({
                searching: true,
                responsive: true,
                "order": []
            });
            LoadtableReportingAssign();


            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("default.aspx/GetSite_ref")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSiteRef
            })


            $("#buttonSearchItTag").on('click', function () {
                var search = "";
                GETIT_TAG(search);
            });

            $("#buttonSearchEmp").on('click', function () {
                var search = "";
                var button = '<input type="text" id="EmployeeSearch" placeholder="Search.." class="form-control max-wide" autocomplete="off">';
                $("#search_box_Emp").empty();
                $("#search_box_Emp").append(button);
                GetHR_Employee(search);
                $("#ModalSearchEmp").modal("show");
            });

            $("#btnSearchReport").on('click', function () {
                LoadtableReportingAssign();
            });
            $("#btnClearReport").on('click', function () {
                $("#SiteRef").val($("#SiteRef option:first").val());
                $("#stcStatus").val($("#stcStatus option:first").val());
                $("#txtITTag").val('');
                $("#txtEmpnum").val('');
                //$("#txtITTagGroup").val('');
                LoadtableReportingAssign();
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

            $(document).on("click", ".btnModalChecklist", function () {
                $("#qrcode").empty();
                var status = $(this).closest("tr").find("td:nth-child(5)").text(); 
                var ID = $(this).attr("data-id");
                var ITTAG_ID = $(this).attr("data-it_tag");
                var LinkQR = "https://pkdevelop.patkol.com/PMOnline/PMChecklist.aspx?Username=" + username + "&ID=" + ID + "&ITTAG_ID=" + ITTAG_ID + "&Status=QRCODE";
                var LinkCHECKER = "https://pkdevelop.patkol.com/PMOnline/PMChecklist.aspx?Username=" + username + "&ID=" + ID + "&ITTAG_ID=" + ITTAG_ID + "&Status=CHECKER";
                if (status == 'Awaiting Approve') {
                    var OwnerEmpnum = $(this).closest("tr").find("td:nth-child(3)").text();
                    var LinkQR = "https://pkdevelop.patkol.com/PMOnline/PMChecklist.aspx?Username=" + OwnerEmpnum + "&ID=" + ID + "&ITTAG_ID=" + ITTAG_ID + "&Status=QRCODE";
                    var LinkCHECKER = "https://pkdevelop.patkol.com/PMOnline/PMChecklist.aspx?Username=" + username + "&ID=" + ID + "&ITTAG_ID=" + ITTAG_ID;
                }
                $(".btnChecklistDetail").attr("href", LinkCHECKER);
                $("#qrlink").val(LinkQR);
                var qrcode = new QRCode(document.getElementById("qrcode"),
                    { text: LinkQR, correctLevel: QRCode.CorrectLevel.H });
                var save = qrcode._el.childNodes[1];
                $("#qrcode").append(save);
                $("#ModalChecklist").modal("show");
                console.log(username);
            });

            $(document).on("click", ".btnChecklistDetail", function () {
                $("#qrcode").empty();
                var qrcode = new QRCode(document.getElementById("qrcode"),
                    { text: text, correctLevel: QRCode.CorrectLevel.H });
                var save = qrcode._el.childNodes[1];
                $("#qrcode").append(save);
                $("#ModalChecklist").modal("show");
            });


            $(document).on("keyup", "#EmployeeSearch", function () {
                var search = $("#EmployeeSearch").val();
                GetHR_Employee(search);
            });

            $("#textSearchItTag").on("change", function () {
                var search = $("#textSearchItTag").val();
                GETIT_TAG(search);
            });

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

            function LoadtableReportingAssign() {
                $("#IMGUpload").modal("show");
                tableReportingAssign.clear().draw();
                var site_ref = $("#SiteRef").val();
                var IT_TAG = $("#txtITTag").val();
                var EmpNum = $("#txtEmpnum").val();
                var EmpNum = $("#txtEmpnum").val();
                var stcStatus = $("#stcStatus").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/IT_TAG_Assign_Report") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: site_ref, IT_TAG: IT_TAG, EmpNum: EmpNum, Status: stcStatus }),
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
                                var Name = val[7];
                                var button = ''
                                if (Status == 'Awaiting MA') {
                                    button = '<td class="center" ><a href="./PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '&Status=CHECKER" class="btn btn-warning btn-block">Check List</a></td> ';
                                }
                                if (Status == 'Reject') {
                                    button = '<td class="center" ><a href="./PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '&Status=CHECKER" class="btn btn-warning btn-block">Check List</a></td> ';
                                } else if (Status == 'Awaiting Approve') {
                                    button = '<td class="center" ><a class="btn btn-warning btn-block btnModalChecklist" data-id="' + ID + '" data-IT_TAG="' + IT_TAG + '"  >Check List</a></td> ';
                                } else if (Status == 'Complete') {
                                    button = '<td class="center" ><a href="./PMChecklist.aspx?Username=' + username + '&ID=' + ID + '&ITTAG_ID=' + IT_TAG + '" class="btn btn-warning btn-block">Check List</a></td> ';
                                }
                                tableReportingAssign.row.add([
                                    site_ref,
                                    //IT_TAG_GROUP,
                                    IT_TAG,
                                    EmpNum,
                                    Name,
                                    StatusColor(Status),
                                    Assign_Date,
                                    button,
                                    //'<td class="center" ><a href="./PMChecklist.aspx?Username='+username+'&ID='+ID+'&ITTAG_ID='+IT_TAG+'&Status=CHECKER"  class="btn btn-warning btn-block"  >Check List</a></td> ',
                                ]).draw(false);
                            });
                        }
                        $("#IMGUpload").modal("hide");
                        $("#divDataTable").css("display", "")
                    }
                });
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

        });

        function CopytoClipboard() {
            //var copyText = $("#qrlink").va();
            var copyText = document.getElementById("qrlink");
            copyText.select();
            copyText.setSelectionRange(0, 99999)
            document.execCommand("copy");
            //onclick="CopytoClipboard()"
        }

    </script>


</asp:Content>
