<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="FriendsCalender, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            fnLoadKids();
            fnLoadEvents();

            });

        function fnLoadKids()
        {
            var param = new Object();
            param.sUserID = ''+<%= Session["UserID"] %>+'';
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(param),
                url: "KidsSchedule.aspx/fnLoadKids",
                dataType: "json",
                success: function (msg) {
                    if(msg.d.length>0){
                        if (msg.d != "-1") {
                            var obj = jQuery.parseJSON(msg.d);
                            $("#ddlKids").empty();
                            $.each(obj,function(index,value){                        
                            $("#ddlKids").append('<option value="' + value.iKidID + '">' + value.sKidName + '</option>');
                            });                          
                        }
                        else {
                            $("#ddlKids").empty();
                        }                       
                    }
                    else {
                       $("#ddlKids").empty();
                    }
                }
            });
        }

         function fnLoadEvents() {
            var param = new Object();
            param.sUserID = ''+<%= Session["UserID"] %>+'';
            param.iFriendID = qs("frID");
            return  $.ajax({
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(param),
                url: "FriendsCalender.aspx/fnLoadEventsFriendsSchedule",
                dataType: "json",
                success: function (msg) {
                    try {
                        $('#calKidsSchedule').fullCalendar('destroy');
                    } catch (e) {

                    }
                    var obj = jQuery.parseJSON(msg.d);
                    $('#calKidsSchedule').fullCalendar({
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
                            if(item.sAppointmentStatus!='')
                            event.title = item.sAppointmentStatus;
                            else
                            event.title = item.EventName;

                            event.editable = false;

                            event.backgroundColor = item.sColor;
                            event.borderColor = '#000';
                            return event;
                        }),
                        eventClick: function (event, element) {
                            if (event.backgroundColor == '#1796b0') {

                                $("#hfScheduleID").val(event.id);
                                var param = new Object();
                                param.sSchID = $("#hfScheduleID").val();

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json",
                                    data: JSON.stringify(param),
                                    url: "FriendsCalender.aspx/fnLoadScheduleInfo",
                                    dataType: "json",
                                    success: function (msg) {
                                        if (msg.d.length > 0) {
                                            var obj = jQuery.parseJSON(msg.d);

                                            $.each(obj, function (index, value) {
                                                lblKidName,lblScheduleInfo,
                                                $("#lblKidName").text(value.sKidName);
                                                $("#lblScheduleInfo").text('From '+value.dtSchStartDatetime+' to '+value.dtSchEndDatetime);
                                               
                                            });                                           
                                            
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
        
        function fnScheduleMeeting()
        {
            if($("#form1").validationEngine('validate'))
            {
                var objparam = new Object();
                objparam.iSchID = $("#hfScheduleID").val();
                objparam.iKidID = $("#ddlKids option:selected").val();
                objparam.sVenue = $("#txtVenue").val();
                $.ajax({
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(objparam),
                url: "FriendsCalender.aspx/fnScheduleMeeting",
                dataType: "json",
                success: function (msg) {
                    
                        if (msg.d != "0") {
                            fnLoadEvents();
                            $("#btnClosePOPUP").click();   
                        }
                                             
                   
                }
            });
            }
        }

        function qs(key) {
             key = key.replace(/[*+?^$.\[\]{}()|\\\/]/g, "\\$&"); // escape RegEx control chars
             var match = location.search.match(new RegExp("[?&]" + key + "=([^&]+)(&|$)"));
             return match && decodeURIComponent(match[1].replace(/\+/g, " "));
         }
    </script>
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header" data-original-title>
                    <asp:HiddenField ID="hfScheduleID" ClientIDMode="Static" runat="server" />
                    <h2>
                        <i class="icon-calendar"></i><span class="break"></span>My Kids Schedule</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-plus" onclick="fnAddNewSchedule()"><i class="icon-plus"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="calKidsSchedule" class="span9">
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
                <span id="lblMode">Request to Schedule Meeting</span></h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" id="lblScheduleOf">
                            Kid Name:</label>
                        <div class="controls">
                            <span id="lblKidName">.</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" id="Label1">
                            Schedule Date/Time:</label>
                        <div class="controls">
                            <span id="lblScheduleInfo">.</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtTitle">
                            Select Your Kid:</label>
                        <div class="controls">
                            <select id="ddlKids" class="validate[required]">
                            </select>
                        </div>
                    </div>
                     <div class="control-group">
                        <label class="control-label" for="txtTitle">
                            Venue:</label>
                        <div class="controls">
                            <input id="txtVenue" class="validate[required]" type="text" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal" id="btnClosePOPUP">Close</a> <a href="#"
                class="btn btn-primary" onclick="fnScheduleMeeting();">Schedule Meeting</a>
        </div>
    </div>
</asp:Content>
