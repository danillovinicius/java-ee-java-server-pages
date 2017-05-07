<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form - LearnToday</title>
</head>
<body>
	<div class="container">
		<!-- Header Section -->
		<header>
			<%@ include file="header.jsp"%>
		</header>

		<!-- Main Content of the Page -->
		<article>
			<h1 class="page-header">Login Form</h1>

			<form name="loginForm" class="form-horizontal"
				action="authenticate.jsp" method="post">
				<div class="form-group">
					<label class="col-md-2 control-label">User name :</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="userName"
							required="required" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label">Password :</label>
					<div class="col-md-4">
						<input type="password" class="form-control" name="password"
							required="required" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-4 col-md-offset-2">
						<input type="submit" name="btnLogin" value="Login"
							class="btn btn-primary" />
					</div>
				</div>
			</form>
		</article>

		<!-- Footer Section -->
		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>