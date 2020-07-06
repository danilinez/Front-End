jQuery(document).ready(function() {
  $(document).ready(function() {
    $('#manage-prods').DataTable();
  } );
});


$(".selecter").select2();

CKEDITOR.replace("txtDescription");


$(".second-ctgs").hide('slow');
$('input[type="radio"]').click(function(){
if($(this).attr("value")=="ctb"){
  $(".second-ctgs").hide();
}
if($(this).attr("value")=="cta"){
  $(".second-ctgs").show();
}        
});

$(".ctg-save").click(function(){
  var radioValue = $("input[name='aopts']:checked").val();
  
  // $('#red').val() = radioValue;
});

$("input[name='aopts']").change(function (e) {
  $('#red').val(e.target.value)
})


$(".images-uploader").dropzone({
  url: "#",
  addRemoveLinks: true 
});



// Initilizing Formats for Date Time Picker
$.fn.datepicker.language['en'] = {
days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
daysShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
daysMin: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
months: ['January','February','March','April','May','June', 'July','August','September','October','November','December'],
monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
today: 'Today',
clear: 'Clear',
dateFormat: 'dd MM, yyyy',
timeFormat: 'hh:ii aa',
firstDay: 0
};

$('#timepicker-ex').datepicker({
language:'en',
dateFormat: 'dd MM, yyyy',
timeFormat: '- hh:ii aa',
timepicker: true,
todayButton: new Date()
});

function readURL(input) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#slogo')
              .attr('src', e.target.result)
              .width(130)
              .height(130);
      };

      reader.readAsDataURL(input.files[0]);
  }
}

