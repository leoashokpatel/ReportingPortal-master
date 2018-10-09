<%@page import="com.comlink.controller.MasterController"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- start: Meta -->
<meta charset="utf-8">
<title>Comlink | Summary Report</title>
<meta name="description" content="Comlink">
<meta name="author" content="Comlink">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<style>
.checkbox {
  display: float: right;
}
</style>
<link
	href="resources/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="resources/css/bootstrap-datetimepicker1.min.css">
<link id="bootstrap-style" href="resources/css/bootstrap.css"
	rel="stylesheet">
	<link  rel="stylesheet" type="text/css"  href="resources/css/custom.css" rel="stylesheet">





<!--
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">-->




<!-- <link href="resources/css/bootstrap.css" rel="stylesheet"> -->



<!--<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>-->
<!--<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  -->
<link href="resources/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">

<link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
<link id="base-style" href="resources/css/style.css" rel="stylesheet">
<link id="base-style-responsive"
	href="resources/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
       href="resources/css/droid_sans.css"> 
  
<link rel="stylesheet" type="text/css"
	href="resources/css/droid_serif.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/boogaloo.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/economica.css">


<!--[if lt IE 7 ]>
	<link id="ie-style" href="resources/css/style-ie.css" rel="stylesheet">
	<link href="resources/css/custom.css" type="text/css" rel="stylesheet">
	<![endif]-->
<!--[if IE 8 ]>
	<link id="ie-style" href="resources/css/style-ie.css" rel="stylesheet">
	<link href="resources/css/custom.css" type="text/css" rel="stylesheet">
	<![endif]-->
<!--[if IE 9 ]>
	<![endif]-->

<!-- end: CSS -->


<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon" href="resources/img/icon.png">
<!-- end: Favicon -->
<style>
.clr {
	clear: both;
}
</style>
</head>
<body>
	<div id="overlay">
		<ul>
			<li class="li1"></li>
			<li class="li2"></li>
			<li class="li3"></li>
			<li class="li4"></li>
			<li class="li5"></li>
			<li class="li6"></li>
		</ul>
	</div>
	<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> <a class="brand" href="summary-report.html"> <!--<img alt="Perfectum Dashboard" src="resources/img/logo20.png" />-->
					<div class="login-logo">
						<img src="resources/img/logo-white.png" alt="logo" width="160"
							height="70">
					</div></a>
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right p-top">
						<!-- start: Notifications Dropdown -->
						<!-- end: Notifications Dropdown -->
						<!-- start: Message Dropdown -->
						<!-- end: Message Dropdown -->
						<li><a class="btn" href="#"> <i
								class="icon-wrench icon-white"></i>
						</a></li>
						<!-- start: User Dropdown -->
						<li class="dropdown"><a class="btn dropdown-toggle"
							data-toggle="dropdown" href="#"> <i
								class="icon-user icon-white"></i> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<%
									if(MasterController.map.get("userType").equals("1")){
								%>
									<li><a href="user-management?id="><i
								class="icon-user"></i>User Management
									</a></li>
									<%}%>
								<li><a href="changepassword.html"><i class="icon-user"></i>
										Change Password</a></li>
										
								<li><a href="logout.html"><i class="icon-off"></i>Logout</a></li>
								
							</ul></li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->

			</div>
		</div>
	</div>
	<!-- start: Header -->

	<div class="container-fluid">
		<div class="row-fluid">
