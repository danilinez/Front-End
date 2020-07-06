<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="MyFriends, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header">
                    <h2>
                        <i class="icon-search"></i>Search New Friends</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="form-horizontal">
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label" for="txtFindParents">
                                    Find Parents</label>
                                <div class="controls">
                                    <input id="txtFindParents" name="txtFindParents" type="text" placeholder="type Name/Email"
                                        class="validate[required] input-xlarge" onkeydown="fnFocusSearchFriend(event);" />
                                    <p class="help-block">
                                        find by name/email</p>
                                </div>
                            </div>
                            <!-- Button -->
                            <div class="control-group">
                                <label class="control-label" for="btnFindParents">
                                </label>
                                <div class="controls">
                                    <button id="btnFindParents" type="button" onclick="fnSearchFriends()" name="btnFindParents"
                                        class="btn btn-info">
                                        Search</button>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <!--/span-->
            <div class="row-fluid">
                <div class="box span12">
                    <div class="box-header" data-original-title>
                        <h2>
                            <i class="icon-user"></i><span class="break"></span>Your Friends</h2>
                        <div class="box-icon">
                            <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                                <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                                </i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <div id="divFSuccess" class="alert alert-success"></div>
                        <div id="divFError" class="alert alert-danger"></div>
                        <table class="table table-striped table-bordered bootstrap-datatable datatable" id="tblFriendsList">
                            <thead>
                                <tr>
                                    <th style="width: 50px">
                                    </th>
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        Status
                                    </th>
                                    <th>
                                        Calender
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--/span-->
            </div>
            <!--/row-->
            <!-- end: Content -->
        </div>
        <!--/fluid-row-->
    </div>
    <!--/.fluid-container-->
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            fnLoadFriends();
            $('#divFSuccess').hide();
            $('#divFError').hide();
        });

        function fnFocusSearchFriend(e) {
            if (e.keyCode == 13) {
                $("#btnFindParents").focus();
                $('#btnFindParents').click();
            }
        }

        function fnSearchFriends() {
            if ($("#form1").validationEngine('validate')) {
                window.location = "SearchResults.aspx?searchtxt=" + $("#txtFindParents").val() + "";
            }
        }

        function fnLoadFriends() {
            var params = new Object();
            params.sUserID = '<%= Session["UserID"] %>';
            $.ajax({
                type: "POST",
                url: "MyFriends.aspx/fnLoadFriendsList",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {

                        var obj = jQuery.parseJSON(msg.d);
                        try {
                            $('#tblFriendsList').dataTable().fnClearTable();
                            $('#tblFriendsList').dataTable().fnDestroy();
                        } catch (e) {
                        }

                        var aaData = [];

                        $.each(obj, function (index, value) {

                            var strProfilePic = "<img alt='" + value.sName + "' class='img-circle' style='width: 39px; height: 39px;margin-top: 3px;' src='assets/img/no-profile-pic.jpg' />";

                            if (value.sImage != '') {
                                strProfilePic = "<img alt='" + value.sName + "' class='img-circle' style='width: 39px; height: 39px;margin-top: 3px;' src='UploadFiles/" + value.sImage + "' />";
                            }

                            var sStatus = 'Accepted'; //1
                            var buttonState = 'success';
                            if (value.iFriendshipStatus == '3') {
                                sStatus = 'Pending';
                                buttonState = 'warning';
                            }

                            var strStatusButton = "<div class='btn-group'><a href='#' data-toggle='dropdown' class='btn btn-small btn-" + buttonState + "'>" + sStatus + "<span class='caret'></span></a><ul class='dropdown-menu'><li><a href='#' onclick=\"fnUpdateStatus('" + value.ID + "','" + value.iFriendshipStatus + "','1')\">Accept</a></li><li><a href='#' onclick=\"fnUpdateStatus('" + value.ID + "','" + value.iFriendshipStatus + "','4')\">Reject/Unfriend</a></li><li><a href='#' onclick=\"fnUpdateStatus('" + value.ID + "','" + value.iFriendshipStatus + "','2')\">Block</a></li></ul></div>";



                            aaData.push([
                   strProfilePic,
                        value.sName,
		strStatusButton,
        "<a href='FriendsCalender.aspx?frID=" + value.ID + "'><i class='icon-calendar'></i></a>"

        ]);
                        });
                        $(".dataTables_processing").attr('style', 'display:none');
                    }
                    else {
                        try {
                            $('#tblFriendsList').dataTable().fnClearTable();
                            $('#tblFriendsList').dataTable().fnDestroy();
                        } catch (e) {
                        }
                    }

                    $('#tblFriendsList').dataTable({
                        "aaData": aaData,
                        "bProcessing": true,
                        "bDeferRender": true
                    });
                    $(".dataTables_processing").attr('style', 'display:none');
                }
            });
        }

        function fnUpdateStatus(ID, existing, newStatus) {
            if (existing != newStatus) {
                var objFL = new Object();
                objFL.flID = ID;
                objFL.flStatus = existing;
                objFL.flNew = newStatus;

                $.ajax({
                    type: "POST",
                    url: "MyFriends.aspx/fnChangeStatus",
                    data: JSON.stringify(objFL),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.toString() == "Success") {
                            fnLoadFriends();
                            $('#divFSuccess').html('Your request has completed successfully.');
                            $('#divFSuccess').show();
                            setTimeout(function () { $('#divFSuccess').hide(); }, 5000);
                        }

                        else if (msg.d.toString() == "0") {
                            $('#divFError').html('Problem in executing your request, try again later.');
                            $('#divFError').show();
                            setTimeout(function () { $('#divFError').hide(); }, 5000);
                        }

                        else {
                            $('#divFError').html(msg.d.toString());
                            $('#divFError').show();
                            setTimeout(function () { $('#divFError').hide(); }, 5000);
                        }
                    }
                });
            }
        }
    </script>
</asp:Content>
