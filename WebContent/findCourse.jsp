<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="java.sql.*, com.learntoday.model.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String userName = (String) session.getAttribute("user");
		if (userName == null)
			response.sendRedirect("login.jsp?requestUrl=findCourse");
		else {
	%>
	<jsp:useBean id="course" class="com.learntoday.model.Course"
		scope="request" />

	<jsp:declaration>String courseName = null;</jsp:declaration>

	<jsp:scriptlet>String facultyName = null;
				String courseDuration = null;
				int courseFee = 0;

				courseName = request.getParameter("courseName");
				courseName = courseName.trim();
				System.out.println("course name selected :: " + courseName);
				Connection con = (Connection) application.getAttribute("connection");
				String sql = "select * from course where courseTitle='" + courseName + "'";
				//String sql = "select c.CourseTitle as CourseTitle,Trainer,ImageUrl,Fees,CourseDescription,Rating from course c,ratings r where c.CourseTitle='" + courseName +"' and UserName='"+ userName +"' and c.CourseTitle = r.CourseTitle";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);

				if (rs.next()) {
					course.setCourseName(courseName);
					course.setFacultyName(rs.getString("Trainer"));
					course.setImageUrl(rs.getString("ImageUrl"));
					course.setFees(rs.getInt("Fees"));
					course.setDescription(rs.getString("CourseDescription"));
				}
				rs.close();

				/* sql = "select Rating from Ratings where courseTitle='" + courseName + "' and userName='" + userName
						+ "'"; */
				/* rs = stmt.executeQuery(sql); */
				/* if (rs.next()) { */
					course.setUserRating(3);
				/* } */</jsp:scriptlet>


	<jsp:forward page="viewCourse.jsp" />
	<%
		}
	%>
</body>
</html>