<div class="span2 main-menu-span">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<!--<li><a href="index.html"><i class="icon-home icon-white"></i><span class="hidden-tablet"> Dashboard</span></a></li>
                          <li><a href="profile.html"><i class="icon-user icon-white"></i><span class="hidden-tablet"> My Profile</span></a></li>-->
						<!-- <li><a href="friends.html"><i class="icon-globe icon-white"></i><span class="hidden-tablet">Report</span></a></li>-->

						<li><a href="summary-report.html"><i
								class="icon-tasks icon-white"></i><span class="hidden-tablet">Reports</span></a></li>
							<li><a href="addnum"><i class="icon-tasks icon-white"></i>
								<span class="hidden-tablet">Add Numbers</span></a></li>	
						
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!-- start: Main Menu -->
		
			<!--/span-->
			<!-- end: Main Menu -->
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="span10">
				<!-- start: Content -->


				<div class="row breadrump-block">
					<hr>
					<div class="span8">
						<ul class="breadcrumb">
							<li><a href="summary-report.html">Home</a> <span class="divider">/</span>
							</li>
							<li><a href="#">Report</a></li>

						</ul>
					</div>
					<div class="span3"></div>
					<hr>
				</div>



				<div class="row-fluid sortable">
					<div class="parentrightreport">
						<div class="box-header" data-original-title="">		&nbsp;&nbsp;&nbsp;<h4>${message}</h4>
							<h2>
								<i class="icon-edit"></i><span class="break"></span>View Report
							</h2> 
					
							
						</div>
                 
						<div class="box-content">
                  
							<form class="" action="summary-report.html" method="post" id="myForm" name="form1">
								<div class="parentline1 clearfix">
								<input type="hidden" name="recid" value="1">
									<div class="childsline1">

										<div class="control-group">
											<label class="control-label" for="date01">Start Date</label>
											<div id="datetimepicker" class="input-append date">
												<input  data-format="dd/MM/yyyy hh:mm:ss"
													type="text" name="startdate" id="startdate1" value="${sdate}"></input> <span
													class="add-on"> <i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											
										</div>
									</div>

									<div class="childsline1">
										<div class="control-group">
											<label class="control-label" for="date01">End Date</label>
											<div id="datetimepicker1" class="input-append date">
												<input  data-format="dd/MM/yyyy hh:mm:ss"
													type="text" name="enddate" id="enddate1" value="${edate}"></input> <span
													class="add-on"> <i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
									
									<div class="childsline1">
										<div class="inputline1">
											<label class="control-label" for="focusedInput">Ticket
												Number</label>
											<div class="controls">
												<input name="focusedInput" class="inputline1"
													id="focusedInput1" type="text" value="${focusedInput}">
											</div>
										</div>
									</div>
									
									<div class="childsline1">
										<div class="inputline1">
											<label class="control-label" for="focusedInput">Request
												Source</label>
											<div class="controls">
												<input name="Request-Source" class="inputline1" id="Request-Source1" type="text"
													value="${RequestSource}"></input>
											</div>
										</div>
									</div>
										<div class="childsline1">
										<div class="inputline1">
											<label class="control-label" for="focusedInput">Carrier/Route</label>
											<div class="controls">
												<input class="" name="carrier-route"
													id="carrier-route1" type="text" value="${carrierroute}">
											</div>
										</div>

									</div>
									<div class="childsline1">
										<div class="inputline1">
											<label class="control-label" for="selectError">Status</label>
											<div class="controls">
												<select  name="optionsRadios" id="optionsRadios1"
													value="${optionsRadios}">
													<option value="ALL"  ${optionsRadios == 'ALL' ? 'selected' : ''}>All</option>
													<option value="PASS" ${optionsRadios == 'PASS' ? 'selected' : ''}>Pass</option>
													<option value="FAIL" ${optionsRadios == 'FAIL' ? 'selected' : ''}>Fail</option>
												</select>

											</div>
										</div>
									</div>

								</div>

								<div class="clr"></div>
								<div class="parentline2 clearfix">
									<div class="box">
										<div class="control-group">
											<label class="control-label" for="selectError">
												Type Test</label>
												<div class="" style="">
													<label style="width:60px"><input type="checkbox" id="checkALl" onClick="selectAll(this)">
														 All</label>
												</div>
											<div id="container" class="clearfix">
											
												
												
													
												<div class="childtests">
													<label><input type="checkbox" name="type-test" id="type-test1"
														value="ANSWER_DETECT">ANSWER_DETECT</label>
												</div>
												
												
												<div class="childtests">
													<label><input type="checkbox" name="type-test" id="type-test1"
														value="Connectivity">Connectivity</label>
												</div>
												
												<div class="childtests">
													<label><input type="checkbox" name="type-test" id="type-test1"
														value="FAX">FAX</label>
												</div>
												
												
												<div class="childtests">
													<label><input type="checkbox" name="type-test" id="type-test1"
														value="VoiceQuality">VoiceQuality</label>
												</div>
												
												<div class="childtests">
													<label><input type="checkbox" name="type-test"  id="type-test1"
														value="FAS">FAS</label>
												</div>
												
												
												<div class="childtests">
													<label><input type="checkbox" name="type-test"  id="type-test1"
														value="Provisioning">Provisioning</label>
												</div>
												
												
												
											</div>
											<div id="container" class="clearfix">
											<div class="childtests clearfix" style="">
													<label><input type="checkbox" name="type-test" id="type-test1"
														value="Mobile">Mobile</label>
												</div>
											</div>
											
										</div>
									</div>
								</div>

								<div class="box span12"
									style="margin-left: 0px; margin-top: -25px;">
									
								</div>
								<div class="parentline1" style="margin-bottom: 20px;">
									<button type="submit" class="btn btn-primary click"
										href="#credits">Submit</button>
										<button id="summaryreport" type="submit" class="btn btn-primary click"
								           href="#downloadsummaryReport"
								           onClick=downloadSummaryReport()>Download
								              Summary Report</button>
								<button id="detailreport" type="submit" class="btn btn-primary click"
								href="#downloadDetailsReport"
								onClick=downloadDetailReport()>Download Detail Report
								
								</button>
								
						
						
								</div>
				
						 
							<div class="parentline2 pagination">
  <div class="">
										<div class="inputline1" style="width:70px !important;">
											<label class="control-label" for="selectError">Pager</label>
											<div class="controls">
												<input type ="number"  name="page" id="page" value="25">
											</div>
										</div>
									</div>
 <ul class="">
 
 
 <li id="PaginationTab"> 
 
      
     
 </li>
