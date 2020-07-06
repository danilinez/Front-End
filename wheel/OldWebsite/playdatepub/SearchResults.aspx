<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="SearchResults, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header">
                    <h2>
                        <i class="icon-search"></i>Search Results</h2>
                </div>
                <div class="box-content" id="dvSearchResults">
                    <div id="dvMessage">
                    </div>
                </div>
            </div>
            <!--/span-->
            <!--/row-->
            <!-- end: Content -->
        </div>
    </div>
    <script language="javascript" type="text/javascript">
         $(document).ready(function () {
             if (qs("searchtxt") == null || qs("searchtxt") == undefined || qs("searchtxt") == '') {
                 window.location = "MyFriends.aspx";
                 return;
             }

             var rowCount=0;
             var objParam = new Object();
             objParam.sSearchTxt = qs("searchtxt");
             objParam.sUserID = ''+<%= Session["UserID"] %>+'';
             $.ajax({
                 type: "POST",
                 contentType: "application/json",
                 data: JSON.stringify(objParam),
                 url: "SearchResults.aspx/fnSearchFriendsList",
                 dataType: "json",
                 success: function (msg) {
                     if (msg.d.length > 0) {
                         var obj = jQuery.parseJSON(msg.d);
                         var strBaseHTML="";
                         var totalRecords = obj.length;
                         var icount = 0;
                         $.each(obj, function (index, value) {
                             var sProfilePic = "";
                             if (value.sProfilePicture == "")
                                 sProfilePic = "assets/img/no-profile-pic.jpg";
                             else
                                 sProfilePic = "UploadFiles/" + value.sProfilePicture + "";

//                                   <ul class="thumbnails" id="ulSearchResults"></ul>

                            icount += 1;
                             
                             
                                
                            
                             var sSendRequestButton = "<input id='btnSendFriendRequest_"+value.iUserAccountID+"' class='btn btn-info btn-small' type='button' value='Send Friend Request' onclick=\"fnSendFreindRequest('"+value.iUserAccountID+"','btnSendFriendRequest_"+value.iUserAccountID+"')\" />";

                             
                            if(rowCount==0)  
                                {
                             
                             strBaseHTML = "<ul class='thumbnails' id='ulSearchResults_"+value.iUserAccountID+"'>";

                            }

 strBaseHTML += "<li class='span3' id='liUsers_"+value.iUserAccountID+"'><div class='thumbnail' style='padding: 0; width: 100%;margin: 0 auto;height: 288px;'><div style='padding: 4px; text-align: center'><img alt='" + value.sName + "' class='img-circle' style='width: 100px; height: 100px;margin-top: 10px;' src='" + sProfilePic + "' /></div><div class='caption' style='height:98px'><h2>" + value.sName + "</h2><p><i class='icon icon-map-marker'></i>" + value.sAddressInfo + "</p></div><div class='modal-footer' style='text-align: center'><div class='row-fluid'>"+sSendRequestButton+"</div></div></div></li>";
 rowCount+=1;
                            if(rowCount==4)
                            {
                            strBaseHTML +="</ul>";
                              $("#dvSearchResults").append(strBaseHTML);
                              rowCount=0;
                            }
                         });

                         if(rowCount>0 && rowCount<4)
                         {
                                strBaseHTML +="</ul>";
                              $("#dvSearchResults").append(strBaseHTML);
                         }

                     }
                     else {
//                         alert("no record found");
                        $("#dvMessage").attr("class", "alert alert-error");
                        $("#dvMessage").text('no record found...');  
                               
                     }
                 }
             });

         });

         function fnSendFreindRequest(sUserID,requestButtonID)
         {
            var param = new Object();
            param.sRequestByID = ''+<%= Session["UserID"] %>+'';
            param.sRequestToID = sUserID;
          $.ajax({
                 type: "POST",
                 contentType: "application/json",
                 data: JSON.stringify(param),
                 url: "SearchResults.aspx/fnFriendRequest",
                 dataType: "json",
                 success: function (msg) {

                     if(msg.d == '1')
                     {                 
                        $("#"+requestButtonID+"").attr('class','btn btn-success btn-small');
                        $("#"+requestButtonID+"").attr('disabled','disabled');
                        $("#"+requestButtonID+"").val('Request Sent');
                     }
                     else
                     {
                     alert('Problem in Sending Friend Request!');
                     }
                 }
                 
                 });

         }

         function qs(key) {
             key = key.replace(/[*+?^$.\[\]{}()|\\\/]/g, "\\$&"); // escape RegEx control chars
             var match = location.search.match(new RegExp("[?&]" + key + "=([^&]+)(&|$)"));
             return match && decodeURIComponent(match[1].replace(/\+/g, " "));
         }
    </script>
</asp:Content>
