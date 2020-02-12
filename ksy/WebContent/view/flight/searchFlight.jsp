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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	 <!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
	
	
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
        
       /* �ο��� */
       row.justify-content-around {
        position:absolute;
 		 top:50%;
		  left:50%;
		}

	  th{
	  	text-align: center;
	  	 width: 70px;
  		 height: 100px;
   		line-height: 100px;
   		     
	  }
	  td{
	  font-size:13px;
	  text-align: center;
	  width : 80px;
	  }
	  #domestic ,  #europe  {
	  	z-index: 3;
	  }
	  #to , #from , div{
	  	z-index: 1;
	  }
	  table {
	   text-ailgn : center;
	   background-color: white;
		/*  border-collapse: separate;  */
		border:5px solid white;
	  }
	  .container{
	    position: relative; 
	  }
	  .container:after {
		background-color: #646464;
		font-size: 13px;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		/* letter-spacing: -.3px;
		padding: 25px 30px 23px 50px; */
		box-sizing: border-box;
		opacity: 80%;
	   }
	  
	  

	  
	  /* �̹��� ��� css */
	  .wrapper {
		   position: relative; /* #wrapper�� ������ �ָ� �������� ���� ���������� ������.. */
		}
		.wrapper:after {
		
		    content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-image: url('/resources/images/orderImg/AA.14077862.1.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -1;
		}
		/* �޷� css */
		.ui-datepicker { width: 20em; padding: .2em .2em 0;font-size: 14px; height:10px;}


    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( '.form-group:contains("��")' ).on("click" , function() {
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
	/* $('.btn').on('click', function(e){
	    if($('input#from').val() == ''){
	        alert('�������� �������ּ���.');
	        $('input#from').focus();
	        return false;
	    }else if($('input#to').val() == ''){
	        alert('�������� �������ּ���.');
	        $('input#to').focus();
	        return false;
	    }
	 });
 */
	
});
/////////////////////////////
/* function doShow() { 
    if ($('#domestic').is(":visible")) { 
        $('#domestic').hide(); // id���� �޾Ƽ� ����� 
        $('#icon').show();
    } else { 
        $('#domestic').show(); // id���� �޾Ƽ� ���̱� 
        $('#icon').hide();
       
    } 
} 

function Show() { 
    if ($('#europe').is(":visible")) { 
        $('#europe').hide(); // id���� �޾Ƽ� ����� 
     //   $('#icon').show();
    
    } else { 
        $('#europe').show(); // id���� �޾Ƽ� ���̱� 
     //   $('#icon').hide();
    } 
}  */

function doShow() { 
		if ($('#domestic').css("display","none")) { 
			$("#domestic").css("display","block");
			$("#europe").css("display", "none");
		}
}
function Show() { 
	if ($('#europe').css("display","none")) { 
		$("#europe").css("display","block");
		$("#domestic").css("display","none");
	}
}

function domestic(obj) {
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	var depCity = $("#depCity").val(obj);
	if ($('#domestic').css("display","block")) { 
		$("#domestic").css("display","none");
	}
	//alert(depCity);
};

function europe(obj) {
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	var arrCity = $("#arrCity").val(obj);
	if ($('#europe').css("display","block")) { 
		$("#europe").css("display","none");
	}
	//alert(depCity);
};
/////////////////////////////////
	
</script>



</head>




<body>

<div class="wrapper">	
<br/>
<br/>
<br/>
		
			<div class="container" >
			  <div class="row">
			    <div class="col">
			    	 <input type="text" class="form-control" placeholder="��������� �Է��ϼ���"  name="depCity" id="depCity" 
			 		  style="width:300px;height:30px;font-size:13px;float:left;"  onclick="javascript:doShow();">
					 <div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-plane" id="iconf" style="font-size:15px;" ></i></span>
			   			
			  		</div>
			  		<table class="table" id="domestic"  style="width:300px;display:none;" >
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
			    
			    <div class="col">
			    	 <input type="text" class="form-control" placeholder="���������� �Է��ϼ���"  name="arrCity" id="arrCity"
			 		  style="width:350px;height:30px;font-size:13px;float:left; "  onclick="javascript:Show();">
					 <div class="input-group-append">
					  <span class="input-group-text" id="basic-addon2"><i class="fas fa-plane" id="iconf" style="font-size:15px;" ></i></span>
		  			 </div>
		  			  <table  id="europe" class="table" style="width:350px;display: none;" >
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
			    </div>
			    
			    
			     <div class="row" id="icon">
			   		 <div class="col-sm-2">
			    	<input type="text" class="form-control" placeholder="��߳�¥ ����" readonly="readonly"
					  style="width:125px;font-size:14px;height:30px;float:left;" id="from" name="depDate" >
					  <div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
					  </div>
					
					</div>
			   		 <div class="col-sm-2">
			   		 	 <input type="text" class="form-control" placeholder="������¥ ����" 
						  style="width:125px;font-size:14px;height:30px;float:left;" id="to" name="arrDate"
						  >
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
						  </div>
			   		 
			   		 </div>
			 		</div>
				<br/>
			  <!--   <div class="w-50"></div> -->
			  		<!-- <div class="row" id="icon">
			   		 <div class="col-sm-2">
			    	<input type="text" class="form-control" placeholder="��߳�¥ ����"
					  style="width:125px;font-size:14px;height:30px;float:left;" id="from" name="depDate" >
					  <div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
					  </div>
					
					</div>
			   		 <div class="col-sm-2">
			   		 	 <input type="text" class="form-control" placeholder="������¥ ����" 
						  style="width:125px;font-size:14px;height:30px;float:left;" id="to" name="arrDate"
						  >
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2"><i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
						  </div>
			   		 
			   		 </div>
			 		</div> -->
			</div>
			
			
</form>
		
<br /><br /><br />

		<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">�����¹�ư</button><br/>
		<div class="modal fade" id="layerpop" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header">
		        <!-- �ݱ�(x) ��ư -->
		        <button type="button" class="close" data-dismiss="modal">��</button>
		        <!-- header title -->
		        <h4 class="modal-title">Header</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body">
		            Body 
		      </div>
		      <!-- Footer -->
		      <div class="modal-footer">
		        Footer
		        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
		      </div>
		    </div>
		  </div>
		</div>



</div>	



</body>
</html>