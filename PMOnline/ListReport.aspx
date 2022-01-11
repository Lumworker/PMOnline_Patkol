<%@ Page Title="List Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListReport.aspx.cs" Inherits="PMOnline.ReportMonitering" %>

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


        #qrcode img {
            margin: auto;
        }
    </style>
    <div class="page-header">
        <span id="txtHeader" style="font-size: 28px;">รายงานผลการตรวจเช็ค</span>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel panel-default" style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label1" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="IT Tag"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtITTag" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>

                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="IT Tag Group"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtITTagGroup" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label3" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="รหัสพนักงาน"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtEmpnum" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label4" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="ชื่อพนักงาน"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtUser" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label5" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Assign By"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtAssignName"  class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label6" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Assign Date"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtAssignDate"  class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label7" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Checker By"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtCheckerName" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                            <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Check Date"></asp:Label>
                            <div class="col-md-9 col-xs-12">
                                <input type="text" id="txtCheckerDate" class="form-control" style="min-width: 100%" autocomplete="off" onkeypress="detect_enter_keyboard(event)" disabled />
                            </div>
                        </div>
                    </div>
                    <!--END Row-->
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
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
                        <%-- กรณีพิเศษ--%>
                        <div class="col-md-12">
                            <div class="row form-group">
                                <div class="col-md-12" style="margin-bottom:5px;">
                                    <span style="font-size: 18px; font-weight: bold;">รายการที่กรณีพิเศษตรวจเช็ค</span>
                                </div>
                                <div class="col-md-12">
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
                </div>
            </div>
            <!--panel-body-->
        </div>
        <!--panel-default-->
    </div>
    <!--Panel-Group -->

    <%--/////////// END SpeicalCase /////////////--%>


    <div class="panel-group">
        <div class="panel panel-default " style="margin-top: 1em;">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="row">
                        <div id="addAtt" style="margin-left: 1rem;" class="row">
                            <span style="font-size: 18px; font-weight: bold;">ภาพประกอบ</span>
                            <input type="file" id="addAttach" class="form-control max-wide EmpImg inputFile att-margin" style="display: none">
                           </div>
                        <div id="ListAttach1">
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        $(document).ready(function () {

            //?ID=101&ITTAG_ID=CP150058
            var ID = getAllUrlParams("ID");
            var User = getAllUrlParams("Username");//Empnum
            var ITTAG_ID = getAllUrlParams("ITTAG_ID");
            //var Status = getAllUrlParams("Status");
            var i = 0;

            $("#HeaderHome").attr("href", "./PMReportingCheckllist.aspx?Username=" + User);
            $("#txtUserApprove").val(User);



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
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("Default.aspx/GetChecklistReport_Profile") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ ID: ID }),
                success: GetChecklistReport_Profile
            });


            $("input[type=radio]").attr('disabled', true);
            $(".PermissionCheck").attr('disabled', true);
            $("input[type=text]").attr('disabled', true);
            //----------End Ajax Call Data


            //----------End Hide Button of Stautus


            $(document).on("click", ".Goback", function () {
                //window.history.back();
                window.open("http://pkdevelop.patkol.com/PMOnline/PMReportingCheckllist.aspx?Username=" + User);
            });

            //----------------END OnChick-------------------


            //----------------END OnChange-------------------


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
                        fragment += '           <input type="text" autocomplete="off" class="max-wide form-control PermissionCheck" id="' + i + '" value="' + Remark + '" placeholder="หมายเหตุ..." aria-label="Username" aria-describedby="basic-addon1" />';
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
                        //$("#txtUser").val(Fullname);
                        //$("#txtITTag").val(IT_TAG);
                        $("#txtSite_ref").val(site_ref);
                        $("#txtStatus").val(Status);
                    });
                }
            }
            function GetImage(response) {
                var fragment = '';
                var lastindex = 0;
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        var ID = val[0];
                        var Header_ID = val[1];
                        var Path = val[2];
                        Path = Path.substring(2);
                        var Desc = val[3];

                        if (index % 2 == 0) {
                            fragment += '<div class="row" style="text-align: center;">';
                        }
                        fragment += '<div class="col-md-6 col-xs-12">';
                        fragment += '<div class="row">';
                        fragment += '<img style="border: 1px solid #ddd; line-height: 1.42857143; margin-left: 20px;height: 400px;width: auto;margin-top: 3rem;    margin-bottom: 3rem;" class="center" width="50%" height="50%"  src="https://' + Path + '" alt="Placeholder">';
                        fragment += '</div>';
                        fragment += '<b >คำอธิบายภาพ :</b><span>' + Desc + '</span>';
                        fragment += '</div>';
                        if (index % 2 == 1) {
                            fragment += '</div>';
                        }
                        lastindex = index;
                    });
                    if (lastindex % 2 == 0) {
                        fragment += '</div>';
                    }
                    $('#ListAttach1').append(fragment);
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
                        fragment += '<td class="center">';
                        fragment += StatusColor(Type);
                        fragment += '<td>';
                        fragment += Remark;
                        fragment += '</td>';
                        fragment += '</tr>';
                        $('#ListSpaicalChecklistUpdate').append(fragment);
                        //console.log(Type);
                    });
                }
            }

            function GetChecklistReport_Profile(response) {
                if (response.d.length > 0) {
                    $.each(response.d, function (index, val) {
                        //ID IT_TAG IT_TAG_GROUP EmpNum Fullname IT_TAG_site Assign_Name Assign_Date Checke5r Check_Date
                        var ID = val[0];
                        var IT_TAG = val[1];
                        var IT_TAG_GROUP = val[2];
                        var EmpNum = val[3];
                        var Fullname = val[4];
                        var IT_TAG_site = val[5];
                        var Assign_Name = val[6];
                        var Assign_Date = val[7];
                        var Checke5r = val[8];
                        var Check_Date = val[9];
                        $("#txtUser").val(Fullname);
                        $("#txtITTagGroup").val(IT_TAG_GROUP);
                        $("#txtEmpnum").val(EmpNum);
                        $("#txtITTag").val(IT_TAG);
                        $("#txtAssignName").val(Assign_Name);
                        $("#txtAssignDate").val(Assign_Date);
                        $("#txtCheckerName").val(Checke5r);
                        $("#txtCheckerDate").val(Check_Date);
                        //console.log(ID);
                        //console.log(IT_TAG);
                        //console.log(IT_TAG_GROUP);
                        //console.log(EmpNum);
                        //console.log(Fullname);
                        //console.log(IT_TAG_site);
                        //console.log(Assign_Name);
                        //console.log(Assign_Date);
                        //console.log(Checke5r);
                        //console.log(Check_Date);
                    });
                }
            }

            //-------------------- End DocumentReady


        });
        function StatusColor(Status) {
                if (Status == 'Normal') {
                    var txtStatus = '<span style="color:#4CAF50">' + Status + '</span>';
                } else if (Status == 'Warning') {
                    var txtStatus = '<span style="color:#FF9800">' + Status + '</span>';
                } else if (Status == 'Danger') {
                    var txtStatus = '<span style="color:red">' + Status + '</span>';
                }
                return (txtStatus);
            }




    </script>
</asp:Content>
