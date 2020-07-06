<%@ page title="" language="C#" masterpagefile="~/ControlPanel/Admin.master" autoeventwireup="true" inherits="ControlPanel_EventsCalender, App_Web_jx024tsd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();

            fnLoadEvents();

            $('#datetimepicker1').datetimepicker({
                language: 'pt-BR'
            });
            $('#datetimepicker2').datetimepicker({
                language: 'pt-BR'
            });
        });

        function fnDeleteEvent() {
            var param = new Object();
            param.iEventID = $("#hfEventID").val();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(param),
                url: "EventsCalender.aspx/fnDeleteEvent",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == "1") {
                        fnLoadEvents();
                        $("#btnClosePOPUP").click();
                    }
                    else {
                        alert("Problem in deleting Event.");
                    }
                }
            });
        }

        function fnAddNewEvent() {
            $("#lblMode").text('Add New Event');
            $("#hfEventID").val('');
            $("#btnDeleteEvent").attr("style", "display:none");
            $("#btnAddEvent").click();
        }

        function fnSaveEvent() {
            if ($("#form1").validationEngine('validate')) {

                var param = new Object();
                param.iEventID = $("#hfEventID").val();
                param.sTitle = $("#txtTitle").val();
                param.sEventDate = $("#txtEventDateTime").val();
                param.sEventEndDate = $("#txtEventEndDateTime").val();
                param.sDescription = $("#txtDescription").val();
                param.sVenue = $("#txtVenue").val();
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(param),
                    url: "EventsCalender.aspx/fnSaveEvent",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == "-1") {
                            alert("Problem in Adding Event");
                        }
                        else if (msg.d == "-2") {
                            alert("Wrong Date: End Date can not be less than start date");
                        }
                        else {
                            fnLoadEvents();
                            $("#btnClosePOPUP").click();
                        }

                    }
                });
            }
        }

        function fnLoadEvents() {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: "{}",
                url: "EventsCalender.aspx/fnLoadAllScheulesAndEvents",
                dataType: "json",
                success: function (msg) {
                    try {
                        $('#calEventsCalender').fullCalendar('destroy');
                    } catch (e) {

                    }
                    var obj = jQuery.parseJSON(msg.d);
                    $('#calEventsCalender').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,agendaWeek,agendaDay'
                        },
                        editable: false,
                        events: $.map(obj, function (item, i) {
                            var event = new Object();
                            event.id = item.EventID;
                            event.allDay = false;
                            event.start = new Date(item.StartDate);
                            event.end = new Date(item.EndDate);
                            event.title = item.EventName;
//                            if (item.sType == 'event')
                            //                                event.editable = true;
                            event.editable = false;
                            event.backgroundColor = item.sColor;
                            event.borderColor = '#000';
                            return event;
                        }),
                        eventClick: function (event, element) {
                            if (event.backgroundColor == '#76b007') {

                                $("#hfEventID").val(event.id);
                                var param = new Object();
                                param.iEventID = $("#hfEventID").val();

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json",
                                    data: JSON.stringify(param),
                                    url: "EventsCalender.aspx/fnEditEvent",
                                    dataType: "json",
                                    success: function (msg) {
                                        if (msg.d.length > 0) {
                                            var obj = jQuery.parseJSON(msg.d);

                                            $.each(obj, function (index, value) {
                                                $("#txtTitle").val(value.sEventTitle);
                                                $("#txtEventDateTime").val(value.dtEventStartDate);
                                                $("#txtEventEndDateTime").val(value.dtEventEndDate);
                                                $("#txtDescription").val(value.sDescription);
                                                $("#txtVenue").val(value.sEventPlace);
                                            });
                                            $("#lblMode").text('Edit Event');
                                            $("#btnDeleteEvent").attr("style", "display:inline-block");
                                            $("#btnAddEvent").click();
                                        }
                                    }
                                });

                            }
                        }
                    });

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    debugger;
                }
            });
        }

        function fnResetForm() {

            $("#txtTitle").val('');
            $("#txtEventDateTime").val('');
            $("#txtEventEndDateTime").val('');            
            $("#txtDescription").val('');
            $("#txtVenue").val('');
        }

    </script>
    <!-- start: Header -->
    <div id="sidebar-left" class="span2">
        <div class="row-fluid actions">
            <input type="text" class="search span12" placeholder="Search">
        </div>
        <div class="nav-collapse sidebar-nav">
            <ul class="nav nav-tabs nav-stacked main-menu">
                <li><a href="EventsCalender.aspx"><i class="icon-calendar"></i><span class="hidden-tablet">
                    Calendar</span></a></li>
                <li><a href="UsersManagement.aspx"><i class="icon-user"></i><span class="hidden-tablet">
                    Users</span></a></li>
                <%-- <li><a href="messages.html"><i class="icon-dashboard"></i><span class="hidden-tablet">
                    Messages</span></a></li>
                <li><a href="settings.html"><i class="icon-edit"></i><span class="hidden-tablet">Settings</span></a></li>
                --%>
                <li><a href="SendInvites.aspx"><i class="icon-align-justify"></i><span class="hidden-tablet">
                    Invite</span></a></li>
            </ul>
        </div>
    </div>
    <!-- end: Main Menu -->
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header" data-original-title>
                    <asp:HiddenField ID="hfEventID" ClientIDMode="Static" runat="server" />
                    <h2>
                        <i class="icon-calendar"></i><span class="break"></span>Calendar</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-plus" onclick="fnAddNewEvent()"><i class="icon-plus"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="calEventsCalender" class="span9">
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <!--/row-->
    </div>
    <!-- end: Content -->
    <button type="button" data-toggle="modal" id="btnAddEvent" data-target="#mdlEvents"
        data-backdrop="static" data-keyboard="false" style="display: none;">
        Add User</button>
    <div class="modal hide fade" id="mdlEvents">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                ×</button>
            <h3>
                <span id="lblMode">Add New Event</span></h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="txtTitle">
                            Title</label>
                        <div class="controls">
                            <input type="text" id="txtTitle" class="validate[required]" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="datetimepicker1">
                            Start Date/Time
                        </label>
                        <div class="controls">
                            <div id="datetimepicker1" class="input-append date">
                                <input data-format="dd/MM/yyyy hh:mm:ss" type="text" id="txtEventDateTime" class="validate[required]"></input>
                                <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="datetimepicker2">
                            End Date/Time
                        </label>
                        <div class="controls">
                            <div id="datetimepicker2" class="input-append date">
                                <input data-format="dd/MM/yyyy hh:mm:ss" type="text" id="txtEventEndDateTime" class="validate[required]"></input>
                                <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtDescription">
                            Description</label>
                        <div class="controls">
                            <input type="text" id="txtDescription" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtVenue">
                            Venue</label>
                        <div class="controls">
                            <input type="text" id="txtVenue" placeholder="Venue" class="validate[required]" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="modal-footer"><a href="#" class="btn btn-danger" id="btnDeleteEvent" onclick="fnDeleteEvent();">Drop</a>
            <a href="#" class="btn" data-dismiss="modal" onclick='fnResetForm();' id="btnClosePOPUP">
                Close</a> <a href="#" class="btn btn-primary" onclick="fnSaveEvent();">Save</a>
        </div>
    </div>
</asp:Content>
