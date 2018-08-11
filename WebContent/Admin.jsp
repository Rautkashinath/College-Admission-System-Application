<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>College Admission</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
		<link rel="stylesheet" href="css/Admin.css"/>
		
</head>
<body>

<!-- -----------------Session Handling---------------------- -->
<%
	//allow access only if session exists
	String user = null;
	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("login.jsp");
	}
	%>
<%
		String msg=(String)request.getAttribute("error");  
		if(msg!=null)
		{
			out.println("<center><font color=red size=4px>"+msg+"</font></center>");
		}
	%>
<!-- --------------------Navigation Bar---------------------- -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><h2>College Admission System</h2></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a style="color:sandybrown;margin-right:50px;font-size:20px;" href="<%=request.getContextPath()%>/Logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- -------------------Sections--------------------------- -->

	<div class="bs-example">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#sectionA">Register Student</a></li>
			<li><a data-toggle="tab" href="#sectionB">View Report</a></li>
		</ul>
		<div class="tab-content">
		
		
<!-- ------------------Section A:Registeration --------------------->

			<div id="sectionA" class="tab-pane fade in active">
				<div class="Register-form">
					<form action="datainserthandler" method="post">
						<h2>Apply For Course</h2>
						<div class="form-group">
							<div class="row">
								<div class="col-lg-4"><input type="text" class="form-control" name="first_name" placeholder="First Name" 
									required="required"></div>
								<div class="col-lg-4"><input type="text" class="form-control" name="last_name" placeholder="Last Name" 
									required="required"></div>
									<div class="col-lg-4 col-sm-12"><input type="text" class="form-control" name="father_name" placeholder="Father's Name" required="required"></div>
							</div>      
						</div>
						
						<div class="form-group">
							<div class="row">
								<div class="col-lg-4 col-sm-12"><input type="text" class="form-control" name="mother_name" placeholder="Mother's Name" 
								required="required"></div>
								<div class="col-lg-4 col-sm-12"><input  id="date1" class="form-control" name="dob" placeholder="Date Of Birth" required="required"></div>
					
								<div class="col-lg-4 col-sm-12"><input type="number" class="form-control" name="mobile" placeholder="Mobile Number" required="required"></div>
							</div>  
						</div>
		
						<div class="form-group">
							<div class="row">
									<div class="col-lg-4 col-sm-12"><input type="email" class="form-control" name="mail" placeholder="Email" 
								required="required"></div>
								<div class="col-lg-4">
									
										<select class="form-control" id="selection" name="gender" required="required">
										<option selected disabled>--Gender--</option>
										<option>Male</option>
										<option>Female</option>
										</select>
								</div>
							</div>
						</div>
		
						<div class="form-group">
							
						</div>
					
						<div class="row">
						<div class="form-group">
							<div class="col-lg-4 "><textarea class="form-control" rows="2" name="addr" placeholder="Address" required="required"></textarea></div>
							<div class="col-lg-4"><input type="number" step=0.01 class="form-control" name="ssc_perc" placeholder="SSC Percentage" required="required"></div>
							<div class="col-lg-4"><input type="number" step=0.01 class="form-control" name="hsc_perc" placeholder="HSC or diploma Percentage" required="required"></div>
						</div>
						</div>
					
						<br>

							<div class="row">
							<div class="col-lg-4">
									<select class="form-control" id="selection" name="select_course" required="required">
										<option selected disabled>--Select Course--</option>
										<option>Mechanical</option>
										<option>Computer</option>
										<option>Civil</option>
										<option>Production</option>
									</select>
							</div>
								<div class="col-lg-4"><input id="date1" name="doa" class="form-control"  placeholder="Date Of Admission" required="required"></div>
								<div class="col-lg-4">
									<select class="form-control"  name="ac_year"  id="year">
										<option selected disabled>--Academic Year--</option>
									
									</select>
								</div>
							</div>
					
						<div class="form-group">
							<center><button type="submit" class="btn btn-success btn-lg">Register</button></center>
						</div>
					</form>
				</div>
			</div>	
 
 
 
 <!--------- --------------Section B:Report--------- ---------------- -->
 
			<div id="sectionB" class="tab-pane fade">    
			<br>
				<div class="container">
					<div class="pull-right">
					<div class="col-lg-1">
						<p>Filter by:</p>
					</div>
							<div class="col-lg-3">
									<select class="form-control" id="courseSelector" onChange="myFunction()">
										<option>Course</option>
										<option>Mechanical</option>
										<option>Computer</option>
										<option>Civil</option>
										<option>Production</option>
									</select>
							</div>
							<div class="col-lg-4">
									<select class="form-control" id="yearSelector" onChange="myFunction()">
										
									</select>
							</div>
							<div class="col-lg-4">
										<input id="dateSelector" name="date" class="form-control" placeholder="Date Of Admission" onchange="myFunction()">
	
							</div>
							
					</div>
				
				<table id="mytable" class="table table-striped table-bordered" width="auto">
						<tr>	
							<th>Student ID</th>	
							<th>Name</th>
							<th>Course</th>
							<th>Academic Year</th>
							<th>Admission Date</th>
						</tr>
									
				</table>
				<center><div norecord id="records">No Records found</div></center>
			</div>
		</div>
	</div>
</div>	
	
