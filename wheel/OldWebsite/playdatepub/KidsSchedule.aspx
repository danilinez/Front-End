<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true"
    CodeFile="KidsSchedule.aspx.cs" Inherits="KidsSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            fnLoadKids();
            fnLoadEvents();

            $('#datetimepicker1').datetimepicker({
                language: 'pt-BR'
            
            });
            $('#datetimepicker2').datetimepicker({
                language: 'pt-BR'
            });
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

        function fnDeleteSchedule() {
            var param = new Object();
            param.iScheduleID = $("#hfScheduleID").val();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(param),
                url: "KidsSchedule.aspx/fnDeleteSchedule",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == "1") {
                        fnLoadEvents();
                        $("#btnClosePOPUP").click();
                    }
                    else {
                        alert("Problem in deleting Schedule.");
                    }
                }
            });
        }

        function fnAddNewSchedule() {
            $("#lblMode").text('Add New Schedule');
            $("#hfScheduleID").val('');
            $("#btnDeleteEvent").attr("style", "display:none");
            $("#btnAddEvent").click();
        }

        function fnSaveSchedule() {
            if ($("#form1").validationEngine('validate')) {

                var param = new Object();
                param.sUserID = ''+<%= Session["UserID"] %>+'';                     
                param.iScheduleID = $("#hfScheduleID").val();
                param.sKidID = $("#ddlKids option:selected").val();
                param.sStartDate = $("#txtSchStartDateTime").val();
                param.sEndDate = $("#txtSchEndDateTime").val();
                 if($('#chkbActive')[0].checked)
                        param.sStatus = "1"; 
                    else
                        param.sStatus = "0"; 

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(param),
                    url: "KidsSchedule.aspx/fnSaveSchedule",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == "-1") {
                            alert("Problem in Adding Event");
                        }
                        else if (msg.d == "-2") {
                            alert("Wrong Date: End Date can not be less or same as start date");
                        }
                        else {
                            $.when(fnLoadEvents()).done(function(){
                             $("#btnClosePOPUP").click();
                            });
                           
                        }

                    }
                });
            }
        }

        function fnLoadEvents() {
            var param = new Object();
            param.sUserID = ''+<%= Session["UserID"] %>+'';

            return  $.ajax({
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(param),
                url: "KidsSchedule.aspx/fnLoadAllScheulesAndEvents",
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


//                            if (item.sType == 'sch')
//                                event.editable = true;

                            event.editable = false;
                            event.backgroundColor = item.sColor;
                            event.borderColor = '#000';
                            return event;
                        }),
                        eventClick: function (event, element) {
                            if (event.backgroundColor == '#1796b0' || event.backgroundColor == '#d5d5d8') {

                                $("#hfScheduleID").val(event.id);
                                var param = new Object();
                                param.sSchID = $("#hfScheduleID").val();

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json",
                                    data: JSON.stringify(param),
                                    url: "KidsSchedule.aspx/fnEditEvent",
                                    dataType: "json",
                                    success: function (msg) {
                                        if (msg.d.length > 0) {
                                            var obj = jQuery.parseJSON(msg.d);

                                            $.each(obj, function (index, value) {
                                                
                                                $("#ddlKids").val(value.iKidID);
                                                $("#txtSchStartDateTime").val(value.dtSchStartDate);
                                                $("#txtSchEndDateTime").val(value.dtSchEndDate);
                                                
                                                if(value.btActive)
                                                {
                                                $('#chkbActive').prop('checked',value.btActive);
                                                }
                                                else
                                                {
                                                $('#chkbActive').prop('checked',value.btActive);
                                                }

                                            });
                                            $("#lblMode").text('Edit Schedule');
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
            $("#txtSchStartDateTime").val('');
            $("#txtSchEndDateTime").val('');            
            
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
                <span id="lblMode">Add New Schedule</span></h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="txtTitle">
                            Kids</label>
                        <div class="controls">
                            <select id="ddlKids" class="validate[required]">
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="datetimepicker1">
                            Start Date/Time
                        </label>
                        <div class="controls">
                            <div id="datetimepicker1" class="input-append date">
                                <input data-format="dd/MM/yyyy hh:mm:ss" type="text" id="txtSchStartDateTime" class="validate[required]"></input>
                                <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="datetimepicker2">
                            End Time
                        </label>
                        <div class="controls">
                            <div id="datetimepicker2" class="input-append date">
                                <input data-format="dd/MM/yyyy hh:mm:ss" type="text" id="txtSchEndDateTime" class="validate[required]"></input>
                                <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtDescription">
                            Active</label>
                        <div class="controls">
                            <input id="chkbActive" name="chkbActive" type="checkbox" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-danger" id="btnDeleteEvent" onclick="fnDeleteSchedule();">
                Drop</a> <a href="#" class="btn" data-dismiss="modal" onclick='fnResetForm();' id="btnClosePOPUP">
                    Close</a> <a href="#" class="btn btn-primary" onclick="fnSaveSchedule();">Save</a>
        </div>
    </div>
</asp:Content>