</ul>
</div>

							
					<div class="parentposts">
							<div id="newpost" class="mar-top20">
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable ">
									<thead>
										<tr>
											<th></th>
											<th>RecordID</th>
											<th>Testplan id</th>
											<th>Request id</th>
											<th>Test name</th>
											<th>Test file name</th>
											<th>Test Requested By</th>
											<th>File rcvd at</th>
											<th>File sent to_proc</th>
											<th>File Completed</th>
											<th>Test Duration</th>
											<th>Test Type</th>
											<th>No calls_req</th>
											<th>No calls_proc</th>
											<th>Country Name</th>
											<th>Country Code</th>
											<th>Start Range</th>
											<th>Carrier Spec</th>
											<th>Route Id</th>
											<th>Report Type</th>
											<th>Test Status</th>
											<th>Test Code</th>
											<th>Successful Calls</th>
											<th>Failed Calls</th>
											<th>test_code_desc</th>
										</tr>
									</thead>
									<tbody>${testlog}
									</tbody>
								</table>
	 					
							<span>${message1}</span><br>	
<li id="PaginationTabBottom"> 		
</form>
</div> 								
								
								
								

							</div>
							</div>
						</div>
						<!--/span-->
					</div>
				</div>
				<!--/row-->
				<!--/row-->
				<hr>
				<!-- end: Content -->
				<!--/#content.span10-->
			</div>
			<!--/fluid-row-->

			<div class="modal hide fade" id="myModal">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h3>Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here settings can be configured...</p>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#"
						class="btn btn-primary">Save changes</a>
				</div>
			</div>

			<div class="clearfix"></div>



		</div>
		<!--/.fluid-container-->
		
	</div>
