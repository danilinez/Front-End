<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="MyAppointments, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            fnLoad();
            $('#divFSuccess').hide();
            $('#divFError').hide();
        });

        function fnLoad() {
            fnLoadAppoitments();
            fnLoadRequests();
        }

        function fnLoadAppoitments() {
            var params = new Object();
            params.sUserID = '<%= Session["UserID"] %>';
            $.ajax({
                type: "POST",
                url: "MyAppointments.aspx/fnLoadAppointments",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {

                        var obj = jQuery.parseJSON(msg.d);

                        try {
                            $('#tblAppointmentList').dataTable().fnClearTable();
                            $('#tblAppointmentList').dataTable().fnDestroy();
                        }

                        catch (e) { }

                        var aaData = [];

                        for (var i = 0; i < obj.length; i++) {
                            var strStatusButton = "<div class='btn-toolbar'><div class='btn-group'><a class='btn btn-small btn-success'> Accepted </a>";
                            aaData.push([
                            (i + 1),
                            strStatusButton,
                            obj[i].Frnd,
                            obj[i].sFKid,
                            obj[i].sUKid,
                            obj[i].AppDate,
                            obj[i].Venue
                            ]);
                        }

                        $(".dataTables_processing").attr('style', 'display:none');
                    }

                    else {

                        try {
                            $('#tblAppointmentList').dataTable().fnClearTable();
                            $('#tblAppointmentList').dataTable().fnDestroy();
                        }

                        catch (e) { }
                    }

                    $('#tblAppointmentList').dataTable({
                        "aaData": aaData,
                        "bProcessing": true,
                        "bDeferRender": true
                    });

                    $(".dataTables_processing").attr('style', 'display:none');
                }
            });
        }

        function fnLoadRequests() {
            var params = new Object();
            params.sUserID = '<%= Session["UserID"] %>';
            $.ajax({
                type: "POST",
                url: "MyAppointments.aspx/fnLoadRequests",
                data: JSON.stringify(params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {

                        var obj = jQuery.parseJSON(msg.d);

                        try {
                            $('#tblRequests').dataTable().fnClearTable();
                            $('#tblRequests').dataTable().fnDestroy();
                        }

                        catch (e) { }

                        var aaData = [];

                        for (var i = 0; i < obj.length; i++) {
                            var strStatusButton = "<div class='btn-toolbar'><div class='btn-group'><a href='#' data-toggle='dropdown' class='btn btn-small btn-warning'> Pending <span class='caret'></span></a><ul class='dropdown-menu'><li><a href='#' onclick=\"fnUpdateStatus('" + obj[i].ID + "','1')\">Accept</a></li><li><a href='#' onclick=\"fnUpdateStatus('" + obj[i].ID + "','2')\"> Reject </a></li></ul></div></div>";
                            aaData.push([
                            (i + 1),
                            strStatusButton,
                            obj[i].Frnd,
                            obj[i].sFKid,
                            obj[i].sUKid,
                            obj[i].AppDate,
                            obj[i].Venue
                            ]);
                        }

                        $(".dataTables_processing").attr('style', 'display:none');
                    }

                    else {

                        try {
                            $('#tblRequests').dataTable().fnClearTable();
                            $('#tblRequests').dataTable().fnDestroy();
                        }

                        catch (e) { }
                    }

                    $('#tblRequests').dataTable({
                        "aaData": aaData,
                        "bProcessing": true,
                        "bDeferRender": true
                    });

                    $(".dataTables_processing").attr('style', 'display:none');
                }
            });
        }

        function fnUpdateStatus(ID, newStatus) {
            var objApp = new Object();
            objApp.AppID = ID;
            objApp.AppNew = newStatus;

            $.ajax({
                type: "POST",
                url: "MyAppointments.aspx/fnChangeStatus",
                data: JSON.stringify(objApp),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.toString() == "SUCCESS") {
                        fnLoad();
                        $('#divFSuccess').html('Your request has completed successfully.');
                        $('#divFSuccess').show();
                        setTimeout(function () { $('#divFSuccess').hide(); }, 5000);
                    }

                    else if (msg.d.toString() == "0") {
                        $('#divFError').html('Problem in executing your request, try again later.');
                        $('#divFError').show();
                        setTimeout(function () { $('#divFError').hide(); }, 5000);
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header" data-original-title>
                    <h2>
                        <i class="icon-user"></i><span class="break"></span>Your Requests</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="divFSuccess" class="alert alert-success"></div>
                    <div id="divFError" class="alert alert-danger"></div>
                    <table class="table table-striped table-bordered bootstrap-datatable datatable" id="tblRequests">
                        <thead>
                            <tr>
                                <th style="width:50px;">
                                    Sr. #
                                </th>
                                <th style="width:60px;">
                                    Status
                                </th>
                                <th>
                                    Friend
                                </th>
                                <th>
                                    Friend's Kid
                                </th>
                                <th>
                                    Your Kid
                                </th>
                                <th style="width:160px;">
                                    Date
                                </th>
                                <th>
                                    Venue
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row-fluid">            
            <div class="box span12">
                <div class="box-header" data-original-title>
                    <h2>
                        <i class="icon-user"></i><span class="break"></span>Your Appointments</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                    </div>
                </div>
                <div class="box-content">
                    <table class="table table-striped table-bordered bootstrap-datatable datatable" id="tblAppointmentList">
                        <thead>
                            <tr>
                                <th style="width:50px;">
                                    Sr. #
                                </th>
                                <th style="width:60px;">
                                    Status
                                </th>
                                <th>
                                    Friend
                                </th>
                                <th>
                                    Friend's Kid
                                </th>
                                <th>
                                    Your Kid
                                </th>
                                <th style="width:160px;">
                                    Date
                                </th>
                                <th>
                                    Venue
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