<!--- -----------------footer-------------------------- -->

<div class="footer">
<footer class="page-footer font-small blue pt-4">
    <div class="container-fluid text-center text-md-left">
      <div class="row">
        <hr class="clearfix w-100 d-md-none pb-3">
        <div class="col-md-3 mb-md-0 mb-3"></div>
      </div>
    </div>
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
      <a href="https://college.com"> Admissionsystem.com</a>
    </div>
  </footer>
</div>
	



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>



<script>
$(document).ready
(function()
{
	var date_input=$('input[name="date"],input[id="date1"]'); //our date input has the name "date" or id=date1
	var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	date_input.datepicker
		({
			format: 'mm/dd/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
});
</script>

<script>
$(document).ready
(function()
{
	var rec=document.getElementById("records");
    rec.style.display="none";
});
</script>
<script>
$(document).ready
(function()
{
    $.getJSON("http://10.99.99.142:8089/JavaRESTfullWS/webservice/studentdata",function(result){
		var student_data='';
        $.each(result, function(key,i)
        {
			student_data+='<tr>';
			student_data+='<td>'+i.Id+'</td>';
			student_data+='<td>'+i.name+'</td>';
			student_data+='<td>'+i.course+'</td>';
			student_data+='<td>'+i.academic_year+'</td>';
			student_data+='<td>'+i.date_of_admission+'</td>';
			student_data+='</tr>';
          });
		$('#mytable').append(student_data);
		
		var rec=document.getElementById("records");
		if(student_data=="")
		{
			rec.style.display="";
		}
		else
		{
			rec.style.display="none";
		}
      });
});
</script>

<script>
function myFunction() 
{
	  var input, selected_course,selected_ac_year,selected_date, table, tr,i;
	  var flag=1;
	  input = document.getElementById("courseSelector");
	  selected_course = input.value.toUpperCase();
	  input = document.getElementById("yearSelector");
	  selected_ac_year=input.value.toUpperCase();
	  selected_date=document.getElementById("dateSelector").value;
	  table = document.getElementById("mytable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) 
	  {
		    td = tr[i].getElementsByTagName("td")[2];
		    td1 = tr[i].getElementsByTagName("td")[3];
		    td2 = tr[i].getElementsByTagName("td")[4];
		    td3=new Date(td2);
		    if (td&&td1&&td2) 
		    {
		    	if(selected_course=="COURSE")
		    	{
		    		if(selected_ac_year=="ACADEMIC YEAR")
		    		{
		    			if(selected_date=="")
		    			{
		    				display(i);	
		    				flag=0;
		    			}
		    			else
		    			{
		    				if (td2.innerHTML==selected_date)
					      	{ 
					        	display(i);
					        	flag=0;
					      	}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    		
		    		}
		    		else
		    		{
		    			if(selected_date=="")
		    			{
		    				if (td1.innerHTML.toUpperCase()==selected_ac_year)
					      	{ 
					        	display(i);
					        	flag=0;
					      	}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    			else
		    			{
		    				if(td1.innerHTML.toUpperCase()==selected_ac_year&&td2.innerHTML==selected_date)
		    				{
		    					display(i);	
		    					flag=0;
		    				}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    		}
		    	}
		    	else
		    	{
		    		if(selected_ac_year=="ACADEMIC YEAR")
		    		{
		    			if(selected_date=="")
		    			{
		    				if (td.innerHTML.toUpperCase()==selected_course)
					      	{ 
					        	display(i);
					        	flag=0;
					      	}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    			else
		    			{
		    				if (td2.innerHTML==selected_date &&td.innerHTML.toUpperCase()==selected_course)
					      	{ 
					        	display(i);
					        	flag=0;
					      	}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    		
		    		}
		    		else
		    		{
		    			if(selected_date=="")
		    			{
		    				if (td1.innerHTML.toUpperCase()==selected_ac_year&&td.innerHTML.toUpperCase()==selected_course)
					      	{ 
					        	display(i);
					        	flag=0;
					      	}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    			else
		    			{
		    				if(td1.innerHTML.toUpperCase()==selected_ac_year&&td2.innerHTML==selected_date&&td.innerHTML.toUpperCase()==selected_course)
		    				{
		    					display(i);	
		    					flag=0;
		    				}
		    				else
		    				{
		    					hide(i);
		    				}
		    			}
		    		}
		    	}
		    }  
		}
	  var rec=document.getElementById("records");
	  if(flag==1)
	  {
		  
		  rec.style.display="";
	  } 
	  else
	  {
		 rec.style.display="none";
	 }
		  
}

//Function to display the selected row
function display(i)
{
	table = document.getElementById("mytable");
	tr = table.getElementsByTagName("tr");
	tr[i].style.display = "";
}
//Function to hide the selected row
function hide(i)
{
	table = document.getElementById("mytable");
	tr = table.getElementsByTagName("tr");
	tr[i].style.display = "none";
}
</script>
<script>
	var start = 2000;
	var end = new Date().getFullYear();
	var options = "<option>"+"Academic Year"+"</option>";
	for(var year = start ; year <=end; year++)
	{
  		options += "<option>"+ year +"</option>";
	}
document.getElementById("year").innerHTML = options;
document.getElementById("yearSelector").innerHTML = options;
</script>

	
</body>
</html>