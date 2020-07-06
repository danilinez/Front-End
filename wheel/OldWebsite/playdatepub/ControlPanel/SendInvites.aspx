<%@ page title="" language="C#" masterpagefile="~/ControlPanel/Admin.master" autoeventwireup="true" inherits="ControlPanel_SendInvites, App_Web_jx024tsd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            $(".tm-input").tagsManager({
                validator: true
            });

            $('textarea#txtMessageBody').ckeditor({ width: '500px', height: '200px', toolbar: [
            { name: 'document', items: ['Source'] },
	        { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] }, { name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
	        { name: 'insert', items: ['Image', 'Table', 'HorizontalRule'] },
	        { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv',
	        '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
	        },
	         '/',

	        { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },
	        { name: 'colors', items: ['TextColor', 'BGColor'] },
	        { name: 'tools', items: ['Maximize'] }
            ]
            });

        });

        function fnSendInvitation() {
            var param = new Object();
            param.sEmails = $('[name="hidden-tags"]').val();
            param.sSubject = $('#txtSubject').val();
            param.sEmailBody = $('textarea#txtMessageBody').val();

//            $('#txtEmailBody').ckeditor(function (textarea) {
//              param.sEmailBody = $(textarea).val();
//            });


            $.ajax({
                type: "POST",
                url: "SendInvites.aspx/fnSendInvitations",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == "1") {
                        alert("Invitation Sent Successfully");
                    }
                    else {
                        alert("Sending Email not set or problem in sending email");
                    }
                }
            });
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
                <li><a href="SendInvites.aspx"><i class="icon-align-justify"></i><span class="hidden-tablet">
                    Invite</span></a></li>
            </ul>
        </div>
    </div>
    <!-- end: Main Menu -->
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header">
                    <h2>
                        <i class="icon-mail-forward"></i>Send Invitation</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                    </div>
                </div>
                <div class="box-content">
                    <form class="form-horizontal">
                    <fieldset>
                        <div class="control-group">
                            <asp:HiddenField ID="hfEmailsList" ClientIDMode="Static" runat="server" />
                            <label class="control-label" for="typeahead">
                                Emails
                            </label>
                            <div class="controls">
                                <input type="text" name="tags" placeholder="Tags" class="validate[custom[email]] tm-input tm-input-small" />
                                <p class="help-block">
                                    Start typing to add multiple email addresses comma separated</p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">
                                Subject
                            </label>
                            <div class="controls">
                                <input type="text" name="tags" id="txtSubject" style="width: 300px" placeholder="Tags"
                                    class="validate[required]" />
                            </div>
                        </div>
                        <div class="control-group hidden-phone">
                            <label class="control-label" for="textarea2">
                                Message</label>
                            <div class="controls">
                                <textarea id="txtMessageBody" cols="20" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-primary" onclick="fnSendInvitation()">
                                Send Inivtation</button>
                            <button type="reset" class="btn">
                                Cancel</button>
                        </div>
                    </fieldset>
                    </form>
                </div>
            </div>
            <!--/span-->
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
                            <input type="text" id="txtTitle" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="datetimepicker1">
                            Event Date/Time
                        </label>
                        <div class="controls">
                            <div id="datetimepicker1" class="input-append date">
                                <input data-format="dd/MM/yyyy hh:mm:ss" type="text" id="txtEventDateTime"></input>
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
                            <input type="text" id="txtVenue" placeholder="Venue" />
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
</asp:Content>
