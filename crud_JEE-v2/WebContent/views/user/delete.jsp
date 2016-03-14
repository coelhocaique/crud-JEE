<<<<<<< HEAD
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:h="http://java.sun.com/jsf/html">

<head>
	<title>IBM & AIG</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		
		<script>
		
		function backToSummary() {
			document.location.href = "${pageContext.request.contextPath}/user?action=summary";
		}
		</script>
</head>
<body>
	<div class="container">
		<h2>CRUD JEE</h2>

		<h4>
			<strong>Deleting User</strong>
		</h4>

		<form role="form" method="post" action="${pageContext.request.contextPath}/user?action=trash">
			<input type="hidden" name="id" value="${userDelete.id}"/>
			<div class="form-group">
				<label for="login">Login</label>
				<input type="text" class="form-control" name="login" id="login" readonly value="${userDelete.login}"/>
			</div>
			<!-- Password -->
			<div class="form-group">
				<label for="password">Password</label>
				<input type="text" class="form-control" name="password" id="password" readonly value="${userDelete.password}"/>
			</div>
			
			<h4 align= "center">
			<strong>Are you sure you want to delete this user?</strong>
			</h4>
			<!-- Send this form to server -->
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-default btn-lg">
					Yes
				</button>
				<button type="button" class="btn btn-default btn-lg"
						onclick="backToSummary()">No</button>
			</div>
		</form>
	</div>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
>>>>>>> 268b3da343ec153a4ef8eeedab98a1447395d989

</body>
</html>