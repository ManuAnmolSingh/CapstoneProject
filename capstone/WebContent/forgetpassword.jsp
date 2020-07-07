<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>forget password email</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy?useSSL=false","root","manoj123");
Statement st=con.createStatement(); 
String email=request.getParameter("email");
String strQuery = "SELECT password FROM signup where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
//String first = rs.getString("password");
String Countrow = rs.getString(1);
if(Countrow.equals("1")){

String result;
// Get recipient's email-ID, message & subject-line from index.html page
final String to = request.getParameter("email");
//final String subject = "password";
final String messg = request.getParameter("message");

// Sender's email ID and password needs to be mentioned
final String from = "manojcan33@gmail.com";
final String pass = "kadapa@888";


// Defining the gmail host
String host = "smtp.gmail.com";

// Creating Properties object
Properties props = new Properties();

// Defining properties
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.ssl.enable","true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.user", from);
props.put("mail.smtp.password", pass);
props.put("mail.smtp.port", "465");


 
// Authorized the Session object.
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(from, pass);
    }
});

try {
    // Create a default MimeMessage object.
    MimeMessage message = new MimeMessage(mailSession);
    // Set From: header field of the header.
    message.setFrom(new InternetAddress(from));
    // Set To: header field of the header.
    message.addRecipient(Message.RecipientType.TO,
            new InternetAddress(to));
    // Set Subject: header field
    //message.setSubject(subject);
    // Now set the actual message
    message.setText(messg);
    // Send message
    Transport.send(message);
    result = "mail sent successfully....";
} catch (MessagingException mex) {
    mex.printStackTrace();
    result = "Error: unable to send mail....";
}

out.println("Password send to your email id successfully !");
}
else{
out.println("Invalid Email Id !");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>