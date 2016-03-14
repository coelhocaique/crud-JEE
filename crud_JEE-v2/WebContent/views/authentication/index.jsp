<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>IBM & AIG</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<h2>CRUD JEE</h2>
		<form role="form" method="post" action="${pageContext.request.contextPath}/authentication/login">
			<!-- Login -->
			<div class="form-group">
				<label for="login">Login</label>
				<input type="text" class="form-control" name="login" id="login" placeholder="Insert your login" autocomplete="on" autofocus="true" required />
			</div>
			<!-- Password -->
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" name="password" id="password" placeholder="Insert your password" required/>
			</div>
			<!-- Send this form to server -->
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-default btn-lg">
					Submit
				</button>
				<button type="reset" class="btn btn-default btn-lg">
					Cancel
				</button>
			</div>
		</form>
	</div>
</body>
</html>