  google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
         ['Month', 'Room1', 'Room2', 'Room3', 'Room4', 'Room5', '평균'],
         ['05',  165,      938,         522,             998,           450,      614.6],
         ['06',  135,      1120,        599,             1268,          288,      682],
         ['07',  157,      1167,        587,             807,           397,      623],
         ['08',  139,      1110,        615,             968,           215,      609.4],
         ['09',  136,      691,         629,             1026,          366,      569.6]
      ]);

    var options = {
      title : '룸별 예약 현황',
      vAxis: {title: '예약자수'},
      hAxis: {title: 'Month'},
      seriesType: 'bars',
      series: {5: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }