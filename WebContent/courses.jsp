<%@page import="com.learntoday.model.Course"%>
<%@ page language="java" session="true" import="java.sql.*, java.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://elearn.com/functions" prefix="fc"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Learntoday - All Courses</title>
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="header.jsp" flush="true" />
		</header>

		<article>
			<jsp:useBean id="obj" class="com.learntoday.model.Course"
				scope="request" />

			<div class="row">
				<c:set var="i" value="0" scope="page" />
				<c:forEach var="course" items="${fc:getCourses()}">
					<c:set var="n" value="${i%3}" />
					<c:if test="${n == 0}">
			</div>
			<div class='row'>
				</c:if>
				<div class='col-md-4'>
					<p>
						<img src='${course.imageUrl}' width=200 height=200
							class='img-thumbnail' />
					</p>
					<h3 class='text-primary'>${course.courseName}</h3>
					<p class='text-success'>
						Trainer: <strong>${course.facultyName}</strong>
					</p>
					<p>
						<a href='findCourse.jsp?courseName=${course.courseName}'
							class='btn btn-default'>View Details</a>
					</p>
					<c:set var="i" value="${i+1}" />
				</div>

				</c:forEach>
			</div>
	</div>

	</article>
	<footer>
		<jsp:include page="footer.jsp" flush="true" />
	</footer>
	</div>
</body>
</html>