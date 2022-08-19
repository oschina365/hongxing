function timer(intDiff){
    window.setInterval(function () {
        var 
        day = 0,
		hour = 0,
		minute = 0,
		second = 0; //时间默认值	
        if (intDiff > 0) {
            day = Math.floor(intDiff / (60 * 60 * 24)); 
            hour = Math.floor(intDiff / (60 * 60)) - (day * 24); 
            minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
            second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
        }
        else {
            timer(getIntDiff());
        }

       minute = formatTen(minute);
       second = formatTen(second);
        $('#day_show').html(day);
        $('#hour_show').html(hour);
        $('#minute_show').html(minute);
        $('#second_show').html(second);
        intDiff--;
    }, 1000);
}

function formatTen(num) {
    return num > 9 ? (num + "") : ("0" + num);
}

function getLastDay(year, month) {
    var new_year = year;       
    var new_month = month++;      
    if (month > 12)
    {
        new_month -= 12;   
        new_year++;
    }
    var new_date = new Date(new_year, new_month, 1);       
    var date_count = (new Date(new_date.getTime() - 1000 * 60 * 60 * 24)).getDate();    
    var last_date = new Date(new_date.getTime() - 1000 * 60 * 60 * 24);
    return date_count;
}

function getdatetime() {
    $.ajax({
        success: function (result, status, xhr) {
            var d = new Date(xhr.getResponseHeader("Date"));
            var Mday = getLastDay(d.getFullYear(), d.getMonth() + 1);
            var sDays = (Mday - d.getDate()) * 60 * 60 * 24;
            var sHours = 24 * 60 * 60 - d.getHours() * 60 * 60 - 60 * 60;
            var sMinutes = 60 * 60 - d.getMinutes() * 60 - 60;
            var sSeconds = 60 - d.getSeconds() - 1;
            var intDiff = sDays + sHours + sMinutes + sSeconds;
            timer(intDiff);
        }
    });
}

$(function () {
    getdatetime();  
})
