<%--
  Created by IntelliJ IDEA.
  User: lab
  Date: 23/09/2024
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    List<String> erros = (List<String>) request.getAttribute("erros");

    String usuario = (String) session.getAttribute("usuario");
    Boolean logado = (Boolean) session.getAttribute("logado");


    if (logado == null || !logado) {

        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Cadastro</title>
</head>
<body>
<h2>Bem-vindo, <%= usuario %>!</h2>

<h2>Formulário de Cadastro</h2>
<form action="<%= request.getContextPath() %>/formulario" method="post">

    <label for="nome">Nome:</label><br>
    <input type="text" id="nome" name="nome"><br><br>

    <label for="data_nascimento">Data de Nascimento:</label><br>
    <input type="date" id="data_nascimento" name="data_nascimento" ><br><br>

    <label>Idioma Nativo:</label><br>
    <input type="radio" id="ingles" name="idioma_nativo" value="ingles" >
    <label for="ingles">Inglês</label><br>
    <input type="radio" id="espanhol" name="idioma_nativo" value="espanhol">
    <label for="espanhol">Espanhol</label><br>
    <input type="radio" id="portugues" name="idioma_nativo" value="portugues">
    <label for="portugues">Português</label><br><br>

    <label>Habilidades Técnicas:</label><br>
    <input type="checkbox" id="java" name="habilidades" value="Java">
    <label for="java">Java</label><br>
    <input type="checkbox" id="javascript" name="habilidades" value="JavaScript">
    <label for="javascript">JavaScript</label><br>
    <input type="checkbox" id="html" name="habilidades" value="HTML">
    <label for="html">HTML</label><br>
    <input type="checkbox" id="css" name="habilidades" value="CSS">
    <label for="css">CSS</label><br><br>

    <label for="informacoes_adicionais">Informações Adicionais:</label><br>
    <textarea id="informacoes_adicionais" name="informacoes_adicionais" rows="4" cols="50"></textarea><br><br>

    <input type="submit" value="Enviar">

    <%
        if (erros != null && !erros.isEmpty()) {
    %>
    <br>
    <div class="alert alert-danger">
        <ul>
            <% for (String erro : erros) { %>
            <li><%= erro %></li>
            <% } %>
        </ul>
    </div>
    <% } %>
</form>
</body>
</html>
