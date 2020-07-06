<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_MyAppointment, App_Web_iiwsqckp" masterpagefile="~/UserPanels/Client.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
  <table width="968" border="0" cellspacing="0" cellpadding="0">
      <tr>
          <td>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mainboxheading">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                      <td width="6" height="6"></td>
                                      <td></td>
                                      <td width="6"></td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td>
                                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                <td align="left">Schedule Appointment </td>
                                                <td width="15"><img src="images/bullet-heading-right.png" width="15" height="16" /></td>
                                                </tr>
                                          </table>
                                      </td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td width="3" height="6"></td>
                                      <td></td>
                                      <td width="3"></td>
                                  </tr>
                            </table>
                        </td>
                    </tr>
              </table>
          </td>
      </tr>
      <tr>
          <td height="5"></td>
      </tr>
      <tr>
          <td height="5" align="right">
              &nbsp;</td>
      </tr>
      <tr>
          <td height="5"></td>
      </tr>
      <tr>
          <td class="grid">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <asp:ListView ID="lstAppointments" runat="server" 
                      onitemcommand="lstAppointments_ItemCommand">
                       <LayoutTemplate>
                          <tr> <%--Grid Header Starts--%> 
                               <td  class="grid-header">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                     <tr>
                                      <%--<td width="5" height="30"></td>--%>
                                      <%--<td width="176" align="left">Patient</td>--%> 
                                      <%--<td width="0" height="40"></td>--%>
                                      <td width="1" bgcolor="#CCCCCC"></td>
                                      <td width="5" height="30"></td>
                                      <td width="183" align="left">Meidcal Expert </td>
                                      <td width="5"></td>
                                      <td width="1" bgcolor="#CCCCCC"></td>
                                      <td width="5"></td>
                                      <td width="162" align="left">Appoitment Date / Time </td>
                                      <td width="5"></td>
                                      <td width="1" bgcolor="#CCCCCC"></td>
                                      <td width="5"></td>
                                      <td width="206" align="left">Venue</td>
                                      <td width="5"></td>
                                      <td width="1" bgcolor="#CCCCCC"></td>
                                      <td width="5"></td>
                                      <td width="103" align="left">Status</td>
                                      <td width="5"></td>
                                      <td width="1" bgcolor="#CCCCCC"></td>
                                      <td width="5"></td>
                                      <td width="61" align="center">Action</td>
                                      <td width="5"></td>
                                     </tr>
                                   </table>
                               </td>
                               <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        <%--Grid Header ends--%> 
                          </tr>
                       </LayoutTemplate>
                       <ItemTemplate>
                    <tr> 
                        <td>
                            <%--Body of table starts here--%>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                
                                      <tr>
                                      <td class="grid-border-bottom">
                                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <%--<td width="5" height="30"></td>--%>
                                                    <%--<td width="176" align="left"><%# Eval("Name") %></td>--%>
                                                    <%--<td width="5"></td>--%>
                                                    <td width="1" bgcolor="#CCCCCC"></td>
                                                    <td width="5" height="30"></td>
                                                    <td width="183" align="left"><%# Eval("DoctorName")%></td>
                                                    <td width="5"></td>
                                                    <td width="1" bgcolor="#CCCCCC"></td>
                                                    <td width="5"></td>
                                                    <td width="162" align="left"><%# Eval("AppointmentDate")%> ( <%# Eval("TimeFrom")%> - <%# Eval("TimeTo")%>)</td>
                                                    <td width="5"></td>
                                                    <td width="1" bgcolor="#CCCCCC"></td>
                                                    <td width="5"></td>
                                                    <td width="206" align="left"><%# Eval("LocationName")%></td>
                                                    <td width="5"></td>
                                                    <td width="1" bgcolor="#CCCCCC"></td>
                                                    <td width="5"></td>
                                                    <td width="103" align="left"><%# Eval("CaseStatus")%></td>
                                                    <td width="5"></td>
                                                    <td width="1" bgcolor="#CCCCCC"></td>
                                                    <td width="5"></td>
                                                    <td width="61" align="left">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <tr>
                                                          <td width="9">&nbsp;</td>
                                                          <td width="16" align="left">
                                                                <a href="#">
                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                         <ContentTemplate>
                                                                                <asp:ImageButton ID="imgViewButton" runat="server" ImageUrl="images/icon-view.png"/>     
                                                                         </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </a>
                                                          </td>
                                                         
                                                          <td width="16" align="left">
                                                                <a href="#">
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                         <ContentTemplate>
                                                                               <asp:ImageButton ID="imgDeleteButton" runat="server" ImageUrl="images/icon-delete.png" CommandName="popup" CommandArgument='<%# Eval("caseID") %>'/>
                                                                         </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    
                                                                </a>
                                                          </td>
                                                          <td align="left"><a href="#"></a></td>
                                                          <td align="left" width="9">&nbsp;</td>
                                                          </tr>
                                                      </table>
                                                    </td>
                                                    <td width="5"></td>
                                                </tr>
                                          </table>
                                      </td>
                                  </tr>
                                      
                               
                            </table>
                            <%--Body of table ends here--%>

                        </td>
                    </tr>
                    </ItemTemplate>
                  </asp:ListView>               
              </table>
          </td>
      </tr>
                                       
                                        
      <tr>
          <td>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="paging">
                    <tr>
                        <td height="30">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                                      <td width="10" height="5"></td>
                                                      <td></td>
                                                      <td width="10"></td>
                                 </tr>
                                 <tr>
                                                      <td>&nbsp;</td>
                                                      <td align="right">
                                                            <%--<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <strong>Next »</strong> --%>
                                                            <asp:DataPager ID="dtpPatientDocuments" runat="server" PageSize="20" 
                                                                Visible="true" onprerender="dtpPatientDocuments_PreRender" 
                                                                PagedControlID="lstAppointments" >
                                                                 <Fields>
                                                                      <asp:NextPreviousPagerField ButtonCssClass="grid_pagi_bg_a1" FirstPageText="First" NextPageText="" PreviousPageText="« Previous" />
                                                                      <asp:NumericPagerField NumericButtonCssClass="grid_pagi_bg_a2" />
                                                                      <asp:NextPreviousPagerField ButtonCssClass="grid_pagi_bg_a1" LastPageText="Last" NextPageText="Next »" PreviousPageText="" />
                                                                 </Fields>
                                                            </asp:DataPager>
                                                      </td>
                                                      <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                                      <td width="10" height="5"></td>
                                                      <td></td>
                                                      <td width="10"></td>
                                 </tr>
                           </table>
                        </td>
                    </tr>
              </table>
          </td>
      </tr>
</table>



   <asp:Button ID="btnForPopupModal" runat="server" Text="Button" style="display:none;"/>

    <asp:Panel ID="pnlDeleteAppointment" runat="server" >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="background-color: #CACACA;
    border-width: thin;
    border-color: #C0C0C0;
    width: 300px;
    height: 200px;">
           <ContentTemplate>
               <asp:Label ID="Label1" runat="server" Text="Reason of Deleteion"></asp:Label><br />
               <asp:TextBox ID="txtDeletetionReson" runat="server" TextMode="MultiLine" style="resize:none;" Height="140" Width="250"></asp:TextBox><br />
               <asp:Button ID="btnDelete" runat="server" Text="Cancel Case" onclick="btnDelete_Click" />
               <asp:Button ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" 
                   Width="53px"/>
           </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnForPopupModal" PopupControlID="UpdatePanel1">
    </cc1:ModalPopupExtender>
</asp:Content>




