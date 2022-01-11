<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PMOnline.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .section {
            margin-top: 50px;
        }

        .border {
            border: 2px solid #2e6da4;
            padding: 10px;
            border-radius: 10px;
        }

        .center {
            text-align: center;
        }

        .max-wide {
            max-width: 100%;
        }

        .col-centered {
            float: none;
            margin: 0 auto;
        }

        .no-padding {
            padding: 0 !important;
            margin: 0 !important;
        }

        .row-no-padding > [class*="col-"] {
            padding-left: 1.8px !important;
            padding-right: 1.8px !important;
        }

        @media(max-width:767px) {
            body {
                padding-top: 0px;
            }
        }
    </style>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Sign in</title>
    </head>
    <body>
        <form class="form1">
            <div class=" center">
                <h1>PM Online</h1>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 center">
                        <img src="./Images/logo.gif" alt="logo" style="width: 100%; height: 140px; max-width: 140px; padding: 20px; margin-top: -17px">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="col-md-4 col-sm-0 col-xs-0">
                        </div>
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>Emp Num/รหัสพนักงาน </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                                <input type="text" class="form-control "   style="max-width: 100%;" id="username" />
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-0 col-xs-0">
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 20px;">
                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                        <div class="col-md-4 col-sm-0 col-xs-0">
                        </div>
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>Pass/รหัสผ่าน </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12 row-no-padding ">
                                <div class="col-md-2 col-sm-2 col-xs-2 ">
                                    <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="1" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 ">
                                    <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="2" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 ">
                                    <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="3" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 ">
                                    <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="4" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 ">
                                    <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="5" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 ">
                                    <input type="password" class="form-control nextInputs" autocomplete="off"  maxlength="1" name="6" />
                                </div>

                            </div>
                        </div>

                        <div class="col-md-4 col-sm-0 col-xs-0">
                        </div>
                    </div>
                </div>
                <div class="center" style="padding-top: 20px;">
                    <button type="button" class="btn btn-info btn-block" id="signin" style="max-width: 220px; margin: auto">Login / เข้าสู่ระบบ</button>
                    <div style="text-align: center; padding-top: 1rem;">
                     <%--   <a href="./Resetpassword.aspx">
                            <p>Reset Password / เปลี่ยนรหัสผ่าน</p>
                        </a>--%>
                    </div>
                </div>
            </div>
        </form>

    </body>

    </html>

    <script type="text/javascript">
        $(document).ready(function () {
              $("#username").inputFilter(function(value) {
                  return /^\d*$/.test(value);    // Allow digits only, using a RegExp
            });

            var GetUserSession = sessionStorage.getItem("username");
            if (GetUserSession) {
                window.location.href ="http://localhost:52589/PMMoniter.aspx?Username=" + GetUserSession;
                //console.log(GetUserSession);
            }
            $("#Titlename").text('Login');
            $("input:password").focus(function () { $(this).select(); });
            $("#navBar").css("display", "none");
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
            });

            $("#username").on("keyup", function () {
                var username = $(this).val();
                if (username.length >= 5) {
                    $("input.nextInputs[name='1']").focus();
                    $(".nextInputs").val("");
                }
            });

            $("#signin").on("click", function () {
                var username = $("#username").val();
                var pass = '';
                var check = 0;
                $(".nextInputs").each(function () {
                    if ($(this).val() == '') {
                        check += 1;
                    } else {
                        pass = pass + '' + $(this).val();
                    }
                })
                if (check > 0 || username == '') {
                    //alert("Please fill a username/password!");
                    swal("Please fill a username/password!", "", "error");
                } else {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("Default.aspx/Signin") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            username: username,
                            password: pass
                        }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                var user = response.d[0][0];
                                sessionStorage.setItem("username", user);
                                window.location.href = "./PMMoniter.aspx?Username=" + encodeURIComponent(user);
                            } else {
                                alert("Incorrect username/password!");
                                //swal("Incorrect username/password!", "Please check your input", "error");
                            }
                        }
                    });
                }

            });

        });
(function($) {
  $.fn.inputFilter = function(inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
      if (inputFilter(this.value)) {
        this.oldValue = this.value;
        this.oldSelectionStart = this.selectionStart;
        this.oldSelectionEnd = this.selectionEnd;
      } else if (this.hasOwnProperty("oldValue")) {
        this.value = this.oldValue;
        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
      } else {
        this.value = "";
      }
    });
  };
}(jQuery));
    </script>
</asp:Content>
