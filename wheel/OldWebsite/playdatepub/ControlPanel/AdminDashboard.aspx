<%@ page title="" language="C#" masterpagefile="~/ControlPanel/Admin.master" autoeventwireup="true" inherits="ControlPanel_AdminDashboard, App_Web_jx024tsd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                <%--  <li><a href="messages.html"><i class="icon-dashboard"></i><span class="hidden-tablet">
                    Messages</span></a></li>
                <li><a href="settings.html"><i class="icon-edit"></i><span class="hidden-tablet">Settings</span></a></li>--%>
                <li><a href="SendInvites.aspx"><i class="icon-align-justify"></i><span class="hidden-tablet">
                    Invite</span></a></li>
            </ul>
        </div>
    </div>
    <!-- end: Main Menu -->
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid">
        </div>
        <div class="row-fluid">
            <div class="span7" ontablet="span12" ondesktop="span7">
                <asp:HiddenField ID="hfEventID" ClientIDMode="Static" runat="server" />
                <div class="row-fluid">
                    <div class="box calendar span12">
                        <div class="calendar-details">
                            <div class="day">
                                Coming</div>
                            <div class="date">
                                Events</div>
                            <ul class="events">
                                <%--  <li>MAY 22, 19:30 Meeting</li>
                                <li>MAY 22, 19:30 Meeting</li>--%>
                            </ul>
                            <div class="add-event">
                                <a href="#" onclick="fnAddNewEvent();"><i class="icon-plus"></i></a>
                            </div>
                        </div>
                        <div class="calendar-small">
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <!--/span-->
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="box span7 noMargin" ontablet="span12" ondesktop="span7">
                <div class="box-header">
                    <h2>
                        <i class="icon-check"></i>Tasks</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="todo">
                        <ul class="todo-list">
                            <li><span class="todo-actions"><a href="#"><i class="icon-check-empty"></i></a></span>
                                <span class="desc">Confirm playdate with Dylan </span><span class="label label-important">
                                    today</span> </li>
                            <li><span class="todo-actions"><a href="#"><i class="icon-check-empty"></i></a></span>
                                <span class="desc">Confirm Friend</span> <span class="label label-important">today</span>
                            </li>
                            <li><span class="todo-actions"><a href="#"><i class="icon-check-empty"></i></a></span>
                                <span class="desc">Confirm playdate with Bob</span> <span class="label label-warning">
                                    tommorow</span> </li>
                            <li><span class="todo-actions"><a href="#"><i class="icon-check-empty"></i></a></span>
                                <span class="desc">Confirm Friend</span> <span class="label label-warning">tommorow</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- end: Content -->
    </div>
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
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal" onclick='fnResetForm();' id="btnClosePOPUP">
                Close</a> <a href="#" class="btn btn-primary" onclick="fnSaveEvent();">Save</a>
        </div>
    </div>
    <script language="javascript">

        $(document).ready(function () {
            $("#form1").validationEngine();

            fnLoadEvents();

            $('#datetimepicker1').datetimepicker({
                language: 'pt-BR'
            });
            $('#datetimepicker2').datetimepicker({
                language: 'pt-BR'
            });
            fnLoadEvents();
        });

        function fnAddNewEvent() {
            fnResetForm();
            $("#lblMode").text('Add New Event');
            $("#hfEventID").val('');
            $("#btnAddEvent").click();
        }
        function fnResetForm() {

            $("#txtTitle").val('');
            $("#txtEventDateTime").val('');
            $("#txtEventEndDateTime").val('');
            $("#txtDescription").val('');
            $("#txtVenue").val('');
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
                        $('.calendar-small').fullCalendar('destroy');
                    } catch (e) {

                    }
                    var obj = jQuery.parseJSON(msg.d);
                    $('.calendar-small').fullCalendar({
                        header: {
                            right: 'title',
                            left: 'prev,next,today'
                        },
                        defaultView: 'month',
                        editable: true,

                        events: $.map(obj, function (item, i) {
                            var event = new Object();
                            event.id = item.EventID;

                            if (item.sAllDay == '1')
                                event.allDay = true;
                            else
                                event.allDay = false;

                            event.start = item.StartDate;
                            event.end = item.EndDate;
                            event.title = item.EventName;
                            event.editable = false;
                            event.backgroundColor = item.sColor;
                            event.borderColor = '#000';
                            return event;
                        }),
                        dayClick: function (date, allDay, jsEvent, view) {

                            $('.calendar-details > .events').html('');

                            var weekday = new Array(7);
                            weekday[0] = "Sunday";
                            weekday[1] = "Monday";
                            weekday[2] = "Tuesday";
                            weekday[3] = "Wednesday";
                            weekday[4] = "Thursday";
                            weekday[5] = "Friday";
                            weekday[6] = "Saturday";

                            var month = new Array();
                            month[0] = "January";
                            month[1] = "February";
                            month[2] = "March";
                            month[3] = "April";
                            month[4] = "May";
                            month[5] = "June";
                            month[6] = "July";
                            month[7] = "August";
                            month[8] = "September";
                            month[9] = "October";
                            month[10] = "November";
                            month[11] = "December";

                            var date2 = new Date(date.getFullYear(), date.getMonth(), date.getDate() + 1);
                            var todaysEvents = $('.calendar-small').fullCalendar('clientEvents', function (event) {

                                function pad(n) { return n < 10 ? '0' + n : n }

                                if (event.start >= date && event.start < date2) {

                                    var title = event.title;
                                    var start = event.start;
                                    var end = event.end;

                                    $('.calendar-details > .day').html(weekday[date.getDay()]);
                                    $('.calendar-details > .date').html(month[date.getMonth()] + ' ' + date.getDate());

                                    if (event.allDay) {

                                        $('.calendar-details > .events').append(
							'<li>'
							+ title
							+ ' - all day'
							+ '</li>');

                                    } else {

                                        $('.calendar-details > .events').append(
                                        '<li>'
                                        + title
                                        + ' - '
                                        + start.getHours()
                                        + ':'
                                        + pad(start.getMinutes())
                                        + ' - '
                                        + end.getHours()
                                        + ':'
                                        + pad(end.getMinutes())
                                        + '</li>');

                                    }

                                } else if (date >= event.start && date <= event.end) {

                                    var title = event.title;
                                    var start = event.start;
                                    var end = event.end;

                                    $('.calendar-details > .day').html(weekday[date.getDay()]);
                                    $('.calendar-details > .date').html(month[date.getMonth()] + ' ' + date.getDate());
                                    $('.calendar-details > .events').append(
						'<li>'
						+ title
						+ ' - '
						+ month[start.getMonth()] + ' ' + start.getDate()
						+ ' '
						+ start.getHours()
						+ ':'
						+ pad(start.getMinutes())
						+ ' - '
						+ month[end.getMonth()] + ' ' + end.getDate()
						+ ' '
						+ end.getHours()
						+ ':'
						+ pad(end.getMinutes())
						+ '</li>');

                                } else {

                                    $('.calendar-details > .day').html(weekday[date.getDay()]);
                                    $('.calendar-details > .date').html(month[date.getMonth()] + ' ' + date.getDate());

                                }

                            });

                            //count li elements

                            if ($('.calendar-details ul li').length == 0) {
                                $('.calendar-details > .events').html('<li>no events :)</li>');
                            }

                        }

                    });

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    debugger;
                }
            });


        }
    </script>
</asp:Content>
