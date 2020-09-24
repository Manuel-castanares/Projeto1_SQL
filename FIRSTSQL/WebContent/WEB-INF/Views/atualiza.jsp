<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.header {
	background-color: rgb(78, 120, 245);
	width:100%;
	display: flex;
	flex-direction: row;
	border-style: solid;
	border-color: black;
	border-width: 0.01rem;
}

.Titulo {
	color: black;
	font-size: 2rem;
	margin-left: 25rem;
}

.Tudo {
	display: flex;
	flex-direction: column;
	height: 100%;
	justify-content: space-around;
	align-items: center;
	background-color: rgb(215, 234, 250);
}
</style>
<meta charset="ISO-8859-1">
<title>Atualizar</title>
</head>
<br>
<body class = "Tudo">
<header class= "header">
<h3 class = "Titulo">Gerenciador de Tarefas</h3>
</header>
<br>
<form action='Alterar' method='post'>
Descrição: <input type='text' name='description' value="${param.description}">
<input type='hidden' name='id' value="${param.id}">
<input type= 'submit' value='atualizar' /><br>
</form>
</body>
</html>