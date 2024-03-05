<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider,java.sql.*" %>
<%@include file="header.html"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.PasswordAuthentication , javax.mail.Authenticator" %>
<%@ page import="javax.mail.internet.* ,javax.activation.*" %>

<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("adminLogin.jsp");
     }
%>
<%
//Creating a result for getting status that messsage is delivered or not!

String result;

// Get recipient's email-ID, message & subject-line from index.html page

final String to = request.getParameter("email");

final String subject = "RED RAY Blood Bank";

final String messg = "Your request for donating blood has been accepted. Please come along with your all verified details and prescriptions (if any) within 1 week at 10am to 2pm. Thanks for donating blood.";

// Sender's email ID and password needs to be mentioned

final String from = "jagprmnk@gmail.com";

final String pass = "tsxcnvkigzamjswe";



// Defining the gmail host

String host = "smtp.gmail.com";



// Creating Properties object

Properties props = new Properties();



// Defining properties

props.put("mail.smtp.host", host);

props.put("mail.transport.protocol", "smtp");

props.put("mail.smtp.auth", "true");

props.put("mail.smtp.starttls.enable", "true");

props.put("mail.user", from);

props.put("mail.password", pass);

props.put( "mail.smtp.port", "587" );



// Authorized the Session object.

Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

    @Override

    protected PasswordAuthentication getPasswordAuthentication() {

        return new PasswordAuthentication(from, pass);

    }

});
String id = request.getParameter("id");
try{

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
       %>
       <h2>ID no</h2>
       <%
        message.setText(id);

       message.setText("Your ID : 9DA07 - 20"+id+"- 045. \nResult of Online Blood Donation: "+messg);

       // Send message

       Transport.send(message);

       result = "Your mail sent successfully....";
       try{
	   Connection con=ConnectionProvider.getCon();
	   PreparedStatement ps=con.prepareStatement("update applicant set status='completed' where id=?");
	   ps.setString(1,id);
	   ps.executeUpdate();
	   response.sendRedirect("applicantRequest.jsp?msgs=valid");
       }
       catch(Exception e){
    	   response.sendRedirect("applicantRequest.jsp?msgs=invalid");
       }

}       

    catch (MessagingException mex) {
    	try{
               mex.printStackTrace();
               result = "Error: unable to send mail....";
    		   Connection con=ConnectionProvider.getCon();
    		   PreparedStatement ps=con.prepareStatement("update applicant set status='rejected' where id=?");
    		   ps.setString(1,id);
    		   ps.executeUpdate();
    		   response.sendRedirect("applicantRequest.jsp?msgs=valid");
    	       }
    	       catch(Exception e){
    	    	   response.sendRedirect("applicantRequest.jsp?msgs=invalid");
    	       }

    }

%>