<footer>
			<p>
				<span style="text-align: left; float: left">&copy; 2016 <a
					href="http://www.comlinkinc.com/index.html" target="_blank">Comlink, Inc. </a> all rights reserved
				</span>
			</p>

		</footer>
	<!-- start: JavaScript-->

	<script src="resources/js/jquery-1.7.2.min.js"></script>
	<script src="resources/js/jquery-ui-1.8.21.custom.min.js"></script>

	<script src="resources/js/bootstrap.js"></script>

	<script src="resources/js/jquery.cookie.js"></script>

	<script src='resources/js/fullcalendar.min.js'></script>

	<script src='resources/js/jquery.dataTables.min.js'></script>

	<script src="resources/js/excanvas.js"></script>
	<script src="resources/js/jquery.flot.min.js"></script>
	<script src="resources/js/jquery.flot.pie.min.js"></script>
	<script src="resources/js/jquery.flot.stack.js"></script>
	<script src="resources/js/jquery.flot.resize.min.js"></script>

	<script src="resources/js/jquery.chosen.min.js"></script>

	<script src="resources/js/jquery.uniform.min.js"></script>

	<script src="resources/js/jquery.cleditor.min.js"></script>

	<script src="resources/js/jquery.noty.js"></script>

	<script src="resources/js/jquery.elfinder.min.js"></script>

	<script src="resources/js/jquery.raty.min.js"></script>

	<script src="resources/js/jquery.iphone.toggle.js"></script>

	<script src="resources/js/jquery.uploadify-3.1.min.js"></script>

	<script src="resources/js/jquery.gritter.min.js"></script>

	<script src="resources/js/jquery.imagesloaded.js"></script>

	<script src="resources/js/jquery.masonry.min.js"></script>

	<script src="resources/js/jquery.knob.js"></script>

	<script src="resources/js/jquery.sparkline.min.js"></script>

	<script src="resources/js/custom.js"></script>

	

	<script
		src="resources/js/jquery.min.js"></script>
	<script
		src="resources/js/bootstrap.min.js"></script>


	<script src="resources/js/jquery1.min.js"></script>
