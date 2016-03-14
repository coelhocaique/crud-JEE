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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script>
	function add() {
		document.location.href = "${pageContext.request.contextPath}/user?action=add";
	}

	function logout() {
		document.location.href = "${pageContext.request.contextPath}/logout";
	}
<<<<<<< HEAD

	function edit(login) {
		document.location.href = "${pageContext.request.contextPath}/user?action=edit&login="
				+ login;
	}

	function delet(login) {
		document.location.href = "${pageContext.request.contextPath}/user?action=delete&login="
				+ login;
	}
=======
	
	function edit(login) {
		document.location.href = "${pageContext.request.contextPath}/user?action=edit&login=" + login;
	}
	
	function delet(login) {
		document.location.href = "${pageContext.request.contextPath}/user?action=delete&login=" + login;
	}
	
>>>>>>> 268b3da343ec153a4ef8eeedab98a1447395d989
</script>
</head>

<body>
	<div class="container">
		<c:if test="${userInserted != null}">
			<div class="alert alert-success" role="alert">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Atenção!</strong> O user ${userInserted} foi salvo com
				sucesso no banco!
			</div>
		</c:if>
<<<<<<< HEAD

		<c:if test="${userUpdated != null}">
			<div class="alert alert-success" role="alert">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Atenção!</strong> O user ${userUpdated} foi atualizado com
				sucesso no banco!
			</div>
		</c:if>

		<c:if test="${rowsAffected > 0}">
			<div class="alert alert-success" role="alert">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Atenção!</strong> O user ${userTrash} foi atualizado com
				sucesso no banco!
			</div>
		</c:if>



=======
		
		<c:if test="${userUpdated != null}">
        <div class="alert alert-success" role="alert">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Atenção!</strong> O user ${userUpdated} foi atualizado com sucesso no banco!
        </div>
        </c:if>  
        
>>>>>>> 268b3da343ec153a4ef8eeedab98a1447395d989
		<h2>CRUD JEE</h2>

		<div class="list-group">
			<!-- Current User -->
			<a href="#" class="list-group-item">
				<h4>
					<strong>Current User</strong>
				</h4>
				<p>
					Id: [${currentUser.id}], Login: [<font color="red"><strong>${currentUser.login}</strong></font>],
					Password: [${currentUser.password}]
				</p>
			</a>

			<!-- Summary -->
			<a href="#" class="list-group-item">
				<h4>
					<strong>User Summary</strong>
				</h4>
<<<<<<< HEAD

=======
>>>>>>> 268b3da343ec153a4ef8eeedab98a1447395d989
				<p>
					<div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Id</th>
									<th>Login</th>
									<th>Password</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${users}" var="user">
									<tr>
										<td>${user.id}</td>
										<td>${user.login}</td>
										<td>${user.password}</td>
<<<<<<< HEAD
										<td><a onclick="edit('${user.login}')">Edit</a>
											 <a onclick="delet('${user.login}')">Delete</a>
=======
										<td>
											<a onclick="edit('${user.login}')">Edit</a>
											<a onclick="delet('${user.login}')">Delete</a>
>>>>>>> 268b3da343ec153a4ef8eeedab98a1447395d989
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</p>
			</a>
<<<<<<< HEAD
			
			<div align="right">
			
				<ul class="pagination" items-per-page="10">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
				</ul>
			</div>
=======
>>>>>>> 268b3da343ec153a4ef8eeedab98a1447395d989

			<!-- Logout -->
			<a href="#" class="list-group-item">
				<h4>
					<strong></strong>
				</h4>
				<p align="center">
					<button type="button" class="btn btn-lg btn-success"
						onclick="add()">New User</button>
					<button type="button" class="btn btn-lg btn-warning"
						onclick="logout()">Logout</button>
				</p>
			</a>
		</div>
	</div>
</body>
</html>