<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
     <%@ page import="java.sql.*" %>
     <%@include file="var.jsp" %>
  </head>
   
<body>
  <%@include file="header.jsp" %>
          <%@page import="javax.mail.*"%>
    <%@page import="javax.mail.internet.*"%>
    <%@page import="java.util.Properties"%>


    

    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Get In Touch</p>
                <h3 class="title-style">Contact Us</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-7 contact-right">
                    <form method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row">
                                <div class="col-sm-6">
                                    <input type="text" name="name" id="w3lName" placeholder="Your Name"
                                        class="contact-input" required="" />
                                </div>
                                <div class="col-sm-6">
                                    <input type="email" name="email" id="w3lSender" placeholder="Your Email"
                                        class="contact-input" required="" />
                                </div>
                            </div>
                            <input type="number" name="phone" id="w3lSubect" placeholder="Phone"
                                class="contact-input" required="" />
                            <input type="text" name="address" id="w3lSubect" placeholder="Address"
                                class="contact-input" required="" />
                        </div>
                        <div class="form-input">
                            <textarea name="message" id="w3lMessage" placeholder="Type your message here"
                                required=""></textarea>
                        </div>
                        <div class="text-start">
                            <button name="submit" type="submit" class="btn btn-style btn-style-3">Send Message</button>
                        </div>
                    </form>
                    <%
                        if(request.getParameter("submit")!=null){
                            Properties props = new Properties();
                            props.put("mail.smtp.host", "smtp.office365.com");
                            props.put("mail.smtp.socketFactory.port", "587");
                            props.put("mail.smtp.socketFactory.class",
                            "javax.net.ssl.SSLSocketFactory");
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.port", "587");
                            props.put("mail.smtp.starttls.enable", true);
                            props.put("mail.smtp.ssl.trust", "*");
                            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

                            Session session2 = Session.getInstance(props,
                            new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("project2210@outlook.com","school123");
                            }
                            });
                            try {
                            Message message = new MimeMessage(session2);
                            message.addHeader("Content-type", "text/html; charset=UTF-8");
                            message.setFrom(new InternetAddress("project2210@outlook.com"));
                            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("kangmehak167@gmail.com"));
                            message.setSubject("Feedback from website");

                            message.setText("Name : " + request.getParameter("name") + "\nEmailid : "+ request.getParameter("email") +
                            "\nPhone :" + request.getParameter("phone") + "\nMessage : " + request.getParameter("message"));
                            Transport.send(message);
                            out.print("Mail has been sent successfully");
                            }
                            catch(Exception e)
                            {
                            out.print("Mail does not works due to " + e.getMessage());
                            }
                        }
                    %>
                </div>
              
    </section>
    <!-- map -->
    <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d317718.69319292053!2d-0.3817765050863085!3d51.528307984912544!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!5e0!3m2!1sen!2spl!4v1562654563739!5m2!1sen!2spl"
            width="100%" height="400" frameborder="0" style="border: 0px;" allowfullscreen=""></iframe>
    </div>
    <!-- //contact block -->
 <!-- Js scripts -->
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fas fa-level-up-alt" aria-hidden="true"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- //move top -->

    <!-- common jquery plugin -->
    <script src="assets/js/jquery-3.7.0.min.js"></script>
    <!-- //common jquery plugin -->

    <!-- /counter-->
    <script src="assets/js/counter.js"></script>
    <!-- //counter-->

    <!-- theme switch js (light and dark)-->
    <script src="assets/js/theme-change.js"></script>
    <!-- //theme switch js (light and dark)-->

    <!-- MENU-JS -->
    <script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
    <!-- //MENU-JS -->

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!-- bootstrap -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- //bootstrap -->
    <!-- //Js scripts -->

     <%@include file="footer.jsp" %>
</body>
</html>