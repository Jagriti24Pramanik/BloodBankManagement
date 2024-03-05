<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
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
    
    String id = request.getParameter("id");

    final String to = request.getParameter("email");

    final String subject = "RED RAY Blood Bank";

    final String messg = " Sorry to inform you , Your request for blood has been rejected for some specific reasons. Please try afterwords few days. ";

 

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


        message.setText("Your ID : 4RB03 - 30"+id+" - 84.\nResult of your Blood Request: "+messg);

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";
        
        
        try{
     	   Connection con=ConnectionProvider.getCon();
     	   PreparedStatement ps=con.prepareStatement("update bloodrequest set status='rejected' where id=?");
     	   ps.setString(1,id);
     	   ps.executeUpdate();
     	   response.sendRedirect("requestForBlood.jsp?msg=valid");
     }
     catch(Exception e){
     	   response.sendRedirect("requestForBlood.jsp?msg=invalid");
     }


    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";
        try{
     	   Connection con=ConnectionProvider.getCon();
     	   PreparedStatement ps=con.prepareStatement("update bloodrequest set status='rejected' where id=?");
     	   ps.setString(1,id);
     	   ps.executeUpdate();
     	   response.sendRedirect("requestForBlood.jsp?msg=valid");
     }
     catch(Exception e){
     	   response.sendRedirect("requestForBlood.jsp?msg=invalid");
     }

    }
%>