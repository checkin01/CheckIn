google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart1);


function drawChart1() {
	
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
var data = google.visualization.arrayToDataTable([
          ['Week', '매출', '예약자 수'],
          ['월', 1000, 200],
          ['화', 1170, 250],
          ['수', 660, 300],
          ['목', 1030, 350],
          ['금', 1030, 350],
          ['토', 1030, 350],
          ['일', 1030, 350]
        ]);

        var options = {
          chart: {
            title: '숙박 업소 통계',
            subtitle: mm+'/'+dd+'/'+yyyy,
          }
        };

        var chart = new google.charts.Bar(document.getElementById('chart_div'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }