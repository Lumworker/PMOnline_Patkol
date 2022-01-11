<%@ Page Title="Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PMChecklist.aspx.cs" Inherits="PMOnline.PMChecklist" %>

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
        #ModalNewPACharge {
            z-index: 1600 !important;
        }

        .img-thumbnail {
            display: inline-block;
            max-width: 100%;
            padding: 4px;
            line-height: 1.42857143;
            border: 1px solid #ddd;
            border-radius: 4px;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }

        input[type='radio'] {
            transform: scale(2);
            margin-right: 7px;
            margin-top: 7px;
        }
        /*----------CSS Check box-------------*/
        /*input[type=checkbox] {
            -ms-transform: scale(2);
            -moz-transform: scale(2); 
            -webkit-transform: scale(2); 
            -o-transform: scale(2); 
            transform: scale(2);
            padding: 10px;
        }*/
        /*.checkboxtext {
            font-size: 110%;
            display: inline;
        }*/
        /*.center{
            text-align: center;
        }*/
        /*.att-margin{
             margin-top: 2.5rem;
        }*/


        #qrcode img {
            margin: auto;
        }
    </style>
    <div class="page-header">
        <a style="display: none; font-size: 30px" id="HeaderHome" href="">Home >> </a><span id="txtHeader" style="font-size: 28px;">Checklist Form</span>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button type="button" id="btnModalReject" class="btn btn-danger btn-margin-left" style="float: right;">Reject</button>
                <button type="button" id="btnModalApprove" class="btn btn-success btn-margin-left" style="float: right;">Approve</button>
                <button type="button" id="btnChecklistSubmit" class="btn btn-warning btn-margin-left" style="float: right;">Submit</button>
                <button type="button" id="btnChecklistSave" class="btn btn-default btn-margin-left" style="float: right;">Save</button>
               
            </div>
        </div>
    </div>


    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อพนักงาน"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtUser" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                                <input type="text" id="txtOwnerEmpNum" class="form-control" style="min-width: 100%;display:none" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="IT Tag"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtITTag" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Site Ref"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtSite_ref" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtStatus" class="form-control" value="Approve" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-12" id="divRejectRemark" style="display:none;">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Reject Remark"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <textarea class="form-control" id="txtRejectRemark" rows="5" style="min-width: 100%;" disabled ></textarea>
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
    <!--panel-default-->
            </div>
        </div>
        <!--panel-body-->
    </div>
    <!--Panel-Group -->
    <%--/////////// END Profile /////////////--%>

    <div class="panel-group">
        <div class="panel panel-default " style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <%--รายการที่ตรวจเช็ค--%>
                        <div class="col-md-12">
                            <span style="font-size: 18px; font-weight: bold;">รายการที่ตรวจเช็ค</span>
                            <div style="margin-top: 2rem;" id="divChecklistDetail">
                                <input type="text" id="countRadio" style="display: none;" />
                                <%--แบบ Radio--%>
                                <div class="row">
                                </div>
                            </div>
                        </div>
                        <%-- กรณีพิเศษ--%>
                        <div class="col-md-12">
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <span style="font-size: 15px; font-weight: bold;">กรณีพิเศษตรวจเช็ค</span>
                                </div>
                                <div class="col-md-6">
                                    <button type="button" class="btn btn-success" id="addSpecialCase" style="float: right;"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered" id="tableSpaicalChecklist">
                                    <thead>
                                        <tr>
                                            <th class="center">Type</th>
                                            <th>ชื่อกรณี</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListSpaicalChecklistUpdate">
                                    </tbody>
                                    <tbody id="ListSpaicalChecklistNew">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>
    <!--Panel-Group -->

    <%--/////////// END Checklist /////////////--%>


    <div class="panel-group">
        <div class="panel panel-default " style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div id="addAtt" style="margin-left: 1rem;" class="row">
                            <p style="margin: 1rem; float: left;" id="txtAdd_File">Add File : </p>
                            <input type="file" id="addAttach" class="form-control max-wide EmpImg inputFile att-margin" style="display: none">
                            <button type="button" class="btn btn-success" style="width: 50px; margin-bottom: 1rem;" id="btnmodaladdAttach" onclick="document.getElementById('addAttach').click();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                          
                        </div>
                        <table class="table  table-striped">
                            <thead>
                            </thead>
                            <tbody id="ListAttach1">
                            </tbody>
                            <tbody id="ListAttach2">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="ModalQRCode" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <h4 class="modal-title">QR Code</h4>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 32em; max-width: 100%; text-align: center;">
                    <div class="row">
                        <div class='col-md-12 col-sm-12 col-xs-12' id="qrcode" style="text-align: center; margin-top: 10px;">
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
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

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <a href="" class="btn btn-info btn-block" id="GobackinSubmit" style="margin-top: 15px">กลับหน้าหลัก</a>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!--- End Modal QRCode --->
    <div class="modal fade" id="ModalApprove" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="TitleApproveModal">User Approve</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class=" form-group">
                        <div class="row" id="divLogin">
                            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รหัสพนักงาน"></asp:Label>
                                <div class="col-md-9 col-xs-12">
                                    <input type="text" id="txtUserApprove" class="form-control" style="min-width: 100%" />
                                </div>
                            </div>
                            <%--<div class="form-group col-md-12 col-sm-12 col-xs-12 ">
                                <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รหัสผ่าน"></asp:Label>
                                <div class="col-md-9 col-sm-12 col-xs-12 row-no-padding ">
                                    <div class="col-md-2 col-xs-2 ">
                                        <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="1" />
                                    </div>
                                    <div class="col-md-2  col-xs-2 ">
                                        <input type="password" class="form-control nextInputs" autocomplete="off" maxlength="1" name="2" />
                                    </div>
                                    <div class="col-md-2 col-xs-2 ">
                                        <input type="password" class="form-control nextInputs" autocomplete="off" maxlength="1" name="3" />
                                    </div>
                                    <div class="col-md-2 col-xs-2 ">
                                        <input type="password" class="form-control nextInputs" autocomplete="off" maxlength="1" name="4" />
                                    </div>
                                    <div class="col-md-2  col-xs-2 ">
                                        <input type="password" class="form-control nextInputs" autocomplete="off" maxlength="1" name="5" />
                                    </div>
                                    <div class="col-md-2  col-xs-2 ">
                                        <input type="password" class="form-control nextInputs" autocomplete="off" maxlength="1" name="6" />
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                    <div class="row  form-group" style="text-align: center; margin-top: 15px">
                        <div class="col-md-12  col-xs-12 ">
                            <button type="button" class="btn btn-success btn-lg" id="btnApprove" disabled>Approve</button>
                            <button type="button" class="btn btn-success btn-lg" id="btnlogin" disabled>Login</button>
                        </div>
                    </div>
                    <div class="row" id="divReject" style="display: none; margin-top: 5px; margin-bottom: 5px">
                        <div class="col-md-12  col-xs-12">
                            <asp:Label ID="Label5" Font-Size="Medium" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="หมายเหตุ"></asp:Label>
                            <textarea class="form-control max-wide" id="txtReject" rows="5"></textarea>
                        </div>
                        <div class="col-md-12  col-xs-12" style="text-align: center; margin-top: 15px;">
                            <button type="button" class="btn btn-danger btn-lg" id="btnReject">Reject</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!--- End Modal User --->

    <script type="text/javascript">
        $(document).ready(function () {
            var ID = getAllUrlParams("ID");
            var User = getAllUrlParams("Username");//Empnum
            var ITTAG_ID = getAllUrlParams("ITTAG_ID");
            var Status = getAllUrlParams("Status");
            var i = 0;

            $("#HeaderHome").attr("href", "./PMReportingCheckllist.aspx?Username=" + User);
            $("#GobackinSubmit").attr("href", "./PMReportingCheckllist.aspx?Username=" + User);
            //$("#txtUserApprove").val(User);


            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetAssign_Detail") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Header_ID: ID }),
                success: GetChecklistDetail
            });
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GETCheckList") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ ITTAG_ID: ITTAG_ID }),
                success: GetChecklist
            });
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetAssign_Special") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Header_ID: ID }),
                success: GetSpaicalCase
            });
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/TB_PMOnline_Assign_IMG") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Header_ID: ID }),
                success: GetImage
            });

            //----------End Ajax Call Data


            //$("#txtUser").val('62116');
            //$("#txtStatus").val('Awaiting Approve');
            checkStatus();

            //----------End Hide Button of Stautus

            $(document).on("click", "#btnChecklistSave", function () {
                saveChecklistDetail();
                UpdateSpaicalCase();
                InsertSpaicalCase();
                saveAttach(ID);
                alert("SaveComplete");
                location.reload();
            });
            $(document).on("click", "#btnModalApprove", function () {
                $("#ModalApprove").modal("show");
                $("#TitleApproveModal").text("User Approve");
                $("#btnlogin").css("display", "none");
                $("#btnApprove").css("display", "");
                //$("#btnApprove").css('text-align','center');
            });
            $(document).on("click", "#btnModalReject", function () {
                $("#ModalApprove").modal("show");
                $("#TitleApproveModal").text("User Reject");
                $("#btnApprove").css("display", "none");
                $("#btnlogin").css("display", "");
                //$("#btnlogin").css('text-align','center');
            });
            $(document).on("click", ".btndeleteImg", function () {
                var ID = $(this).attr("data-id");
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker_IMG") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Header_ID: 0, Path: '', Desc: '', filetype: '' }),
                    success: function (response) {
                        alert('Delete Complete');
                    }
                });
            });
            $(document).on("click", ".btndeleteSpecialCase", function () {
                var ID = $(this).attr("data-id");
                //var txtType = $(this).find("td:nth-child(1)").find("select").val();
                //var txtSpaical = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker_Special") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, Header_ID: -999, Type: '', Remark: '', Username: User }),
                });
            });

            $(document).on("click", "#btnChecklistSubmit", function () {
                if (confirm('Confrim Submit?')) {
                    $("#IMGUpload").modal("show");
                    var countRadio = $("#countRadio").val();
                    var usersession = sessionStorage.getItem("username");

                    var status = [];
                    for (var i = 0; i < countRadio; i++) {
                        //Check every radio is checked = true
                        if ($("input[name=" + i + "]").is(":Checked")) { status.push(true); }
                        else { status.push(false); }
                    }
                    //console.log(status);
                    if (status.every(function (x) { return x == true; })) {
                        //if every array == true 
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: ID, User: usersession, status: 'Awaiting MA', Reject_Remark: '' }),
                            success: function (response) {
                                saveAttach(ID);
                                InsertSpaicalCase();
                                UpdateSpaicalCase();
                                saveChecklistDetail();
                                //location.reload();
                                GenQRCode();
                                $("#ModalQRCode").modal("show");
                            }
                        });
                    } else {
                        alert("CheckList don't have checked.");
                    }
                    $("#IMGUpload").modal("hide");
                }
            });

            $(document).on("click", "#btnApprove", function () {
                var UserApprove = $("#txtUserApprove").val();
                if (User == UserApprove) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, User: UserApprove, status: 'Awaiting Approve', Reject_Remark: '' }),
                        success: function (response) {
                            alert('Approve ' + response.d);
                            $("#txtUserApprove").prop("disabled", true);
                            $("#btnApprove").prop("disabled", true);
                            //$("#nextInputs").prop("disabled", true);
                            $("#btnModalApprove").css("display", 'none');
                            $("#btnModalReject").css("display", 'none');
                            $("#ModalApprove").modal("hide");
                            location.reload();
                            swal('Complete', '', 'success');
                        }
                    });
                } else {
                    swal('Error','Only owner can Verifly', 'error');
                }
                <%--var pass = '';
                var check = 0;
                $(".nextInputs").each(function () {
                    if ($(this).val() == '') {
                        check += 1;
                    } else {
                        pass = pass + '' + $(this).val();
                    }
                })
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Check_Approve_Reject") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        username: UserApprove,
                        password: pass
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker") %>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ ID: ID, User: UserApprove, status: 'Awaiting Approve', Reject_Remark: '' }),
                                success: function (response) {
                                    alert('Approve ' + response.d);
                                    $("#txtUserApprove").prop("disabled", true);
                                    $("#btnApprove").prop("disabled", true);
                                    $("#nextInputs").prop("disabled", true);
                                    $("#btnModalApprove").css("display", 'none');
                                    $("#btnModalReject").css("display", 'none');
                                    $("#ModalApprove").modal("hide");
                                    location.reload();

                                }
                            });
                        } else {
                            alert("Incorrect username/password!");
                        }
                    }
                });--%>
            });

            $(document).on("click", "#btnReject", function () {
                var UserApprove = $("#txtUserApprove").val();
                var Reject_Remark = $("#txtReject").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: ID, User: UserApprove, status: 'Rejected', Reject_Remark: Reject_Remark }),
                    success: function (response) {
                            swal('Complete', 'Reject ' + response.d, 'success');
                        $("#txtUserApprove").prop("disabled", true);
                        $("#btnReject").prop("disabled", true);
                        $("#Reject_Remark").prop("disabled", true);
                        $("#btnModalApprove").css("display", 'none');
                        $("#btnModalReject").css("display", 'none');
                        $("#ModalApprove").modal("hide");
                        location.reload();

                    }
                });
            });


            $(document).on("click", "#btnlogin", function () {
                var UserApprove = $("#txtUserApprove").val();
                if (User == UserApprove) {
                    $("#divLogin").css("display", "none");
                    $("#btnlogin").css("display", "none");
                    $("#divReject").css("display", "block");
                } else {
                    swal('Error','Only owner can Verifly', 'error');
                }
               <%-- var pass = '';
                var check = 0;
                $(".nextInputs").each(function () {
                    if ($(this).val() == '') {
                        check += 1;
                    } else {
                        pass = pass + '' + $(this).val();
                    }
                })

                console.log(UserApprove);
                console.log(pass);
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("Default.aspx/Check_Approve_Reject") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        username: UserApprove,
                        password: pass
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $("#divLogin").css("display", "none");
                            $("#btnlogin").css("display", "none");
                            $("#divReject").css("display", "block");
                        } else {
                            alert("Incorrect username/password!");
                        }
                    }
                });--%>
            });


            $(document).on("click", "#addSpecialCase", function () {
                var fragment = '';
                fragment += '<tr>';
                //fragment += '<td class="center">';
                //fragment += '<input type="text" class="max-wide form-control" placeholder="Type" aria-label="Username" aria-describedby="basic-addon1" />';
                fragment += '<td class="center"><select class="form-control max-wide"><option value="Normal" selected>Normal</option><option value="Warning">Warning</option><option value="Danger">Danger</option></select></td>';
                fragment += '</td>';
                fragment += '<td class="input-group">';
                fragment += '<input type="text" class="max-wide form-control" placeholder="SpaicalName"  autocomplete="off" aria-label="Username" aria-describedby="basic-addon1" />';
                fragment += '<span class="input-group-btn"  onclick="deleteRow(this)">';
                fragment += '<button type="button" class="btn btn-danger att-margin" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button>';
                fragment += '</span>';
                fragment += '</td>';
                fragment += '</tr>';
                $('#ListSpaicalChecklistNew').append(fragment);
            });

            $(document).on("click", ".Goback", function () {
                //window.history.back();
                window.open("http://pkdevelop.patkol.com/PMOnline/PMReportingCheckllist.aspx?Username=" + User);
            });

            //----------------END OnChick-------------------

            var imagenum = 1;
            $(document).on("change", "#addAttach", function () {
                var fragment = '';
                var clone = $("#addAttach").clone();
                clone.attr("id", "XXXXXXX");
                fragment += '<tr>';
                fragment += '<td> <img id="previewHolder' + imagenum + '" style="border: 1px solid #ddd;line-height: 1.42857143;margin-left: 20px;" class="center" width="100" height="100" src="https://icons-for-free.com/iconfiles/png/512/cloud+upload+file+storage+upload+icon-1320190558968694328.png" alt="Placeholder"></td>';
                fragment += '<td><input type="text" class="form-control max-wide ImgName att-margin"  placeholder="คำอธิบายภาพ"></td>';
                fragment += '<td><button type="button" class="btn btn-danger att-margin" onclick="deleteRow(this)" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                fragment += '<td id="IMG' + imagenum + '"></td> ';
                fragment += '</tr>';
                $('#ListAttach2').append(fragment);
                $("#IMG" + imagenum).append(clone);
                readURL(this, imagenum);
                imagenum++;
            });
            //----------------END OnChange-------------------
            //$(document).on("click", "#btnTestImage", function () {
            //    $("#ListAttach2 tr").each(function () {
            //        var getIMG = $(this).find("td:nth-child(4)").find("input[type=file]");
            //        console.log(getIMG[0].files[0]);
            //        console.log(getIMG[0].files[0]['name']);
            //    });
            //});

            //$("#txtUserApprove").on("keyup", function () {
            //    var username = $("#txtUserApprove").val();
            //    if (username.length >= 5) {
            //        $("input.nextInputs[name='1']").focus();
            //    }
            //});
            $("#txtUserApprove").on("keyup", function () {
                var username = $("#txtUserApprove").val();
                if (username.length >= 5) {
                    $("#btnApprove").prop("disabled", false);
                    $("#btnlogin").prop("disabled", false);
                } else {
                    $("#btnApprove").prop("disabled", true);
                    $("#btnlogin").prop("disabled", true);
                }
            });

            $(".nextInputs").on('keyup', function (e) {
                if (this.value.length == this.maxLength) {
                    var name = $(this).attr("name");
                    var iname = parseInt(name) + 1;
                    //console.log(iname);
                    $("input[name='" + iname + "']").focus();
                }
                else if (this.value.length == 0) {
                    var name = $(this).attr("name");
                    var iname = (parseInt(name) - 1) == 0 ? 1 : (parseInt(name) - 1);
                    //console.log(iname);
                    $("input[name='" + iname + "']").focus();
                }
                $("#btnApprove").prop("disabled", false);
                $("#btnlogin").prop("disabled", false);
            });
            //----------------END OnKeyUp-------------------

            function saveChecklistDetail() {
                var countRadio = $("#countRadio").val();

                for (var i = 0; i < countRadio; i++) {
                    var ID = $("input[name=" + i + "]:Checked").attr("data-id");
                    var Checked = parseInt($("input[name=" + i + "]:Checked").val());
                    var Remark = $("#" + i).val();
                    //console.log("ID :" + ID + "\n");
                    //console.log("checked :" + Checked + "\n");
                    //console.log("Remark :" + Remark + "\n");
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker_Detail") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Checked: Checked, Remark: Remark })
                    });
                }
            }

            function GetChecklistDetail(response) {
                var fragment = '';
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var ID = val[0];
                        var IDCheckList_Detail = val[1];
                        var Level = val[2];
                        var Name = val[3];
                        var Checked = val[4];
                        var Remark = val[5];

                        fragment += '<div class="row">';
                        fragment += '       <div class="col-md-12" >';
                        fragment += '            <span style="font-size: 18px; font-weight: bold; float:left;">' + Level + '.' + Name + '</span>';
                        fragment += '            <br />';
                        fragment += '     <div class="col-md-12" style="margin-top: 5px;">';
                        fragment += '             <div class="col-md-4">';
                        fragment += '               <div class="form-check">';

                        fragment += '<input class="form-check-input readiocheck" type="radio" name="' + i + '" value="1" data-id="' + ID + '" ' + (Checked == "True" ? 'Checked' : '') + '>';

                        fragment += '             <label class="form-check-label" for="exampleRadios1">';
                        fragment += '            ปกติ';
                        fragment += '            </label>';
                        fragment += '               </div>';
                        fragment += '             </div>';
                        fragment += '        <div class="col-md-8">';
                        fragment += '             </div>';
                        fragment += '         </div>';
                        fragment += '     <div class="col-md-12">';
                        fragment += '            <div class="col-md-12">';
                        fragment += '           <div class="form-check">';
                        fragment += '                 <input class="form-check-input readiocheck" type="radio" name="' + i + '" value="0" check data-id="' + ID + '" ' + (Checked == "False" ? 'Checked' : '') + '>';

                        fragment += '                   <label class="form-check-label" for="exampleRadios1">';
                        fragment += '                      ไม่ปกติ';
                        fragment += '                   </label>';
                        fragment += '              </div>';
                        fragment += '        </div>';
                        fragment += '          <div class="col-md-12">';
                        fragment += '     <span style="font-size: 13px; font-weight: bold; float:left;margin-left:7px;">หมายเหตุ</span>';
                        fragment += '       </div>';
                        fragment += '        <div class="col-md-8 col-sx-12">';
                        fragment += '           <input type="text" class="max-wide form-control PermissionCheck" id="' + i + '" value="' + Remark + '" placeholder="หมายเหตุ..." autocomplete="off"  aria-label="Username" aria-describedby="basic-addon1" />';
                        fragment += '         </div>';
                        fragment += '     </div>';
                        fragment += '    </div>';
                        fragment += '</div>';
                        fragment += '    <hr style="margin-left:5rem;" />';
                        i++;
                    });
                }
                $("#countRadio").val(i);
                $("#divChecklistDetail").append(fragment);
            }

            function GetChecklist(response) {
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        //[IT_TAG],[IT_TAG_GROUP],[EmpNum],[Fullname],[Status],[Assign_Date],[site_ref]
                        var IT_TAG = val[0];
                        var IT_TAG_GROUP = val[1];
                        var EmpNum = val[2];
                        var Fullname = val[3];
                        var Status = val[4];
                        var Assign_Date = val[5];
                        var site_ref = val[6];
                        var Reject_Remark = val[7];
                        //$("#txtUserApprove").val(EmpNum);
                        $("#txtUser").val(Fullname);
                        $("#txtOwnerEmpNum").val(EmpNum);
                        $("#txtITTag").val(IT_TAG);
                        $("#txtSite_ref").val(site_ref);
                        $("#txtStatus").val(Status);


                        if (Status == "Reject") {
                            $("#txtRejectRemark").val(Reject_Remark);
                            $("#divRejectRemark").css("display", "Block");
                        }

                    });
                }
            }
            function GetImage(response) {
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        //[ID],[Header_ID],[Path]
                        var ID = val[0];
                        var Header_ID = val[1];
                        var Path = val[2];
                        Path = Path.substring(2);
                        var Desc = val[3];
                        var fragment = '';
                        fragment += '<tr>';
                        fragment += '<td> <img style="border: 1px solid #ddd;line-height: 1.42857143;margin-left: 20px;" class="center" width="100" height="100" src="https://' + Path + '" alt="Placeholder"></td>';
                        fragment += '<td><input type="text" class="form-control max-wide ImgName att-margin PermissionCheck" value="' + Desc + '" autocomplete="off"  placeholder="คำอธิบายภาพ"></td>';
                        fragment += '<td><button type="button" class="btn btn-danger att-margin btndeleteImg" onclick="deleteRow(this)" data-id="' + ID + '"  ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                        fragment += '</tr>';
                        //console.log(Desc);
                        $('#ListAttach1').append(fragment);
                    });
                }
            }

            function readURL(input, imagenum) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    //console.log(imagenum);
                    reader.onload = function (e) {
                        $('#previewHolder' + imagenum).attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function InsertSpaicalCase() {
                $("#ListSpaicalChecklistNew tr").each(function () {
                    var Header_ID = ID;
                    var Spaical_ID = 0;
                    var txtType = $(this).find("td:nth-child(1)").find("select").val();
                    var txtSpaical = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                    if (txtSpaical != '') {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker_Special") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: Spaical_ID, Header_ID: Header_ID, Type: txtType, Remark: txtSpaical, Username: User }),
                            //success: function (response) {
                            //}
                        });
                        //console.log(txtType);
                    }
                });
            }
            function UpdateSpaicalCase() {
                $("#ListSpaicalChecklistUpdate tr").each(function () {
                    var Header_ID = ID;
                    var Spaical_ID = $(this).attr("data-id");
                    var txtType = $(this).find("td:nth-child(1)").find("select").val();
                    var txtSpaical = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                    if (txtSpaical != '') {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker_Special") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: Spaical_ID, Header_ID: Header_ID, Type: txtType, Remark: txtSpaical }),
                            //success: function (response) {
                            //}
                        });
                    }
                    console.log(txtType);
                });
            }

            function GetSpaicalCase(response) {
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        //[ID],[Header_ID],[Type],[Remark]
                        var ID = val[0];
                        var Header_ID = val[1];
                        var Type = val[2];
                        var Remark = val[3];
                        var fragment = '';
                        fragment += '<tr data-id="' + ID + '">';
                        if (Status == 'QRCODE') {
                            fragment += '<td class="center">' + Type + '</td > ';
                            fragment += '<td class="center">' + Remark + '</td > ';
                        }
                        else {
                            fragment += '<td class="center">';
                            fragment += '<select class="form-control max-wide PermissionCheck">';
                            Type == 'Normal' ? fragment += '<option value="Normal" selected>Normal</option >' : fragment += '<option value="Normal"> Normal</option>';
                            Type == 'Warning' ? fragment += '<option value="Warning" selected>Warning</option>' : fragment += '<option value="Warning">Warning</option>';
                            Type == 'Danger' ? fragment += '<option value="Danger" selected>Danger</option>' : fragment += '<option value="Danger">Danger</option>';
                            fragment += '</select ></td > ';
                            fragment += '<td class="input-group">';
                            fragment += '<input type="text" class="max-wide form-control PermissionCheck" autocomplete="off" placeholder="SpaicalName" value="' + Remark + '"  aria-label="Username" aria-describedby="basic-addon1" />';
                            fragment += '<span class="input-group-btn" >';
                            fragment += '<button type="button" class="btn btn-danger att-margin btndeleteSpecialCase " onclick="deleteRowSpaical(this)" data-id="' + ID + '"  ><i class="glyphicon glyphicon-trash " aria-hidden="true" style="color:white"></i></button>';
                            fragment += '</span>';
                            fragment += '</td>';
                        }
                        fragment += '</tr>';
                        $('#ListSpaicalChecklistUpdate').append(fragment);
                        //console.log(Type);
                    });
                }
            }

            function saveAttach(CheckListID) {
                $("#ListAttach2 tr").each(function () {
                    //var image = $(this).find("td:nth-child(4)").find("input[type=file]");
                    //console.log(getIMG[0].files[0]);
                    var image = $(this).find("td:nth-child(4)").find("input[type=file]")[0].files[0];
                    var filetype = '.' + image["name"].split('.').pop();
                    var Path = "\\\\pkdevelop.patkol.com\\PMOnline_Attach";
                    var Desc = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                    //console.log(filetype);
                    //console.log(Desc);
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/SP_PMOnline_Assign_Checker_IMG") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: 0
                            , Header_ID: CheckListID
                            , Path: Path
                            , Desc: Desc
                            , filetype: filetype
                        }),
                        success: function (response) {
                            var imageid = response.d;
                            Path = + imageid;
                            console.log(Path);
                            console.log(imageid);
                            insertFile(image, Path, CheckListID, imageid);
                        }
                    });
                    //console.log('saveImg');
                });
            }

            function GenQRCode() {
                var UserOwner = $("#txtOwnerEmpNum").val();
                var LinkQR = "https://pkdevelop.patkol.com/PMOnline/PMChecklist.aspx?Username=" + UserOwner + "&ID=" + ID + "&ITTAG_ID=" + ITTAG_ID + "&Status=QRCODE";
                $("#qrlink").val(LinkQR);
                var qrcode = new QRCode(document.getElementById("qrcode"),
                    { text: LinkQR, correctLevel: QRCode.CorrectLevel.H });
                var save = qrcode._el.childNodes[1];
                $("#qrcode").append(save);
            }

            function checkStatus() {
                var ChecklistStatus = $("#txtStatus").val();
                var Position_Can_Work = (ChecklistStatus == "Awaiting MA" || ChecklistStatus == "Reject" ) ? "Checker" : "";
                var Permission = CallAjaxReturnData("<%= ResolveUrl("Default.aspx/GetPermission") %>", { Emp_Num: User, Position: Position_Can_Work });
                //var Permission = 'Admin';
                //console.log(Permission);
                if (Status == "QRCODE" && ChecklistStatus != "Complete") {
                    $("#Titlename").text('PM Online Approval');
                    if (ChecklistStatus != "Awaiting Approve") {
                        $("#btnModalApprove").css("display", "none");
                        $("#btnModalReject").css("display", "none");
                        console.log('QRCODE PM Online Approval');
                    } else {
                        $("#btnModalApprove").css("display", "Block");
                        $("#btnModalReject").css("display", "Block");
                        $("#btnChecklistSave").css("display", "none");
                        $("#btnChecklistSubmit").css("display", "none");
                        $("#addSpecialCase").css("display", "none");
                        $("#btnmodaladdAttach").css("display", "none");
                        $(".btndeleteImg").css("display", "none");
                        $("input[type=radio]").attr('disabled', true);
                        $(".PermissionCheck").attr('disabled', true);
                        $("input[type=text]").attr('disabled', true);
                        $("#txtUserApprove").attr('disabled', false);
                        $(".btndeleteSpecialCase ").attr("disabled", true);
                        $("#ListSpaicalChecklistNew").empty();
                        console.log('QRCODE');
                    }
                }
                else if (Permission.length > 0 && ChecklistStatus != "Complete") {
                    //Admin Or Checker
                    if (ChecklistStatus == "Awaiting Approve") {
                        $("#btnChecklistSave").css("display", "none");
                        $("#btnChecklistSubmit").css("display", "none");
                        $("input[type=radio]").attr('disabled', true);
                        $(".PermissionCheck").attr('disabled', true);
                        $("#addSpecialCase").css("display", "none");
                        $("#btnmodaladdAttach").css("display", "none");
                    }
                    $("#btnModalApprove").css("display", "none");
                    $("#btnModalReject").css("display", "none");
                    $(".btndeleteSpecialCase ").css("disabled", "true");
                    $("#HeaderHome").css("display", "");
                    console.log('Admin');
                }
                else if (User) {
                    $(".PermissionCheck").attr('disabled', true);
                    $("#btnModalApprove").css("display", "none");
                    $("#btnModalReject").css("display", "none");
                    $("#btnChecklistSave").css("display", "none");
                    $("#btnChecklistSubmit").css("display", "none");
                    $("#addSpecialCase").css("display", "none");
                    $("#btnmodaladdAttach").css("display", "none");
                    $(".btndeleteSpecialCase").css("display", "none");
                    $(".btndeleteImg").css("display", "none");
                    $("input[type=radio]").attr('disabled', true);
                    $("input[type=text]").attr('disabled', true);
                    $("#ListSpaicalChecklistNew ").empty();
                    console.log('viewer');
                } else {
                    window.location.href = "Login.aspx";
                }

                //console.log('ChecklistStatus: ' + ChecklistStatus);
                //console.log('status: ' + Status);
            }
            //-------------------- End DocumentReady
        });


        function insertFile(image, Path, checklistID, imageid) {
            var formData = new FormData();
            formData.append('file', image);
            formData.append('name', Path);
            formData.append('folderName', checklistID);
            formData.append('imageid', imageid);
            $.ajax({
                type: 'post',
                url: './UploadFile.ashx',
                data: formData,
                async: false,
                success: function (status) {
                    //alert("Upload Complete");
                },
                processData: false,
                contentType: false,
                error: function () {
                    alert("Whoops something went wrong!");
                }
            });
        }

        function deleteRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
        function deleteRowSpaical(btn) {
            var row = btn.parentNode.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

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
