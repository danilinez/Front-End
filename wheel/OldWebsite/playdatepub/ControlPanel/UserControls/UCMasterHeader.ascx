<%@ control language="C#" autoeventwireup="true" inherits="ControlPanel_UserControls_UCMasterHeader, App_Web_pyl1fs2k" %>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                </span></a><a id="main-menu-toggle" class="hidden-phone open"><i class="icon-reorder">
                </i></a>
            <div class="row-fluid">
                <a class="brand span2" href="AdminDashboard.aspx"><span>PlayDate</span></a>
            </div>
            <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">
                    <!-- start: home -->
                    <li><a class="btn" href="AdminDashboard.aspx"><i class="icon-home"></i></a></li>
                    <!-- end: home -->
                    <li class="dropdown hidden-phone"><a class="btn dropdown-toggle" data-toggle="dropdown"
                        href="#"><i class="icon-bell"></i></a>
                        <ul class="dropdown-menu notifications">
                            <li class="dropdown-menu-title"><span>You have 7 notifications</span> </li>
                            <li><a href="#"><span class="icon blue"><i class="icon-user"></i></span><span class="message">
                                New Friend registered</span> <span class="time">1 min</span> </a></li>
                            <li><a href="#"><span class="icon light orange"><i class="icon-comment-alt"></i></span>
                                <span class="message">New comment</span> <span class="time">7 min</span> </a>
                            </li>
                            <li><a href="#"><span class="icon green"><i class="icon-envelope-alt"></i></span><span
                                class="message">New message</span> <span class="time">8 min</span> </a></li>
                            <li><a href="#"><span class="icon yellow"><i class="icon-group"></i></span><span
                                class="message">New playdate</span> <span class="time">16 min</span> </a></li>
                            <li><a href="#"><span class="icon grey"><i class="icon-star-empty"></i></span><span
                                class="message">New Sleep over</span> <span class="time">36 min</span> </a></li>
                            <li class="warning"><a href="#"><span class="icon dark pink"><i class="icon-music"></i>
                            </span><span class="message">New Party invite</span> <span class="time">2 hour</span>
                            </a></li>
                            <li><a href="#"><span class="icon green"><i class="icon-calendar"></i></span><span
                                class="message">New Event</span> <span class="time">yesterday</span> </a></li>
                            <li><a href="#"><span class="icon blue"><i class="icon-envelope-alt"></i></span><span
                                class="message">New message</span> <span class="time">yesterday</span> </a></li>
                            <li class="dropdown-menu-sub-footer"><a>View all notifications</a> </li>
                        </ul>
                    </li>
                    <!-- start: Notifications Dropdown -->
                    <li><a class="btn" href="EventsCalender.aspx"><i class="icon-calendar"></i></a></li>
                    <!-- end: Notifications Dropdown -->
                    <!-- start: Message Dropdown -->
                   <%-- <li><a class="btn" href="messages.html"><i class="icon-envelope-alt"></i></a></li>--%>
                    <!-- end: Message Dropdown -->
                    <!-- start: Settings -->
                    <li><a class="btn" href="EmailSettings.aspx"><i class="icon-wrench"></i></a></li>
                     <%--end: Settings --%>
                    <!-- start: Friends Drop Down -->
                    <%--<li><a class="btn" href="friends.html"><i class="icon-group"></i></a></li>--%>
                    <!-- end: Friends Crop Down -->
                    <!-- start: User Dropdown -->
                    <li class="dropdown"><a class="btn account dropdown-toggle" data-toggle="dropdown"
                        href="MyProfile.aspx">
                        <div class="avatar">
                            <img src="" alt="Avatar" id="imgProfileImages"></div>
                        <div class="user">
                            <span class="name" id="lblAdminName">-</span>
                        </div>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-title"></li>
                            <li><a href="MyProfile.aspx"><i class="icon-user"></i>Profile</a></li>
                            <li><a href="EmailSettings.aspx"><i class="icon-cog"></i>Email Settings</a></li>
                            <li><a href="messages.html"><i class="icon-envelope"></i>Messages</a></li>
                            <li><asp:LinkButton ID="lnkLogout" runat="server" onclick="lnkLogout_Click"><i class="icon-off"></i> Logout</asp:LinkButton></li>
                        </ul>
                    </li>
                    <!-- end: User Dropdown -->
                </ul>
            </div>
            <!-- end: Header Menu -->
        </div>
    </div>
</div>
<script type="text/javascript">

$(document).ready(function(){

fnLoadUserProfileDetails();

});

  function fnLoadUserProfileDetails() {
            var param = new Object();
            param.sUserID = '<%= Session["objUID"] %>';
            return $.ajax({
                type: "POST",
                url: "UsersManagement.aspx/fnEditUser",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {

                        var obj = jQuery.parseJSON(msg.d);
                        $.each(obj, function (index, value) {
                            $("#lblAdminName").text(value.sFirstName+' '+value.sLastName);
                            
                        
                            if(value.sProfilePicture=="")
                            $("#imgProfileImages").attr("src","ico/apple-touch-icon-144-precomposed.png");
                            else
                            $("#imgProfileImages").attr("src","../UploadFiles/"+value.sProfilePicture+"");

                            
                                
                        });
                       

                    }
                }
            });
        }

</script>