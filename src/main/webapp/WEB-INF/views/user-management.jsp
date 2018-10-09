<%@page import="com.comlink.model.User"%>
<%@page import="com.comlink.controller.MasterController"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%><head>


<!DOCTYPE html>
<html lang="en">
<head>


<!-- start: Meta -->
<meta charset="utf-8">
<title>Comlink | Profile</title>
<meta name="description" content="Comlink">
<meta name="author" content="Comlink">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->

<link
	href="resources/css/bootstrap-combined1.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="resources/css/bootstrap-datetimepicker2.min.css">
<link id="bootstrap-style" href="resources/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/css/jquery.dataTables.min.css">
<link href="resources/css/bootstrap.css" rel="stylesheet">
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
	<![endif]-->
<!--[if IE 8 ]>
	<link id="ie-style" href="resources/css/style-ie.css" rel="stylesheet">
	<![endif]-->
<!--[if IE 9 ]>
	<![endif]-->

<!-- end: CSS -->
<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon" href="resources/img/favicon.ico">
<!-- end: Favicon -->
<style>
.clr {
	clear: both;
}

.toolbar {
	float: right;
}

.dataTables_filter {
	width: 35%;
	margin-right: 20px;
	float: right;
	text-align: right;
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
										class="icon-user"></i><span class="hidden-tablet">User
											Management </span></a></li>
								<%}%>
								<li><a href="changepassword.html"><i class="icon-user"></i>
										Change Password</a></li>
								<li><a href="logout"><i
										class="icon-off"></i>Logout</a></li>
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
		<div class="row-fluid" style=" position: unset; width: 3000px; padding-left: 10px;">

			<!-- start: Main Menu -->
			<div class="span2 main-menu-span">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="summary-report"><i
								class="icon-tasks icon-white"></i><span class="hidden-tablet">Reports</span></a></li>
								
								<li><a href="addnum"><i class="icon-tasks icon-white"></i>
								<span class="hidden-tablet">Add Numbers</span></a></li>	
					</ul>
				</div>

				<!--/.well -->
			</div>
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
							<li><a href="#">User Management</a></li>

						</ul>
					</div>
					<div class="span3"></div>
					<hr>
				</div>
               <div class="row-fluid sortable">
					<div class="box span6" style="width: 38%">
						<div class="box-header" data-original-title="">
							<h2>
								<i class="icon-edit"></i><span class="break"></span>User
								Management &nbsp; &nbsp; &nbsp;
								<span>${message}</span>
							</h2>
							
						</div>

						<div class="box-content">
							<button type="submit" class="btn btn-primary click" data-toggle="modal" data-target="#addUser" data-backdrop="static" data-keyboard="false" style="float: right;"> 
							<i class="fa fa-plus-circle">Add User</i></button>								
							<div id="newpost" class="mar-top20">
								<table id="tableID" 
									class="table table-striped table-bordered bootstrap-datatable datatable ">

									<thead>

										<tr>
											<th>First Name</th>
											<th>Last Name</th>
											<th>User Name</th>
											<th>User Type</th>
											<th>Action</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList}">
											<c:if test="${userID != user.id}">
												<tr>

													<td>${user.firstName}</td>
													<td>${user.lastName}</td>
													<td>${user.userName}</td>
													<c:if test="${user.type == 1}">
														<td>Admin</td>
													</c:if>
													<c:if test="${user.type != 1}">
														<td>General</td>
													</c:if>
													<td><button data-target="#edit" data-toggle="modal" type="button"
															class="btn btn-primary click" value="Edit"
															onClick="edit('${user.id}','${user.firstName}','${user.lastName}','${user.userName}','${user.type}')">Edit</button>
														<button type="button" class="btn btn-primary click"
															value="Delete" onClick="deleteUser('${user.id}')">Delete</button>
													</td>

												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>

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
					<button type="button" class="close" data-dismiss="modal">Ã</button>
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
					href="http://www.comlinkinc.com/index.html" target="_blank">Comlink,
						Inc. </a> all rights reserved
				</span>
			</p>

		</footer>

	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="delete-domain" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Edit User</h4>
				</div>
				<form id="editForm" class="form-horizontal" method="POST"
					name="registerForm" action="user-management">
					<div class="modal-body">
						<input type="hidden" id="userID" name="userID" /> <input
							type="hidden" name="action" value="edit">
						<div class="form-group">
							<label class="col-sm-3 control-label">* FirstName</label>
							<div class="col-sm-8">
								<input id="firstName" name="firstname" class="form-control"
									maxlength="50" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label">* LastName</label>
							<div class="col-sm-8">
								<input id="lastName" name="lastname" class="form-control"
									maxlength="50" required />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label">* UserName</label>
							<div class="col-sm-8">
								<input id="userName" name="username" class="form-control"
									maxlength="50" required />
							</div>
						</div>
						<br>
						
					</div>
					<div class="modal-footer text-center">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Cancel</button>
						<input type="submit" id="submit1" class="btn btn-sky btn-sm"
							value="Update">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addUser" tabindex="-1" role="dialog"
		aria-labelledby="delete-domain" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<center>Add User</center>
					</h4>
				</div>

				<form class="form-horizontal" method="post" name="registerForm"
					action="user-management"
					onsubmit="return valiadateUsername(this);">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">* First Name : </label>
							<div class="col-sm-8">
								<input name="firstname" class="form-control" maxlength="50"
									required />
							</div>
						</div>
						<br> <input type="hidden" name="action" value="add">
						<div class="form-group">
							<label class="col-sm-3 control-label">* Last Name : </label>
							<div class="col-sm-8">
								<input name="lastname" class="form-control" maxlength="50"
									required />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label">* Username : </label>
							<div class="col-sm-8">
								<input name="username" class="form-control alphaNumHyphen" maxlength="25"
									required id=user/>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label">* Password : </label>
							<div class="col-sm-8">
								<input name="password" id="password1" type="password"
									class="form-control" maxlength="25" required
									style="width: 204px;height:30px;" />
							</div>
						</div>
						<br>
						<div class="form-group clearfix">
							<label class="col-sm-3 control-label">*Confirm Password :
							</label>
							<div class="col-sm-8">
								<input name="password1" id="password2" type="password"
									class="form-control" maxlength="25" required
									style="width: 204px; height:30px;" />
							</div>
							</div>
							<div class="form-group clearfix">
							<label class="col-sm-3 control-label" style="visibility:hidden"> </label>
							<div class="col-sm-8">
								<span id='message'></span>
							</div>
						</div>
							<br>
						
				
						<div class="form-group">
							<label class="col-sm-3 control-label">* Account Type :</label>
							<div class="col-sm-8">
								<select name="acctype" class="form-control"
									style="width: 209px;" required>
									<option value="">Select</option>
									<option value="1">Admin</option>
									<option value="0">General</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer text-center">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Cancel</button>
						<button type="submit" id="submit"  class="btn btn-sky btn-sm">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

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
    <script src="resources/js/jquery2.min.js"></script>
    <script src="resources/js/bootstrap2.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery3.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap3.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap-datetimepicker2.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap-datetimepicker1.pt-BR.js"></script>
	<script type="text/javascript">
      $('#datetimepicker').datetimepicker({
        format: 'dd/MM/yyyy hh:mm:ss',
        //language: 'pt-BR'
      });
    </script>
	<script>

	$( document ).ready(function() {
	
		$('#tableID').DataTable({
			"aoColumnDefs": [
				{ "bSearchable": false, "aTargets": [ 3 ] }],
				  language: {
        searchPlaceholder: "Enter First Name, Last Name or Username to Search"
    }
			
});
 $("div.toolbar").html('<b>Search By Username,Firstname or lastname</b>');
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
	    
	});

	</script>

	<!-- end: JavaScript-->
  <script>
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
</body>
</html>
<script>
$(function() {
	$("#SnapHost_Calendar2").datepicker({
		showOn : 'both',
		buttonImage : 'resources/img/calendar.gif',
		buttonImageOnly : true,
		changeMonth : true,
		showOtherMonths : true,
		selectOtherMonths : true
	});
});
</script>

