<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>���� �����ȸ</title>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
             padding-top : 50px;

        }
        image {
        	border : 1px solid lightpink;
        }
        h3{
        	color: white;
        	font-family : Consolas;
        }
      
        
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( '.form-group:contains("��")' ).on("click" , function() {
		 	//alert("�˻�")
			$("form").attr("method" , "POST").attr("action" , "/flight/searchFlight").submit();

	});
});	


////////////////////////////////

var rangeDate = 500; // set limit day
var setSdate, setEdate;
$(function() {
$("#from").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function(selectDate){
        var stxt = selectDate.split("-");
            stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
            edate.setDate(sdate.getDate() + rangeDate);
        
        $('#to').datepicker('option', {
            minDate: selectDate,
            beforeShow : function () {
                $("#to").datepicker( "option", "maxDate", edate );                
                setSdate = selectDate;
                console.log(setSdate)
        }});
        //to ����
    }
    //from ���õǾ��� ��
});
});
$(function() {
	$("#to").datepicker({ 
	    dateFormat: 'yy-mm-dd',
	    onSelect : function(selectDate){
	        setEdate = selectDate;
	        console.log(setEdate)
	    }
	});
	$('.btn').on('click', function(e){
	    if($('input#from').val() == ''){
	        alert('�������� �������ּ���.');
	        $('input#from').focus();
	        return false;
	    }else if($('input#to').val() == ''){
	        alert('�������� �������ּ���.');
	        $('input#to').focus();
	        return false;
	    }

   /*  var t1 = $('input#from').val().split("-");
    var t2 = $('input#to').val().split("-");
    var t1date = new Date(t1[0], t1[1], t1[2]);
    var t2date = new Date(t2[0], t2[1], t2[2]);
    var diff = t2date - t1date;
    var currDay = 24 * 60 * 60 * 1000;
    if(parseInt(diff/currDay) > rangeDate){
        alert('�α� ��ȸ �Ⱓ�� ' + rangeDate + '���� �ʰ��� �� �����ϴ�.');        
        return false;
    } */
	});
});
/////////////////////////////
function doShow() { 
    if ($('#city').is(":visible")) { 
        $('#city').hide(); // id���� �޾Ƽ� ����� 
    } else { 
        $('#city').show(); // id���� �޾Ƽ� ���̱� 
    } 
} 

function Show() { 
    if ($('#arr').is(":visible")) { 
        $('#arr').hide(); // id���� �޾Ƽ� ����� 
    } else { 
        $('#arr').show(); // id���� �޾Ƽ� ���̱� 
    } 
} 

function domestic(obj) {
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	var depCity = $("#depCity").val(obj);
	doShow();
	//alert(depCity);
};

function europe(obj) {
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	var arrCity = $("#arrCity").val(obj);
	Show();
	//alert(depCity);
};
/////////////////////////////////
	
</script>



</head>




<body>
	
	<div class="container">
		<div class="page-header">
			<h3>Selenium</h3>
		
		
		
		
		
		
		</div>
  </div>
		
		
<form name="detailForm" class="form-horizontal">

		<div class="row justify-content-around">
		<input	type="text" name="depCity" id="depCity" class="col-6 col-md-4"  onclick="javascript:doShow();">
		<input	type="text" name="arrCity" id="arrCity" class="col-6 col-md-4"  onclick="javascript:Show();">
		
		
		<div class="row justify-content-around">
		<table id="city" width="200" class="table table-bordered table-hover text-center">
	
			<tbody>	
			<tr>
			<th rowspan="5" align="center">����</th>
			</tr>			
				<tr>			
					<td onclick="javascript:domestic($(this).closest('td').text());">��õ</td>
					<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
				</tr>
				<tr>
					<td onclick="javascript:domestic($(this).closest('td').text());">�λ�</td>
					<td onclick="javascript:domestic($(this).closest('td').text());">�뱸</td>
				</tr>
				<tr>
					<td onclick="javascript:domestic($(this).closest('td').text());">û��</td>
					<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
				</tr>
				<tr>
					<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
					<td onclick="javascript:domestic($(this).closest('td').text());"></td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="row justify-content-around">
		<table id="arr" width="200" class="table table-bordered table-hover text-center">
			<tbody>	
			<tr>
			<th rowspan="5" align="center">����</th>
			</tr>			
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�ĸ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">����</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�θ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">������</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">����ũǪ��Ʈ</td>
					<td onclick="javascript:europe($(this).closest('td').text());">���帮��</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�ٸ����γ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">�븮��</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
<!--  ���̺�   -->
	<table class="table table-bordered">
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

<!--  ���̺�   -->
	<div class="form-group">
   	 <div class="col-sm-offset-4  col-sm-4 text-center">
      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
     </div>
 	</div>

</table>
</form>
</div>

	<jsp:include page="../common/pageNavigator_new.jsp"/>			 

</body>
</html>