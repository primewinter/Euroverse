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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	
	
	
	
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
        h3{
        	color: white;
        	font-family : Consolas;
        }
       row.justify-content-around {
        position:absolute;
 		 top:50%;
		  left:50%;
		}

	  th{
	  	text-align: center;
	  	 width: 50px;
  		 height: 100px;
   		line-height: 100px;
   		     
	  }
	  td{
	  font-size:13px;
	  }
	  #arrDate,#depDate{
	  position:fixed;
	  }
	  #domestic ,  #europe  {
	  	z-index: 3;
	  }
	  #depDate , #arrDate , div{
	  	z-index: 2;
	  }
	  table {
	   background-color: white;
	  }
	  
	  .wrapper {
		   position: relative; /* #wrapper�� ������ �ָ� �������� ���� ���������� ������.. */
		}
		.wrapper:after {
		    content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-image: url('/images/AA.14077862.1.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -1;
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
$(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num--;
	if(num<=0){
	alert('���̻� ���ϼ� �����ϴ�.');
	num =1;
	}
	$('#numberUpDown').text(num);
	});
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num++;
	
	if(num>5){
	alert('���̻� �ø��� �����ϴ�.');
	num=5;
	}
	$('#numberUpDown').text(num);
	});
	});

////////////////////////////////

var rangeDate = 500; // set limit day
var setSdate, setEdate;
$(function() {
$("#depDate").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function(selectDate){
        var stxt = selectDate.split("-");
            stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
            edate.setDate(sdate.getDate() + rangeDate);
        
        $('#arrDate').datepicker('option', {
            minDate: selectDate,
            beforeShow : function () {
                $("#arrDate").datepicker( "option", "maxDate", edate );                
                setSdate = selectDate;
                console.log(setSdate)
        }});
        //to ����
    }
    //from ���õǾ��� ��
});
});
$(function() {
	$("#arrDate").datepicker({ 
	    dateFormat: 'yy-mm-dd',
	    onSelect : function(selectDate){
	        setEdate = selectDate;
	        console.log(setEdate)
	    }
	});
	$('.btn').on('click', function(e){
	    if($('input#depDate').val() == ''){
	        alert('�������� �������ּ���.');
	        $('input#depDate').focus();
	        return false;
	    }else if($('input#arrDate').val() == ''){
	        alert('�������� �������ּ���.');
	        $('input#arrDate').focus();
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
    if ($('#domestic').is(":visible")) { 
        $('#domestic').hide(); // id���� �޾Ƽ� ����� 
    } else { 
        $('#domestic').show(); // id���� �޾Ƽ� ���̱� 
    } 
} 

function Show() { 
    if ($('#europe').is(":visible")) { 
        $('#europe').hide(); // id���� �޾Ƽ� ����� 
    } else { 
        $('#europe').show(); // id���� �޾Ƽ� ���̱� 
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
	

		
<form name="detailForm" class="form-horizontal">

<div class="wrapper">	
<br/>
<br/>
<br/>
		<div class="row justify-content-around" style="margin-left:auto; margin-right:auto; width:65%">
		<input	placeholder="��������� �Է��ϼ���" type="text" name="depCity" id="depCity"  style="width:350px;height:30px;font-size:13px;"  onclick="javascript:doShow();">
		<input	 placeholder="���������� �Է��ϼ���" type="text" name="arrCity" id="arrCity"  style="width:450px;height:30px;font-size:13px;" onclick="javascript:Show();">
		
		</div>
		
		<br/>
		
		
		<div class="row justify-content-around" style="width:44%;float: left; Padding-left:350px; height:20px;">
		
		<input	placeholder="��߳�¥ ����" type="text" name="depDate" id="depDate"  style="width:300px;height:30px;font-size:13px;" >
		
		<br/><br/><br/>
		
		<!-- <div>
		
		 <label id="adultNum" for="adultNum" class="col-sm-offset-1 col-sm-3 control-label">���μ�</label>
		 <input id="adultNum" type=button value="-" onClick="javascript:this.form.amount.value--;">
		<input id="adultNum" type=text name=amount value=1>
		<input id="adultNum" type=button value="+" onClick="javascript:this.form.amount.value++;">
		</div> -->
		<table  id="domestic" class="table table-bordered table-hover text-center">
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
		<div class="row justify-content-around" style="width:50%;float: right;  Padding-right:350px; height:40px;"  >
		<input	placeholder="������¥ ����"  type="text" name="arrDate" id="arrDate"  style="width:400px;height:30px;font-size:13px;" >
		<table  id="europe" class="table table-bordered table-hover text-center"  >
			<tbody>	
			<tr>
			<th rowspan="9" align="center" >����</th>
			</tr>			
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�ĸ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">����</td>
					<td onclick="javascript:europe($(this).closest('td').text());">���׳�</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�θ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">������</td>
					<td onclick="javascript:europe($(this).closest('td').text());">�̽�ź��</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">����ũǪ��Ʈ</td>
					<td onclick="javascript:europe($(this).closest('td').text());">���帮��</td>
					<td onclick="javascript:europe($(this).closest('td').text());">�ж��</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�ٸ����γ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">�븮��</td>
					<td onclick="javascript:europe($(this).closest('td').text());">��������</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">������</td>
					<td onclick="javascript:europe($(this).closest('td').text());">���Ű</td>
					<td onclick="javascript:europe($(this).closest('td').text());">���׹�</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">���Ͻ�</td>
					<td onclick="javascript:europe($(this).closest('td').text());">�δ��佺Ʈ</td>
					<td onclick="javascript:europe($(this).closest('td').text());">������</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�Ͻ��׸���</td>
					<td onclick="javascript:europe($(this).closest('td').text());">����</td>
					<td onclick="javascript:europe($(this).closest('td').text());">������</td>
				</tr>
				<tr>
					<td onclick="javascript:europe($(this).closest('td').text());">�κ�κ��ũ</td>
					<td onclick="javascript:europe($(this).closest('td').text());">��ũ��</td>
					<td onclick="javascript:europe($(this).closest('td').text());">�����׶��</td>
				</tr>
			</tbody>
		</table>
		
		</div>

<br /><br /><br />


</div>	

</form>


</body>
</html>