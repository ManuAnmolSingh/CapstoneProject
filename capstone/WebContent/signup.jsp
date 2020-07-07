<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
h3
{
    border-bottom:3px solid black ;
    padding-bottom:3px;
}
.note
{
    text-align: center;
    height: 80px;
    background: black;
    color: #fff;
    font-weight: bold;
    line-height: 80px;
}
.form-content
{
    padding: 2.5%;
    border: 10px 10px 10px 0 solid #ced4da;
    border-bottom-style:none;
    /*margin-bottom: 5%;*/
}
.row{
padding-top: 20px;
}
.form-control{
    border-radius: 1.5rem;
    border-style: solid ;

}
.btnSubmit
{
    border:none;
    border-radius:1.5rem;
    border-style: solid;
    
    padding: 1%;
    width: 20%;
    cursor: pointer;
    background: black;
    color: #fff;
}
</style>
</head>
<body>
<div class="container-fliud">
            <div>
            <form id="form" name="form" method="get" action="signup">
                <div class="note">
                    <p>Register Form</p>
                </div>
                
                <div class="form-content">
                <h3>User Details</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                
                                <input type="text" class="form-control" name="name" placeholder="Your Name *" value=""/>
                            </div>
                            <div class="form-group">
                                
                                <input type="text" class="form-control" name="id" placeholder="Loginid*" value=""/>
                            </div>
                           
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" name="password" placeholder="Your Password *" value=""/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="repassword" placeholder="Confirm Password *" value=""/>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="form-content">
                <h3>Contact Details</h3>
                
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" name="address" placeholder="Address" value=""/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="city" placeholder="City" value=""/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" name="state" placeholder="State" value=""/>
                            </div>
                            <div class="form-group">
                              
                                <input type="text" name="country" class="form-control" placeholder="Country" value=""/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" name="email" placeholder="email" value=""/>
                            </div>
                            <div class="form-group">
                               
                                <input type="text" name="number" class="form-control" placeholder="Phone Number" value=""/>
                            </div>
                        </div>
                    </div>
       
                </div>
                <div class="form-content">
                <h3>Employee role & Manager</h3>
                
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" name="emprole" placeholder="Employee Role" value=""/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="empmagcode" placeholder="Employee manager code" value=""/>
                            </div>
                        </div>
                        
                    </div>
                    <button type="button" class="btnSubmit">Submit</button>
                </div>
            </form> 
            </div>
        </div>
</body>
</html>