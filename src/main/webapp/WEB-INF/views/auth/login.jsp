<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>Login Page</title>
</head>
<body>
	<form:form servletRelativeAction="/login">
		<div>
			<label> User <input type='text' name='username' value=''>
			</label>
		</div>
		<div>
			<label>Password <input type='password' name='password' />
			</label>
		</div>
		<div>
			<input name="submit" type="submit" value="Login" />
		</div>
	</form:form>
</body>
</html>