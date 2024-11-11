<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
    import="com.mehedi.service.impl.*,com.mehedi.service.*,com.mehedi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Details</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS for responsive design and styling -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
<!-- Custom CSS -->
    
    <!-- jQuery and Bootstrap JS for interactive features -->
    <script
          src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
          src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <!-- Font Awesome for icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #E6F9E6;">

<%
    /* Checking the user credentials */
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (userName == null || password == null) {
        response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    }

    UserService dao = new UserServiceImpl();
    UserBean user = dao.getUserDetails(userName, password);
    if (user == null)
        user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, bihar", 87659, "lksdjf");
%>
<!-- Include a header file -->
<jsp:include page="header.jsp" />
<!-- Main container for displaying the profile -->

<div class="container bg-secondary">
    <div class="row">
<!-- Breadcrumb navigation for easy navigation -->
        <div class="col">
            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="profile.jsp">User Profile</a></li>
                </ol>
            </nav>
        </div>
    </div>
<!-- Profile layout: Left side for user image and summary, right side for details -->

    <div class="row">
        <div class="col-lg-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <img src="images/profile.jpg" class="rounded-circle img-fluid" style="width: 150px;">
                    <h5 class="my-3">
                        Hello <%=user.getName()%> here!!
                    </h5>
                </div>
            </div>
 <!-- Card for the 'My Profile' section heading -->
            <div class="card mb-4 mb-lg-0">
                <div class="card-body p-0">
                    <ul class="list-group list-group-flush rounded-3">
                        <li class="text-center list-group-item d-flex justify-content-between align-items-center p-3">
                            <h1>My Profile</h1>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
 <!-- Card for displaying detailed profile information -->
            <div class="card mb-4">
                <div class="card-body">
<!-- Full Name Section -->
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Full Name</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%=user.getName()%></p>
                        </div>
                    </div>
                    <hr>
<!-- Email Section -->
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Email</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%=user.getEmail()%></p>
                        </div>
                    </div>
                    <hr>
 <!-- Phone Section -->
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Phone</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%=user.getMobile()%></p>
                        </div>
                    </div>
                    <hr>
 <!-- Address Section -->
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Address</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%=user.getAddress()%></p>
                        </div>
                    </div>
                    <hr>
 <!-- PinCode Section -->
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">PinCode</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%=user.getPinCode()%></p>
                        </div>
                    </div>
                    <hr>
                    <!-- Add Update Profile button -->
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <a href="updateProfile.jsp" class="btn btn-primary">Update Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
