<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="com.checkin.webapp.master.model.MasterChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check in ! 관리자 메인 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webapp/css/index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="/webapp/css/default.css">
<!-- 구글 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/webapp/js/gchart_combo.js"></script>
<script src="/webapp/js/gchart_cal.js"></script>
<script src="/webapp/js/gchart_accomodation.js"></script>

<style>
.table {
	padding: 20px;
}
</style>
</head>
<body>
	<%@ include file="../topnav_master.jspf"%>
	
	<div class="row main" id="main">
		<aside class="col-lg-1"></aside>

		<div class="col-lg-9 center" id="center" style="text-align: center">
			<div style="text-align: center">
				<h3>
					[<span><%=session.getAttribute("aname") %></span>] 현황
				</h3>
			</div>
			<div class="table" style="text-align: center">
				<div class="row">
					<div class="col-sm-3 list-group-item list-group-item-info">이번 달 예약 수</div>
					<div class="col-sm-3 list-group-item list-group-item-info">전체 평점</div>
					<div class="col-sm-3 list-group-item list-group-item-info">등록된 리뷰 수</div>
					<div class="col-sm-3 list-group-item list-group-item-info">방 수</div>
				</div>
				<div class="row">
					<div class="col-sm-3 list-group-item">${vo2.bcount }</div>
					<div class="col-sm-3 list-group-item">${vo3.vgrade }</div>
					<div class="col-sm-3 list-group-item">${vo3.vcount }</div>
					<div class="col-sm-3 list-group-item">${vo4.rcount }</div>
				</div>
			</div>

			<hr />
			<!------------------------------ google chart ---------------------------------------->
			<div class="gchart panel panel-default" style="text-align: center">
				<div id="calendar_basic" class="panel-body" style="width: 1000px; height: 350px;" style="text-align:center"></div>
			</div>
			<hr />
			<div class="gchart panel panel-default" style="text-align: center">
				<div id="chart_div" class="panel-body" style="width: 900px; height: 500px;" style="text-align:center"></div>
			</div>
			<!------------------------------ google chart ---------------------------------------->
			<hr />
			<div class="gchart panel panel-default" style="text-align: center">
				<div id="columnchart_material" class="panel-body" style="width: 800px; height: 400px;"></div>
			</div>

		</div>
		<!-- 관리 현황 페이지 google chart -->


		<aside class="col-lg-1"></aside>
		<footer id="footer" class="footer" style="width:100%;font-size:0.8em;margin-top:50px">
		<%@ include file="../companyInfo.jspf"%>
		</footer>
		
	</div>
<script>
	//달력차트
	google.charts.load("current", {packages:["calendar"]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	 var dataTable = new google.visualization.DataTable();
	 dataTable.addColumn({ type: 'date', id: 'Date' });
	 dataTable.addColumn({ type: 'number', id: 'Won/Loss' });
	 dataTable.addRows([
			<%
				ArrayList<MasterChartVO> list = (ArrayList<MasterChartVO>)request.getAttribute("list");
				String content="";
				for(int i=0; i<list.size(); i++) {
					MasterChartVO mVo = list.get(i);
					content += "[ new Date(" +mVo.getBookingdate() +"),"+mVo.getBcount()+"]";
					if(i==list.size()-1) {
						content += "";
					}else {
						content += ",";
					}
				}
				out.println(content);
			%>
	
	  ]);

	 var chart = new google.visualization.Calendar(document.getElementById('calendar_basic'));
	
	 var options = {
	   title: "예약 현황",
	   height: 350,
	 };
	
	 chart.draw(dataTable, options);
	}
	
	//매출, 예약자수 통계
	google.charts.load('current', {'packages':['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawChart1);


	function drawChart1() {
		
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var data = google.visualization.arrayToDataTable([
	          ['Week', '매출', '예약건수'],
	          <%
				ArrayList<MasterChartVO> list2 = (ArrayList<MasterChartVO>)request.getAttribute("list2");
				String content2="";
				for(int i=0; i<list2.size(); i++) {
					MasterChartVO mVo = list2.get(i);
					content2 += "['" +mVo.getBookingdate() +"',"+mVo.getPrice()+","+mVo.getBcount()+"]";
					if(i==list2.size()-1) {
						content2 += "";
					}else {
						content2 += ",";
					}
				}
				out.println(content2);
			%>
	        ]);

	        var options = {
	          chart: {
	            title: '숙박 업소 통계',
	            subtitle: mm+'/'+dd+'/'+yyyy,
	          },
	          series:{
	        	0: {axis:'매출'},
	        	1: {axix:'예약건수'}
	          },
	          axes:{
	        	  y:{
	        		  매출: {label : '금액'},
	        		  예약건수: {side:'right', label:'예약건수'}
	        	  }
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	
	//룸별 예약 통계	
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);

    function drawVisualization() {
      // Some raw data (not necessarily accurate)
      var data = google.visualization.arrayToDataTable([
       <%
       	ArrayList<MasterChartVO> list3 = (ArrayList<MasterChartVO>)request.getAttribute("list3");
       	ArrayList<MasterChartVO> list4 = (ArrayList<MasterChartVO>)request.getAttribute("list4");
       	int index = 0;
       	
       	String content3 = "['Month', ";
    	for(int i=0; i<list3.size(); i++){
    		MasterChartVO mVo = list3.get(i);
    		content3 += "'"+mVo.getRname()+"'";
    		if(i != list3.size()-1){
    			content3 += ", ";
    		}
    	}
    	content3 += "], ";
    	
    	for(int i=1; i<=12; i++){
    		content3 += "[";
    		content3 += "'"+i+"월'";
    		content3 += ", ";
    		for(int start = index, end = index+list3.size(); index < end; index++){
    			MasterChartVO mVo = list4.get(index);
    			content3 += mVo.getBcount();
    			if(index != start+list3.size()-1){
    				content3 += ", ";
    			}
    		}
    		content3 += "]";
    		if(i != 12){
    			content3 += ", ";
    		}
    	}
    	out.println(content3);
		%>
		
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
</script>

</body>
</html>