<script>
$('#password1, #password2').on('keyup', function () {
    if ($('#password1').val() == $('#password2').val()) {
        $('#message').html('Matching').css('color', 'green');
        $("#submit").prop('disabled',false);
    } else {
        $('#message').html('Not Matching').css('color', 'red');
    	$("#submit").prop('disabled', true);
}
});

$('#password3, #password4').on('keyup', function () {
    if ($('#password3').val() == $('#password4').val()) {
        $('#message1').html('Matching').css('color', 'green');
        $("#submit1").prop('disabled',false);
    } else {
        $('#message1').html('Not Matching').css('color', 'red');
    	$("#submit1").prop('disabled', true);
}
});

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
	alert("hello")
	
    if($("#carrier-route").val()=="0"){
    	$("#carrier-route").val("");
    }
});
fo
function edit(id,firstName,lastName,userName,type){
	
	$("#userID").val(id);
	$("#firstName").val(firstName);
	$("#lastName").val(lastName);
	$("#userName").val(userName);
	$("#type").val(type);
	$('#edit').modal({backdrop: 'static', keyboard: false})
	$("#edit").modal('show');
}


function deleteUser(id){
	
	var userID = id;
	 var result = confirm("Are you sure, you want to delete extintor(s)?");
	 if(result){
		
				 window.location.href = "user-management?id="+id;
	}
}

function valiadateUsername()
{
	 if (registerForm.username.value.match(/@|!/)) {
		   alert('You have special characters on username field.');
		  return false;
		}
  return true;
	
	}

 
 
 
 $(function() {
	 $('#submit').click(function() {
	 var txt = $('#user').val();
	 var re = /^[ A-Za-z0-9_@./#&+-]*$/
	 if (re.test(txt)) {
	 alert('Please Enter Valid Text');
	 }
	 else {
		 alert('Valid Text')

	 return false;
	 }
	 })
	 })

</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>

<script src="resources/js/jquery1.dataTables.min.js"></script>
