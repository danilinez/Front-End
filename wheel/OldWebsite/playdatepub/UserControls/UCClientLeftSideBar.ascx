<%@ control language="C#" autoeventwireup="true" inherits="UserControls_UCClientLeftSideBar, App_Web_nq4wbuj0" %>
<div id="sidebar-left" class="span2">
    <div class="row-fluid actions">
        <input id="txtSearchBox" type="text" style="color: white !important;" class="search span12" placeholder="Search" onkeydown="fnDoParentSearchSideBar(event);"/>
    </div>
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
        <li><a href="AddChild.aspx"><i class="icon-user"></i><span class="hidden-tablet">My Kids</span></a></li>
            <li><a href="MyFriends.aspx"><i class="icon-eye-open"></i><span class="hidden-tablet">Friends</span></a></li>
            <li><a href="MyMessages.aspx"><i class="icon-dashboard"></i><span class="hidden-tablet">Messages</span></a></li>
            <li><a href="MyAppointments.aspx"><i class="icon-edit"></i><span class="hidden-tablet">Appointments</span></a></li>
            <li><a href="KidsSchedule.aspx"><i class="icon-align-justify"></i><span class="hidden-tablet">Kids Schedule</span></a></li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    function fnDoParentSearchSideBar(e) {
        if (e.keyCode == 13) {
            if (true) {
    e.preventDefault();
                
                window.location = "SearchResults.aspx?searchtxt=" + $("#txtSearchBox").val() + "";
                return false;
            }
        }
    }
</script>
