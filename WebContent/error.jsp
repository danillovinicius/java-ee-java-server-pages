<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page- LearnToday</title>
</head>
<body>
	<div class="container">
		<!-- Header Section -->
		<header>
			<%@ include file="header.jsp"%>
		</header>
		<!-- Main Section  -->
		<article>
			<div class="alert alert-danger">
				<%
					String imageUrl = config.getInitParameter("imageUrl");
					String errorMessage = config.getInitParameter("errorMessage");
					out.println("<center><img src='" + imageUrl + "' alt='" + errorMessage + "' width=150 height=150/>");
					out.println("<h1>Oops!...<br>" + errorMessage + "</h1></center>");
				%>
			</div>
		</article>
		<!-- Footer Section -->
		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>