<script src="resources/js/bootstrap1.min.js"></script>

	<script type="text/javascript"
		src="resources/js/bootstrap-datetimepicker1.min.js">
    </script>
	<script type="text/javascript"
		src="resources/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
	<script type="text/javascript">
	 $('#datetimepicker').datetimepicker({
    	        format: 'dd/MM/yyyy hh:mm:ss',
    	    });
    	     $('#datetimepicker1').datetimepicker({
    	           format: 'dd/MM/yyyy hh:mm:ss',
    	     });
    	     $( "#startdate" ).datepicker().datepicker( 'setDate', 'today');
    	     $( "#enddate" ).datepicker().datepicker( 'setDate', 'today'); 
    	    
       </script>
  <script>

	$( document ).ready(function() {
		
		pagenum= ${numpages}
		 page =${pageSize}
		 selectedPage = ${selectedPage}
		 console.log(page)
		 console.log("pagenum---"+pagenum)
		  console.log("selectedPage---"+selectedPage)
		var pageSize =  document.getElementById("page").value
		console.log(pageSize)
		 if(pageSize == 25){
		if(page != "" && page != null && page != 0){
			 $("#page").val(page);
		}
	}
		var pagecounter = 1;
		var pageOperation ="";
		var prevCount=0;
		var operation ="+";
		if(!isNaN(pagenum))
		{
			if(!isNaN(selectedPage))	{
				if(selectedPage>5)
				{
					prevCount = selectedPage-5;
					if(prevCount!=0){
						operation = "-";
					}
					else{
						operation="+";
					}
					
				}else{
					operation = "-";
				}
					
					
				pagecounter=selectedPage+1;
			}
			pageOperation =pagecounter + "SEP" + operation
			initPagination(pageOperation)
		} 
	    if($("#carrier-route").val()=="0"){
	    	$("#carrier-route").val("");
	    }

	    var pf = "${optionsRadios}";
	    $("#s-report").val(pf);
		var result = "${typetest}".substring(1, "${typetest}".length-1);
	    result = result.split(",");
	    for (var i = 0; i < result.length; i++) {
	    	result[i] = result[i].replace(/ /g,'');
	    	$(":checkbox").filter(function() {
	    		  return this.value == result[i];
	    	}).prop("checked","true");	
		}
		function initPagination(pageOperation){
			
			console.log("pageOperation--->>"+pageOperation)
			var strVar="";
			var bottampage = "";
			var vNext= "Next";
			var pagecount = pageOperation.split("SEP");
			pagecounter = parseInt(pagecount[0]);
			operation = pagecount[1]
			strVar += "<input type=\"hidden\" name=\"pagenum\" id =\"pagenum\"  > ";
			var limit=10;
			var vnextl=0;
			if(!isNaN(pagenum))	{
				if(operation == "+"){
				limit = pagecounter + 5;
				}else {	
					limit = pagecounter - 5;	
				}
			
				if(pagenum<limit){
					limit= pagenum
				}
				if(limit<=0){
					limit = 1
					pagecount[0] =5
				}
			}
			
			if(operation == "-"){
				 pagecounter =pagecounter-5;
				 if(pagecounter<=0){
					 pagecounter = 5
					}else{
				strVar += "<input type=button value=Prev onclick=\"onPrevious("+pagecounter+")\"> &nbsp";
				bottampage+="<input type=button value=Prev onclick=\"onPrevious("+pagecounter+")\"> &nbsp";
					}
			 }	
			if(operation == "+"){
			 for (var incr=pagecounter;incr<=limit-1; incr++){
				 strVar += "<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
				 bottampage+="<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
				 pagecounter =incr;
			 }
			} else{
				 for (var incr=limit;incr<=pagecount[0]; incr++){
					 strVar += "<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
					 bottampage+="<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
				 }
			}
			pagecounter = pagecounter+5
			console.log("pagecounter--->>"+pagecounter)
			console.log("pagenum--->>"+pagenum)
			 if( pagenum>=pagecounter){
			 strVar += "<input type=button value=\""+vNext+"\" onclick=\"onNext("+pagecounter+")\"> &nbsp";
			 bottampage+="<input type=button value=\""+vNext+"\" onclick=\"onNext("+pagecounter+")\"> &nbsp";
			 }
			console.log(strVar)
			 $('#PaginationTab').append(strVar);
			$('#PaginationTabBottom').append(bottampage);
			
			
		}
	});

	</script>

	<!-- end: JavaScript-->



	<script>
	
	function downloadDetailReport()
	{
		var startDate=document.getElementById("startdate1").value;
		var endDate=document.getElementById("enddate1").value;
		var focusedInput=document.getElementById("focusedInput1").value;
		var RequestSource=document.getElementById("Request-Source1").value;
		var carrierroute=document.getElementById("carrier-route1").value;
		var optionsRadios=document.getElementById("optionsRadios1").value;
	
		var checkboxes = document.getElementsByName("type-test");
  	 	var checkboxesChecked = [];
  	   
  	  for (var i=0; i<checkboxes.length; i++) {
  	      
  	     if (checkboxes[i].checked) {
  	        checkboxesChecked.push(checkboxes[i].value);
  	     }
  	  }

  	  
  	   	window.open("downloadDetailsReport?startdate="+startDate+"&enddate="+endDate+"&focusedInput="+focusedInput+
				"&Request-Source="+RequestSource+"&carrier-route="+carrierroute+"&type-test="+checkboxesChecked+"&optionsRadios="+optionsRadios);

	}
	function downloadSummaryReport()
	{
		 var form = document.getElementById('myForm');
		var startDate=document.getElementById("startdate1").value;
		var endDate=document.getElementById("enddate1").value;
		var focusedInput=document.getElementById("focusedInput1").value;
		var RequestSource=document.getElementById("Request-Source1").value;
		var carrierroute=document.getElementById("carrier-route1").value;
		//var typetest=document.getElementById("type-test1").value;
		var optionsRadios=document.getElementById("optionsRadios1").value;
		
	 
		        
		            
		            	  var checkboxes = document.getElementsByName("type-test");
		            	  var checkboxesChecked = [];
		            	  
		            	  for (var i=0; i<checkboxes.length; i++) {
		            	      
		            	     if (checkboxes[i].checked) {
		            	        checkboxesChecked.push(checkboxes[i].value);
		            	     }
		            	  }
		            	  
		            	   

		      	window.open("downloadsummaryReport?startdate="+startDate+"&enddate="+endDate+"&focusedInput="+focusedInput+
				"&Request-Source="+RequestSource+"&carrier-route="+carrierroute+"&type-test="+checkboxesChecked+"&optionsRadios="+optionsRadios);

	}
	 
    function showhide()
     {
        var div = document.getElementById("newpost");
    if (div.style.display !== "none") {
        div.style.display = "none";
    }
    else {
        div.style.display = "block";
    }
     }
  </script>
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker({
			});
		});
		 
	</script>
	<script>

