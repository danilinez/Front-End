<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="AddChild, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            fnLoadChilds();
            $('#txtDOB').datepicker();
            $('#divError').hide();
            $('#divSuccess').hide();
        });

        function fnLoadChilds() {
            var Params = new Object();
            Params.sUserID = '<%= Session["UserID"] %>';

            $.ajax({
                type: "POST",
                cache: false,
                url: "AddChild.aspx/fnLoadAllChilds",
                data: JSON.stringify(Params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {

                    $('#tblKidsList').dataTable().fnClearTable();
                    $('#tblKidsList').dataTable().fnDestroy();

                    if (msg.d.toString() != "0") {
                        var obj = jQuery.parseJSON(msg.d);

                        if (obj.length > 0) {
                            var aaData = [];

                            for (var i = 0; i < obj.length; i++) {
                                aaData.push([
                                   "<button type='button' class='btn btn-info' title='Edit' onclick=\"fnEditKid('" + obj[i].ID + "')\"><i class='icon-edit '></i></button><button type='button' class='btn btn-danger' title='Delete' onclick=\"fnDeleteKid('" + obj[i].ID + "')\"><i class='icon-trash '></i></button>",
                                   (i + 1),
                                   obj[i].sName,
		                           obj[i].DOB,
                                   obj[i].sGroup,
                                   obj[i].Gender
                                ]);
                            }

                            $('#tblKidsList').dataTable({
                                "aaData": aaData,
                                "bProcessing": true,
                                "bDeferRender": true
                            });
                            $(".dataTables_processing").attr('style', 'display:none');
                        }
                    }
                }
            });
        }

        function fnDeleteKid(ID) {
            var answer = confirm("Are you sure to delete this Child?");
            if (answer) {
                var Params = new Object();
                Params.iKidID = ID;

                $.ajax({
                    type: "POST",
                    url: "AddChild.aspx/fnDeleteKid",
                    data: JSON.stringify(Params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.toString() == "1") {
                            fnLoadChilds();
                            $('#divSuccess').html('Child deleted successfully.');
                            $('#divSuccess').show();
                            setTimeout(function () { $('#divSuccess').hide(); }, 5000);
                        }

                        else {
                            $('#divError').html('Problem in deleting record.');
                            $('#divError').show();
                            setTimeout(function () { $('#divError').hide(); }, 5000);
                        }
                    }
                });
            }
        }

        function fnEditKid(sID) {
            $('#hfKidID').val(sID);
            var Params = new Object();
            Params.sKidID = sID;

            $.ajax({
                type: "POST",
                url: "AddChild.aspx/fnLoadChildsInfo",
                data: JSON.stringify(Params),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.toString() != "0") {
                        var obj = jQuery.parseJSON(msg.d);
                        if (obj.length > 0) {
                            $('#txtFullName').val(obj[0].Name);
                            $('#txtDOB1').val(obj[0].DOB);
                            $('#ddlGroup').val(obj[0].Grp);
                            $('#ddlGender').val(obj[0].Gen);
                        }
                    }
                }
            });
        }

        function fnAddChild() {
            if ($('#btnNext').text() == "Finish") {
                var btValidation = true;
                var sErrors = '';
                $('#divError').hide();

                if ($('#txtFullName').val() == "") {
                    sErrors = "Please specify kid's Name.<br/>";
                    btValidation = false;
                }

                if ($('#txtDOB1').val() == "") {
                    sErrors += "Please specify kid's Date of Birth.";
                    btValidation = false;
                }

                if (btValidation) {
                    var Params = new Object();
                    Params.KidID = $('#hfKidID').val();
                    Params.sName = $('#txtFullName').val();
                    Params.sDOB = $('#txtDOB1').val();
                    Params.sGroup = $('#ddlGroup option:selected').val();
                    Params.sGender = $('#ddlGender option:selected').val();

                    $.ajax({
                        type: "POST",
                        cache: false,
                        url: "AddChild.aspx/fnRegisterChild",
                        data: JSON.stringify(Params),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            if (msg.d.toString() == "SUCCESS") {
                                fnLoadChilds();
                                //$('#divActions').hide();
                                $('#divSuccess').html('Your kid\'s information been saved successfully.');
                                $('#divSuccess').show();
                                setTimeout(function () { $('#divSuccess').hide(); }, 5000);
                            }

                            if (msg.d.toString() == "AE") {
                                $('#divError').html($('#txtFullName').val() + ' have already registered as your kid.');
                                $('#divError').show();
                                setTimeout(function () { $('#divError').hide(); }, 5000);
                            }
                            if (msg.d.toString() == "0") {
                                $('#divError').html('Problem in saving record, try again later.');
                                $('#divError').show();
                                setTimeout(function () { $('#divError').hide(); }, 5000);
                            }
                            $('#btnReset').click();
                        }
                    });
                }

                else {
                    $('#divError').html(sErrors);
                    $('#divError').show();
                    setTimeout(function () { $('#divError').hide(); }, 5000);
                    return;
                }
            }
        }

        function fnResetForm() {
            $('#hfKidID').val('');
            $('#btnprev').click();
            $('#btnprev').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <input type="hidden" id="hfKidID" />
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header">
                    <h2>
                        <i class="icon-edit"></i>Add Childs info</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                        
                    </div>
                </div>
                <div class="box-content">
                    <div id="MyWizard" class="wizard">
                        <ul class="steps">
                            <li data-target="#step1" class="active"><span class="badge badge-info">1</span></li>
                            <li data-target="#step2"><span class="badge">2</span></li>
                            <li data-target="#step3"><span class="badge">3</span></li>
                        </ul>
                        <div class="actions" id="divActions">
                            <button id="btnReset" type="reset" class="btn btn-default" onclick="fnResetForm();">Reset / Add New</button>
                            <button id="btnprev" type="button" class="btn btn-prev">
                                <i class="icon-arrow-left"></i>Prev</button>
                            <button id="btnNext" type="button" class="btn btn-success btn-next" data-last="Finish" onclick="fnAddChild();">
                                Next <i class="icon-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                    <div id="divError" class="alert alert-danger"></div>
                    <div id="divSuccess" class="alert alert-success"></div>
                    <div class="step-content">
                        <div class="step-pane active" id="step1">
                            <div class="form-horizontal">
                                <fieldset>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Kid's Full Name:</label>
                                        <div class="controls">
                                            <input type="text" id="txtFullName" class="input-xlarge"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Date of Birth:</label>
                                        <div class="controls">
                                            <div class="input-append date input-xlarge" id="txtDOB" data-date="" data-date-format="dd/mm/yyyy">
                                                <input size="16" type="text" id="txtDOB1" value="" class="validate[required,custome[dateFormat]]"
                                                    readonly="readonly"/>
                                                <span class="add-on"><i class="icon-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="step-pane" id="step2">
                            <div class="form-horizontal">
                                <fieldset>
                                    <div class="control-group">
                                        <label class="control-label" for="selectError20">
                                            Group Select</label>
                                        <div class="controls">
                                            <select data-placeholder="Which group are they in" id="ddlGroup">
                                                <option value="No group">No Group</option>
                                                <option value="Sport">Sport</option>
                                                <option value="School">School</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="selectError20">
                                            Gender</label>
                                        <div class="controls">
                                            <select id="ddlGender">
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="step-pane" id="step3">
                            <div class="alert alert-info">
                                Click the finish button to complete the process. Make sure that you have provided the correct information.<br />
                                After completing the process you can make schedules for your kid and fix play dates.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header">
                    <h2>My Childs</h2>
                </div>
                <div class="box-content">                    
                    <table class="table table-striped table-bordered bootstrap-datatable datatable" id="tblKidsList">
                        <thead>
                            <tr>
                            <th>Action</th>
                            <th>Sr. #</th>
                            <th>Name</th>
                            <th>DOB</th>
                            <th>Group</th>
                            <th>Gender</th>
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
