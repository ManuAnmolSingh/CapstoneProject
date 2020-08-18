<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
body
{
	background:light;
}

h1
{
	color:#fff;
	margin:40px 0 60px 0;
	font-weight:300;
}

.our-team-main
{
	width:100%;
	height:auto;
	border-bottom:5px #323233 solid;
	background:#fff;
	text-align:center;
	border-radius:10px;
	overflow:hidden;
	position:relative;
	transition:0.5s;
	margin-bottom:28px;
}


.our-team-main img
{
	border-radius:50%;
	margin-bottom:20px;
	width: 90px;
}

.our-team-main h3
{
	font-size:20px;
	font-weight:700;
}

.our-team-main p
{
	margin-bottom:0;
}

.team-back
{
	width:100%;
	height:auto;
	position:absolute;
	top:0;
	left:0;
	padding:5px 15px 0 15px;
	text-align:left;
	background:#fff;
	
}

.team-front
{
	width:100%;
	height:auto;
	position:relative;
	z-index:10;
	background:green;
	padding:15px;
	bottom:0px;
	transition: all 0.5s ease;
}

.our-team-main:hover .team-front
{
	bottom:-200px;
	transition: all 0.5s ease;
}

.our-team-main:hover
{
	border-color:#777;
	transition:0.5s;
}



/*our-team-main*/


</style>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy","root","manoj123");
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM bugreport";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
if(rs.next()){
Countrow = rs.getString(1);
}
%>
  <h1 class="text-center">jj</h1>

	
	<div class="container">
	<div class="row">
	
	<!--team-1-->
	<div class="col-lg-4">
	<div class="our-team-main">
	
	<div class="team-front bg-primary">
	<img src="http://placehold.it/110x110/pink/fff?text=<%=Countrow%>" class="img-fluid" />
	<h3>Total Number of</h3>
	<p>Tickets</p>
	</div>
	
	<div class="team-back">
	<span>
	you can see all the ticket id's here:<br>
	<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy","root","manoj123");
Statement stt=conn.createStatement();
String strQuerys = "SELECT * FROM bugreport";
ResultSet rss = stt.executeQuery(strQuerys);
String Counrow="";
while(rss.next()){
Counrow = rss.getString(3);
out.println(Counrow);
}
%>
	</span>
	</div>
	
    </div>
    </div>
    	<!--team-2-->
    	<%
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy","root","manoj123");
Statement stat=connection.createStatement();
String strquery = "SELECT COUNT(*) AS rowcount FROM bugreport where duedate>(current_date() - INTERVAL 1 MONTH)";
ResultSet rsu = stat.executeQuery(strquery);
int Countrows=0;
if(!(rsu.next())){
	Countrows=0;
}else{
	Countrows=rsu.getInt("rowcount");
}
%>
	<div class="col-lg-4">
	<div class="our-team-main">
	
	<div class="team-front bg-warning">
	<img src="http://placehold.it/110x110/pink/fff?text=<%=Countrows%>" class="img-fluid" />
	<h3>Total Number of</h3>
	<p>Tickets</p>
	</div>
	
	<div class="team-back">
	<span>
	you can see all the ticket id's here:<br>

	</span>
	</div>
	
    </div>
    </div>
    	<%
Class.forName("com.mysql.jdbc.Driver");
Connection cun=DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy","root","manoj123");
Statement stats=cun.createStatement();
String sqs = "SELECT COUNT(*) AS rowcount FROM bugreport where duedate<(current_date() - INTERVAL 1 MONTH)";
ResultSet rsus = stats.executeQuery(sqs);
int Crs=0;
if(!(rsus.next())){
Crs = 0;
}else{
	Crs=rsus.getInt("rowcount");
}
%>
    <div class="col-lg-4">
	<div class="our-team-main">
	
	<div class="team-front bg-danger text-white" >
	<img src="http://placehold.it/110x110/pink/fff?text=<%=Crs%>" class="img-fluid" />
	<h3>Total Number of</h3>
	<p>Tickets</p>

	</div>
	
	<div class="team-back">
	<span>
	you can see all the ticket id's here:<br>


	</span>
	</div>
	
    </div>
    </div>
	</div>
	</div>
	
</body>
</html>