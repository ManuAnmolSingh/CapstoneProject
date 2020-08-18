<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%
    //Creating a result for getting status that messsage is delivered or not!
    String result;
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = request.getParameter("email");
    final String subject = request.getParameter("name");
    final String messg = request.getParameter("message");
    String type=request.getParameter("type"); 
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
        message.setSubject(subject);
        // Now set the actual message
        message.setText(messg);
        // Send message
        Transport.send(message);
        result = "mail sent successfully....";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";
    }
%>
<title>Sending Mail in JSP</title>
<h2><font color="blue">Sending Mail Using JSP</font></h2>
<b><font color="green"><% 
if(type.equals("contact")){
	RequestDispatcher rd=request.getRequestDispatcher("contact.jsp?msg='"+result+"'");
	rd.forward(request, response);
}else{
	RequestDispatcher rd=request.getRequestDispatcher("Admincontact.jsp?msg='"+result+"'");
	rd.forward(request, response);
}
%></font></b>