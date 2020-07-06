<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_uploading, App_Web_x5lf5vqe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="margin: 0;">
    <script type="text/javascript" language="javascript" src="js/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript">
        function UploadFileNow() {
            var ext = $('#FileUpload2').val().split('.').pop().toLowerCase();
            if ($.inArray(ext, ['doc', 'txt','docx', 'pdf', 'jpeg', 'pdf', 'xls', 'xlsx', 'gif', 'bmp', 'jpg', 'rar', 'zip']) == -1) {
                alert('invalid extension!');
                return;
            }

            var value = $("#FileUpload2").val();
            if (value != '') {
                $("#form2").submit();
            }
        };
    </script>
    <form id="form2" runat="server">
    <table style="margin-left: 0px; padding-left: 0px;width:100%">
        <tr>
            <td>
                <asp:FileUpload ID="FileUpload2" Width="180" runat="server" Font-Size="XX-Small"
                    ClientIDMode="Static" ToolTip="..." onchange="UploadFileNow()" />
            </td>
        </tr>
        <tr runat="server" id="tdLabels">
            <td valign="top">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="false" Font-Size="XX-Small" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