function ajaxcall(id){
	alert(id);
	$.ajax({
		type : "POST",		
		contentType : "application/json",
		url : "getSearchResult.html",
		dataType: "resources/jsON",
		data : {
	        "id" : id
	    },				
		success : function(data) {
			console.log("SUCCESS: ", data);
			//display(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			//display(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}


$( document ).ready(function() {
    if($("#carrier-route").val()=="0"){
    	$("#carrier-route").val("");
    }
});

function selectAll(source) {
	  checkboxes = document.getElementsByName('type-test');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}

function ajaxcall1(id){
	alert(id);
	$.ajax({
		type : "POST",		
		contentType : "application/json",
		url : "getSearchResult.html",
		dataType: "resources/jsON",
		data : {
	        "id" : id
	    },				
		success : function(data) {
			console.log("SUCCESS: ", data);
			//display(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			//display(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}
	
	





function onPageClick(pagenumber){ 
	document.form1.pagenum.value=pagenumber-1;
	form1.submit();
}
function onNext(pagecounter){
	var strVar="";
	var  bottampage = "";
	var vNext= "Next";
	strVar += "<input type=\"hidden\" name=\"pagenum\" id =\"pagenum\"  > ";
	strVar += "<input type=button value=Prev onclick=\"onPrevious("+pagecounter+")\"> &nbsp";
	bottampage+="<input type=button value=Prev onclick=\"onPrevious("+pagecounter+")\"> &nbsp";
	var limit=10;
console.log("pagecounter--Before --->>"+pagecounter)
	if(!isNaN(pagenum))	{
		limit = pagecounter + 5;
		if(pagenum<limit){
			limit= pagenum
		}
	}
	
	if(limit == pagecounter){
		pagecounter = pagecounter-5	
	}
 
	 for (var incr=pagecounter+1;incr<=limit; incr++){
		 strVar += "<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
		 bottampage+="<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
		 pagecounter =incr;

	 }

	 if( pagenum>limit ){
		 strVar += "<input type=button value=\""+vNext+"\" onclick=\"onNext("+pagecounter+")\"> &nbsp";
		 bottampage+="<input type=button value=\""+vNext+"\" onclick=\"onNext("+pagecounter+")\"> &nbsp";
		 }

	 $('#PaginationTab').html(strVar);
	 $('#PaginationTabBottom').html(bottampage);
 
}

function onPrevious(pagecounter){
	var strVar="";
	var vNext= "Next";
	var bottampage = "";
	strVar += "<input type=\"hidden\" name=\"pagenum\" id =\"pagenum\"  > ";
	bottampage +="<input type=\"hidden\" name=\"pagenum\" id =\"pagenum\"  > ";
	var pageprev=pagecounter;

	var limit = 5
	if(!isNaN(pagenum))	{
		pageprev = pagecounter - 5;
		
		if(pagenum<pageprev){
			pageprev= pagenum
		}
		limit = pagecounter
		if(limit<5){
			limit = 5
		}
	}
	if(pageprev<0)
		pageprev=0

		 if( pageprev !=0 && pageprev>0 ){
			 pagecounter =pagecounter-5;
			 if(pagecounter<5){
				 pagecounter = 5
				}
	strVar += "<input type=button value=Prev onclick=\"onPrevious("+pagecounter+")\"> &nbsp";
	bottampage += "<input type=button value=Prev onclick=\"onPrevious("+pagecounter+")\"> &nbsp";
		 }

	for (var incr=pageprev+1;incr<=limit; incr++){
		 strVar += "<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
		 bottampage += "<input type=button value=\""+incr+"\" onclick=\"onPageClick("+incr+")\"> &nbsp";
		 
	 }
	 if( pagenum>pagecounter ){
		 strVar += "<input type=button value=\""+vNext+"\" onclick=\"onNext("+pagecounter+")\"> &nbsp";
		 bottampage += "<input type=button value=\""+vNext+"\" onclick=\"onNext("+pagecounter+")\"> &nbsp";
		 } 
		$('#PaginationTab').html(strVar);
		$('#PaginationTabBottom').html(bottampage);
		
}

</script>
 

</body>
</html>


