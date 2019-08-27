$(document).ready(function() {

    $('#startTime').timepicker();
    $('#endTime').timepicker();

    $(".calendar-day").click(function() {
        date = $(this).data("date");
        $('#employee_log_log_date').val(date);
        $('.today').removeClass('today');
        $(this).parent().addClass('today');
    });

    $('.date-inputs').on('change',function(){
        var valueStart = $("#startTime").val();
        var valueStop = $("#endTime").val();
        var selectedDate = $('#employee_log_log_date').val();
        var str0= selectedDate +" "+ valueStart;
        var str1= selectedDate +" "+ valueStop;

        if(Date.parse(str0) <= Date.parse(str1)){
            var diff=(Date.parse(str1)-Date.parse(str0))/1000/60;
            var hours=String(100+Math.floor(diff/60)).substr(1);
            var mins=String(100+diff%60).substr(1);
            $('#employee_log_total_hours').val(hours +":"+mins);
        }
        else{
            $('#employee_log_total_hours').val("");
            $('#endTime').val("");
        }

    });

});
