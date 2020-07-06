<%@ page language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_Test, App_Web_zarixrtn" title="DropDownList: Bind To Enum" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DropDownList ID="ddlistTest" runat="server" Height="17px" Width="103px">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />

</asp:Content>

