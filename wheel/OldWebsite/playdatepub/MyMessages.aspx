<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="MyMessages, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            fnLoadMessages();
            fnLoadFriendsList();
            $('#divMError').hide();
            $('#divMSuccess').hide();
        });

        function fnLoadMessages() {
            fnLoadInbox();
            fnLoadSentItems();        
        }

        function fnLoadFriendsList() {
            $.ajax({
                type: "POST",
                url: "MyMessages.aspx/fnLoadFriends",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.toString() != "0") {
                        var obj = jQuery.parseJSON(msg.d);
                        var htmlFL = '<option value=""> Select a Friend </option>';

                        if (obj.length > 0) {

                            for (var i = 0; i < obj.length; i++) {
                                htmlFL += '<option value="' + obj[i].ID + '"> ' + obj[i].sName + ' </option>';
                            }
                        }
                        
                        $('#ddlFriends').html(htmlFL);
                    }
                }
            });
        }

        function fnLoadInbox() {
            $.ajax({
                type: "POST",
                url: "MyMessages.aspx/fnLoadInbox",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.toString() != "0") {
                        var obj = jQuery.parseJSON(msg.d);
                        if (obj.length > 0) {
                            var htmlMsg = '';

                            for (var i = 0; i < obj.length; i++) {
                                htmlMsg += '<li onclick="fnViewMsg(\'' + obj[i].ID + '\',\'Rec\');"><span class="from"> ' + (i + 1) + '. ' + obj[i].sFrom + ' </span><span class="title">';

                                if (obj[i].btIsRead) {
                                    htmlMsg += ' <span class="label label-success"> Read </span> ';
                                }

                                else {
                                    htmlMsg += ' <span class="label label-warning"> Unread </span> ';
                                }

                                htmlMsg += obj[i].sSubject + '</span><span class="date"> ' + obj[i].sDate + ' </span></li>';
                            }

                            $('#ulInbox').html(htmlMsg);
                        }

                        else { $('#ulInbox').html('<li>There is currently no message in your inbox</li>'); }
                    }
                }
            });
        }

        function fnLoadSentItems() {
            $.ajax({
                type: "POST",
                url: "MyMessages.aspx/fnLoadSentitems",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.toString() != "0") {
                        var obj = jQuery.parseJSON(msg.d);
                        if (obj.length > 0) {
                            var htmlMsg = '';

                            for (var i = 0; i < obj.length; i++) {
                                htmlMsg += '<li onclick="fnViewMsg(\'' + obj[i].ID + '\',\'Sen\');"><span class="from"> ' + (i + 1) + '. ' + obj[i].sTo + ' </span><span class="title">';

                                if (obj[i].btIsRead) {
                                    htmlMsg += ' <span class="label label-success"> Read </span> ';
                                }

                                else {
                                    htmlMsg += ' <span class="label label-warning"> Unread </span> ';
                                }

                                htmlMsg += obj[i].sSubject + '</span><span class="date"> ' + obj[i].sDate + ' </span></li>';
                            }

                            $('#ulSentItems').html(htmlMsg);
                        }

                        else { $('#ulSentItems').html('<li>There is currently no message in your sent items</li>'); }
                    }
                }
            });
        }

        function fnViewMsg(iID, type) {
            $.ajax({
                type: "POST",
                url: "MyMessages.aspx/fnLoadMessage",
                data: "{'iMessageID':'" + iID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.toString() != "0") {
                        var obj = jQuery.parseJSON(msg.d);
                        if (obj.length > 0) {

                            $('#hfID').val(obj[0].ID);

                            $('#lblSubject').text(obj[0].sSubject);
                            $('#divDate').html('<i class="halflings-icon time"></i><b>' + obj[0].sDate + '</b>');
                            $('#pMsg').html(obj[0].sMessage);

                            if (type == "Rec") {
                                $('#ddlFriends').val(obj[0].iUserIDFrom);
                                $('#divFrom').html('<i class="halflings-icon user"></i><b>' + obj[0].sFrom + '</b> / ' + obj[0].sEmail);
                            }

                            if (type == "Sen") {
                                $('#ddlFriends').val(obj[0].iUserIDTo);
                                $('#divFrom').html('<i class="halflings-icon user"></i><b>' + obj[0].sTo + '</b> / ' + obj[0].sEmail2);
                            }

                            fnLoadMessages();
                        }
                    }
                }
            });
        }

        function fnSendMessage() {
            var btValidation = true;
            var sErrors = '';

            $('#divMError').hide();
            $('#divMSuccess').hide();

            if ($('#ddlFriends option:selected').val() == "") {
                sErrors = 'Please choose a friend to send message.<br/>';
                btValidation = false;
            }

            if ($('#txtSubject').val() == "") {
                sErrors += 'Please specify message subject.<br/>';
                btValidation = false;
            }

            if ($('#txtMessage').val() == "") {
                sErrors += 'Please specify your message.<br/>';
                btValidation = false;
            }

            if (btValidation) {

                var Params = new Object();
                Params.iMessageID = $('#hfID').val();
                Params.sTo = $('#ddlFriends option:selected').val();
                Params.sSubject = $('#txtSubject').val();
                Params.sMessage = $('#txtMessage').val();

                $.ajax({
                    type: "POST",
                    url: "MyMessages.aspx/fnSendMessage",
                    data: JSON.stringify(Params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.toString() == "1") {
                            $('#divMSuccess').html('Your message has been sent successfully.');
                            $('#divMSuccess').show();
                            
                            fnLoadMessages();

                            $('#hfID').val('');
                            $('#ddlFriends').val('');
                            $('#txtSubject').val('');
                            $('#txtMessage').val('');
                        }
                        else if (msg.d.toString() == "0") {
                            $('#divMError').html('Problem in sending message, please try again later.');
                            $('#divMError').show();
                        }
                    }
                });
            }

            else {
                $('#divMError').html(sErrors);
                $('#divMError').show();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<input type="hidden" id="hfID" />
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="span7">
                <div style="overflow: auto; overflow-x: hidden; max-height: 350px;">
                    <h1>INBOX</h1>
                    <ul class="messagesList" id="ulInbox"></ul>
                </div>
                <hr />
                <div style="overflow: auto; overflow-x: hidden; max-height: 350px;">
                    <h1>SENT ITEMS</h1>
                    <ul class="messagesList" id="ulSentItems"></ul>
                </div>
            </div>
            <div class="span5 message-view">
                <div class="message">
                    <div class="header">
                        <h1 id="lblSubject"></h1>
                        <div class="from" id="divFrom"></div>
                        <div class="date" id="divDate"></div>
                        <div class="menu">
                        </div>
                    </div>
                    <div class="content">
                        <p id="pMsg"></p>
                    </div>                    
                    <br />
                    <hr style="background-color:Blue;" />                    
                    <div class="replyForm">
                        <div id="divMError" class="alert alert-danger"></div>
                        <div id="divMSuccess" class="alert alert-success"></div>
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label" for="ddlFriends">
                                    Select Friend</label>
                                <div class="controls">
                                    <select id="ddlFriends" class="input-xlarge"></select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtSubject">
                                    Subject</label>
                                <div class="controls">
                                    <input type="text" id="txtSubject" placeholder="Subject" class="input-xlarge"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtMessage">
                                    Your Message</label>
                                <div class="controls">
                                    <textarea tabindex="3" class="input-xlarge span12" id="txtMessage" name="body" rows="4"></textarea>
                                </div>
                            </div>                            
                            <div class="actions">
                                <button id="btnSendMsg" tabindex="3" type="button" class="btn btn-success" onclick="fnSendMessage();"> Send message</button>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
