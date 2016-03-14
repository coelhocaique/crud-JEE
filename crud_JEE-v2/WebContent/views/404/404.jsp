<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IBM & AIG</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script>
function home() {
	document.location.href = "${pageContext.request.contextPath}/";
}
</script>
</head>
<body>
	<div class="container">
		<h2>CRUD JEE</h2>

		<div class="list-group">
			<a href="#" class="list-group-item">
				<h4>
					<strong>Ops - 404 Error!!!</strong>
				</h4>
				<p>
					You are trying to access a page that does not exist or has been disabled!
				</p>
			</a>

			<a href="#" class="list-group-item">
			<h4>
				<strong></strong>
			</h4>
			<p align="center">
				<button type="button" class="btn btn-lg btn-info" onclick="home()">Let's go to home? Click-me!</button>
			</p>
			</a>
		</div>
	</div>
</body>
</html>