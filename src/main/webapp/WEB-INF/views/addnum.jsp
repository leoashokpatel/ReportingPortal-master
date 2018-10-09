<%@page import="com.comlink.controller.MasterController"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- start: Meta -->
<meta charset="utf-8">
<title>Comlink | Add Numbers</title>
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
								<li><a href="logout"><i class="icon-off"></i>Logout</a></li>
								
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
							<li><a href="#">Add Number</a></li>

						</ul>
					</div>
					<div class="span3"></div>
					<hr>
				</div>



				<div class="row-fluid sortable">
					<div class="parentrightreport span4">
						<div class="box-header" data-original-title="">
							<h2>
								<i class="icon-edit"></i><span class="break"></span>Add number
							</h2>
							&nbsp;&nbsp;&nbsp;<center><h4>${message}</h4></center>
						</div>

						<div class="box-content">

							<form class="marginauto" action="addnum.html" method="post">
								<div class="parentline1 box span6 clearfix" style="margin-bottom:0;">
									
									
									<div class="">
										<div class="">
											<label class="control-label" for="focusedInput">Company Name:
												</label>
											<div class="controls">
												<input name="company" class="" required placeholder="Enter Company name.."
													id="company" type="text" value="">
											</div>
										</div>
									</div>
									<div class="">
										<div class="">
											<label class="control-label" >Country:</label>
											<div class="controls">
												<select name="country">
  <option value="Afghanistan">Afghanistan</option>
    <option value="Albania">Albania</option>
    <option value="Algeria">Algeria</option>
    <option value="American Samoa">American Samoa</option>
    <option value="Andorra">Andorra</option>
    <option value="Angola">Angola</option>
    <option value="Anguilla">Anguilla</option>
    <option value="Antartica">Antarctica</option>
    <option value="Antigua and Barbuda">Antigua and Barbuda</option>
    <option value="Argentina">Argentina</option>
    <option value="Armenia">Armenia</option>
    <option value="Aruba">Aruba</option>
    <option value="Australia">Australia</option>
    <option value="Austria">Austria</option>
    <option value="Azerbaijan">Azerbaijan</option>
    <option value="Bahamas">Bahamas</option>
    <option value="Bahrain">Bahrain</option>
    <option value="Bangladesh">Bangladesh</option>
    <option value="Barbados">Barbados</option>
    <option value="Belarus">Belarus</option>
    <option value="Belgium">Belgium</option>
    <option value="Belize">Belize</option>
    <option value="Benin">Benin</option>
    <option value="Bermuda">Bermuda</option>
    <option value="Bhutan">Bhutan</option>
    <option value="Bolivia">Bolivia</option>
    <option value="Bosnia and Herzegowina">Bosnia and Herzegowina</option>
    <option value="Botswana">Botswana</option>
    <option value="Bouvet Island">Bouvet Island</option>
    <option value="Brazil">Brazil</option>
    <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
    <option value="Brunei Darussalam">Brunei Darussalam</option>
    <option value="Bulgaria">Bulgaria</option>
    <option value="Burkina Faso">Burkina Faso</option>
    <option value="Burundi">Burundi</option>
    <option value="Cambodia">Cambodia</option>
    <option value="Cameroon">Cameroon</option>
    <option value="Canada">Canada</option>
    <option value="Cape Verde">Cape Verde</option>
    <option value="Cayman Islands">Cayman Islands</option>
    <option value="Central African Republic">Central African Republic</option>
    <option value="Chad">Chad</option>
    <option value="Chile">Chile</option>
    <option value="China">China</option>
    <option value="Christmas Island">Christmas Island</option>
    <option value="Cocos Islands">Cocos (Keeling) Islands</option>
    <option value="Colombia">Colombia</option>
    <option value="Comoros">Comoros</option>
    <option value="Congo">Congo</option>
    <option value="Congo">Congo, the Democratic Republic of the</option>
    <option value="Cook Islands">Cook Islands</option>
    <option value="Costa Rica">Costa Rica</option>
    <option value="Cota D'Ivoire">Cote d'Ivoire</option>
    <option value="Croatia">Croatia (Hrvatska)</option>
    <option value="Cuba">Cuba</option>
    <option value="Cyprus">Cyprus</option>
    <option value="Czech Republic">Czech Republic</option>
    <option value="Denmark">Denmark</option>
    <option value="Djibouti">Djibouti</option>
    <option value="Dominica">Dominica</option>
    <option value="Dominican Republic">Dominican Republic</option>
    <option value="East Timor">East Timor</option>
    <option value="Ecuador">Ecuador</option>
    <option value="Egypt">Egypt</option>
    <option value="El Salvador">El Salvador</option>
    <option value="Equatorial Guinea">Equatorial Guinea</option>
    <option value="Eritrea">Eritrea</option>
    <option value="Estonia">Estonia</option>
    <option value="Ethiopia">Ethiopia</option>
    <option value="Falkland Islands">Falkland Islands (Malvinas)</option>
    <option value="Faroe Islands">Faroe Islands</option>
    <option value="Fiji">Fiji</option>
    <option value="Finland">Finland</option>
    <option value="France">France</option>
    <option value="France Metropolitan">France, Metropolitan</option>
    <option value="French Guiana">French Guiana</option>
    <option value="French Polynesia">French Polynesia</option>
    <option value="French Southern Territories">French Southern Territories</option>
    <option value="Gabon">Gabon</option>
    <option value="Gambia">Gambia</option>
    <option value="Georgia">Georgia</option>
    <option value="Germany">Germany</option>
    <option value="Ghana">Ghana</option>
    <option value="Gibraltar">Gibraltar</option>
    <option value="Greece">Greece</option>
    <option value="Greenland">Greenland</option>
    <option value="Grenada">Grenada</option>
    <option value="Guadeloupe">Guadeloupe</option>
    <option value="Guam">Guam</option>
    <option value="Guatemala">Guatemala</option>
    <option value="Guinea">Guinea</option>
    <option value="Guinea-Bissau">Guinea-Bissau</option>
    <option value="Guyana">Guyana</option>
    <option value="Haiti">Haiti</option>
    <option value="Heard and McDonald Islands">Heard and Mc Donald Islands</option>
    <option value="Holy See">Holy See (Vatican City State)</option>
    <option value="Honduras">Honduras</option>
    <option value="Hong Kong">Hong Kong</option>
    <option value="Hungary">Hungary</option>
    <option value="Iceland">Iceland</option>
    <option value="India">India</option>
    <option value="Indonesia">Indonesia</option>
    <option value="Iran">Iran (Islamic Republic of)</option>
    <option value="Iraq">Iraq</option>
    <option value="Ireland">Ireland</option>
    <option value="Israel">Israel</option>
    <option value="Italy">Italy</option>
    <option value="Jamaica">Jamaica</option>
    <option value="Japan">Japan</option>
    <option value="Jordan">Jordan</option>
    <option value="Kazakhstan">Kazakhstan</option>
    <option value="Kenya">Kenya</option>
    <option value="Kiribati">Kiribati</option>
    <option value="Democratic People's Republic of Korea">Korea, Democratic People's Republic of</option>
    <option value="Korea">Korea, Republic of</option>
    <option value="Kuwait">Kuwait</option>
    <option value="Kyrgyzstan">Kyrgyzstan</option>
    <option value="Lao">Lao People's Democratic Republic</option>
    <option value="Latvia">Latvia</option>
    <option value="Lebanon" selected>Lebanon</option>
    <option value="Lesotho">Lesotho</option>
    <option value="Liberia">Liberia</option>
    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    <option value="Liechtenstein">Liechtenstein</option>
    <option value="Lithuania">Lithuania</option>
    <option value="Luxembourg">Luxembourg</option>
    <option value="Macau">Macau</option>
    <option value="Macedonia">Macedonia, The Former Yugoslav Republic of</option>
    <option value="Madagascar">Madagascar</option>
    <option value="Malawi">Malawi</option>
    <option value="Malaysia">Malaysia</option>
    <option value="Maldives">Maldives</option>
    <option value="Mali">Mali</option>
    <option value="Malta">Malta</option>
    <option value="Marshall Islands">Marshall Islands</option>
    <option value="Martinique">Martinique</option>
    <option value="Mauritania">Mauritania</option>
    <option value="Mauritius">Mauritius</option>
    <option value="Mayotte">Mayotte</option>
    <option value="Mexico">Mexico</option>
    <option value="Micronesia">Micronesia, Federated States of</option>
    <option value="Moldova">Moldova, Republic of</option>
    <option value="Monaco">Monaco</option>
    <option value="Mongolia">Mongolia</option>
    <option value="Montserrat">Montserrat</option>
    <option value="Morocco">Morocco</option>
    <option value="Mozambique">Mozambique</option>
    <option value="Myanmar">Myanmar</option>
    <option value="Namibia">Namibia</option>
    <option value="Nauru">Nauru</option>
    <option value="Nepal">Nepal</option>
    <option value="Netherlands">Netherlands</option>
    <option value="Netherlands Antilles">Netherlands Antilles</option>
    <option value="New Caledonia">New Caledonia</option>
    <option value="New Zealand">New Zealand</option>
    <option value="Nicaragua">Nicaragua</option>
    <option value="Niger">Niger</option>
    <option value="Nigeria">Nigeria</option>
    <option value="Niue">Niue</option>
    <option value="Norfolk Island">Norfolk Island</option>
    <option value="Northern Mariana Islands">Northern Mariana Islands</option>
    <option value="Norway">Norway</option>
    <option value="Oman">Oman</option>
    <option value="Pakistan">Pakistan</option>
    <option value="Palau">Palau</option>
    <option value="Panama">Panama</option>
    <option value="Papua New Guinea">Papua New Guinea</option>
    <option value="Paraguay">Paraguay</option>
    <option value="Peru">Peru</option>
    <option value="Philippines">Philippines</option>
    <option value="Pitcairn">Pitcairn</option>
    <option value="Poland">Poland</option>
    <option value="Portugal">Portugal</option>
    <option value="Puerto Rico">Puerto Rico</option>
    <option value="Qatar">Qatar</option>
    <option value="Reunion">Reunion</option>
    <option value="Romania">Romania</option>
    <option value="Russia">Russian Federation</option>
    <option value="Rwanda">Rwanda</option>
    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
    <option value="Saint LUCIA">Saint LUCIA</option>
    <option value="Saint Vincent">Saint Vincent and the Grenadines</option>
    <option value="Samoa">Samoa</option>
    <option value="San Marino">San Marino</option>
    <option value="Sao Tome and Principe">Sao Tome and Principe</option> 
    <option value="Saudi Arabia">Saudi Arabia</option>
    <option value="Senegal">Senegal</option>
    <option value="Seychelles">Seychelles</option>
    <option value="Sierra">Sierra Leone</option>
    <option value="Singapore">Singapore</option>
    <option value="Slovakia">Slovakia (Slovak Republic)</option>
    <option value="Slovenia">Slovenia</option>
    <option value="Solomon Islands">Solomon Islands</option>
    <option value="Somalia">Somalia</option>
    <option value="South Africa">South Africa</option>
    <option value="South Georgia">South Georgia and the South Sandwich Islands</option>
    <option value="Span">Spain</option>
    <option value="SriLanka">Sri Lanka</option>
    <option value="St. Helena">St. Helena</option>
    <option value="St. Pierre and Miguelon">St. Pierre and Miquelon</option>
    <option value="Sudan">Sudan</option>
    <option value="Suriname">Suriname</option>
    <option value="Svalbard">Svalbard and Jan Mayen Islands</option>
    <option value="Swaziland">Swaziland</option>
    <option value="Sweden">Sweden</option>
    <option value="Switzerland">Switzerland</option>
    <option value="Syria">Syrian Arab Republic</option>
    <option value="Taiwan">Taiwan, Province of China</option>
    <option value="Tajikistan">Tajikistan</option>
    <option value="Tanzania">Tanzania, United Republic of</option>
    <option value="Thailand">Thailand</option>
    <option value="Togo">Togo</option>
    <option value="Tokelau">Tokelau</option>
    <option value="Tonga">Tonga</option>
    <option value="Trinidad and Tobago">Trinidad and Tobago</option>
    <option value="Tunisia">Tunisia</option>
    <option value="Turkey">Turkey</option>
    <option value="Turkmenistan">Turkmenistan</option>
    <option value="Turks and Caicos">Turks and Caicos Islands</option>
    <option value="Tuvalu">Tuvalu</option>
    <option value="Uganda">Uganda</option>
    <option value="Ukraine">Ukraine</option>
    <option value="United Arab Emirates">United Arab Emirates</option>
    <option value="United Kingdom">United Kingdom</option>
    <option value="United States" selected>United States</option>
    <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    <option value="Uruguay">Uruguay</option>
    <option value="Uzbekistan">Uzbekistan</option>
    <option value="Vanuatu">Vanuatu</option>
    <option value="Venezuela">Venezuela</option>
    <option value="Vietnam">Viet Nam</option>
    <option value="Virgin Islands (British)">Virgin Islands (British)</option>
    <option value="Virgin Islands (U.S)">Virgin Islands (U.S.)</option>
    <option value="Wallis and Futana Islands">Wallis and Futuna Islands</option>
    <option value="Western Sahara">Western Sahara</option>
    <option value="Yemen">Yemen</option>
    <option value="Yugoslavia">Yugoslavia</option>
    <option value="Zambia">Zambia</option>
    <option value="Zimbabwe">Zimbabwe</option>
													</select>
											</div>
										</div>

									</div>
									<div class="">
										<div class="">
											<label class="control-label" for="focusedInput">Number:
												</label>
											<div class="controls">
												<input name="number" type="number" placeholder="Enter Number.." class="" id="Request Source" required type="text"
													value="" />
											</div>
										</div>
									</div>
										
									<div id="" class="">
											<div class="">
										<div class="">
											<label class="control-label" >Country:</label>
											<div class="controls">
												<select  name="type-test">
												  <option value="FAX">FAX</option>
												    <option value="ANSWER_DETECT">ANSWER_DETECT</option>
   
													</select>
											</div>
										</div>

									</div>
												
												
													
											
												
									</div>

								</div>

								<div class="clr"></div>
								

								
								<div class="" style="margin-bottom: 20px;">
									<button type="submit" class="btn btn-primary click"
										href="#credits">Submit</button>&nbsp;
										<a class="btn btn-primary click"
										href="addnum.html">Cancel</a>
										
								
								
								</div>
				
							</form>
							

							
					
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
					<button type="button" class="close" data-dismiss="modal">x</button>
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
	function downloadDetailReport()
	{
		var startDate=document.getElementById("startdate").value;
		var endDate=document.getElementById("enddate").value;
		var focusedInput=document.getElementById("focusedInput");
		var RequestSource=document.getElementById("Request Source");
		var carrierroute=document.getElementById("carrier-route");
		var typetest=document.getElementById("type-test");
		var optionsRadios=document.getElementById("optionsRadios");
		
		window.open("downloadDetailsReport?startdate="+startDate+"&enddate="+endDate+"&focusedInput="+focusedInput+
				"&Request Source="+RequestSource+"carrier-route="+carrierroute+"&type-test="+typetest+"&optionsRadios="+optionsRadios);

	}
	function downloadSummaryReport()
	{
		var startDate=document.getElementById("startdate").value;
		var endDate=document.getElementById("enddate").value;
		var focusedInput=document.getElementById("focusedInput");
		var RequestSource=document.getElementById("Request Source");
		var carrierroute=document.getElementById("carrier-route");
		var typetest=document.getElementById("type-test");
		var optionsRadios=document.getElementById("optionsRadios");
		
		window.open("downloadsummaryReport?startdate="+startDate+"&enddate="+endDate+"&focusedInput="+focusedInput+
				"&Request Source="+RequestSource+"carrier-route="+carrierroute+"&type-test="+typetest+"&optionsRadios="+optionsRadios);

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
	};
	
	

</script>
</body>
</html>


