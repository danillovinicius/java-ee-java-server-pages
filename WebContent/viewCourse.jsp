<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/ratings.tld" prefix="cs"%>
<!DOCTYPE html>
<head>
<title><jsp:getProperty name="course" property="courseName" />
	Details</title>
</head>

<body>
	<div class="container">
		<header>
			<%@ include file="header.jsp"%>
		</header>

		<article>
			<jsp:scriptlet>String user = (String) session.getAttribute("user");
			String message = "Welcome " + user + " ,";</jsp:scriptlet>

			<div class="row">
				<div class="col-md-12">
					<h3><jsp:expression>message</jsp:expression></h3>
				</div>
			</div>
			<form name="coursefrm" action="ratings.jsp" method="post">
				<jsp:useBean id="course" class="com.learntoday.model.Course"
					scope="request" />
				<div class="panel panel-primary">
					<p class="panel-heading">Course Details</p>

					<div class="panel-body">

						<div class="media">
							<div class="media-left">
								<a href="#"><img class="media-object"
									src="${course.imageUrl}" alt="${course.courseName}"></a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">${course.courseName}</h4>
								<p>
									<strong>Trainer Name : </strong> ${course.facultyName}
								</p>
								<p>
									<strong>Course Description : </strong> <br />
									${course.description}
								</p>
								<p>
									<strong>Course Fee : </strong> ${course.fees}
								</p>
								<p>
									<strong>Course Ratings : </strong>
									<cs:ratings course="${course.courseName}" />
								</p>

								<c:if test="${course.userRating > 0}">
									<p>
										<strong>Your Ratings: </strong> ${course.userRating}
									</p>
								</c:if>
								<c:if test="${course.userRating == 0}">
									<p>
										<strong>Enter your rating : <select name="ratings">
												<c:forEach var="i" begin="1" end="5">
													<option value='${i}'>${i}</option>
													<p>
												</c:forEach>
										</select>
										</strong>
									</p>
								</c:if>
							</div>
						</div>

						<p class="text-center">
							<c:if test="${course.userRating==0}">
								<input type="submit" name="submit" value="Save Ratings"
									class="btn btn-lg btn-success" />
							</c:if>
							<a href="courses.jsp" class="btn btn-lg btn-success">View All
								Courses</a>
						</p>
					</div>
				</div>
				<input type="hidden" name="courseName" value="${course.courseName}" />
			</form>
		</article>
		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>