<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

.form {
	margin-top:2rem;

}

.Tudo {
	display: flex;
	flex-direction: column;
	height: 100%;
	justify-content: space-around;
	align-items: center;
	background-color: rgb(215, 234, 250);
}

.item {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-bottom: 1rem;
	border: 0.3rem solid blue;
	border-radius: 1rem;
}

.lis {
	list-style-type:none;
	margin-right: 1rem;
	font-weight: bold;
	font-size: 1.5rem;
	padding: 0.7rem;
}

.re {
	padding: 0.7rem;
}
</style>
<meta charset="ISO-8859-1">
<title>Exemplo de JSP</title>
</head>
<body class = "Tudo">
<%@ page import = "java.util.*,br.edu.insper.mvc.*" %>
<header class="header">
<h3 class = "Titulo">Gerenciador de Tarefas</h3>
</header>
<br>
<form action='Cria' method='post'>
Tarefa: <input type='text' name= 'description' />
<input type= 'submit' value='gravar' />
</form>
<br>
<c:forEach var="tarefa" items="${tarefas}">
<div class="item">
<li class="lis">${tarefa.description}</li>
<form class= "re" action='Remove' method='post'>
<input type='hidden' name= 'id' value= '${tarefa.id}'>
<input type= 'submit' value='remover' /><br>
</form>
<form class= "re" action='Alterar' method='get'>
<input type='hidden' name= 'id' value= '${tarefa.id}'>
<input type='hidden' name= 'description' value= '${tarefa.description}'>
<input type= 'submit' value='atualizar' /><br>
</form>
</div>
</c:forEach>
</body>
</html>