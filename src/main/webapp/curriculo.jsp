<%@ page import="com.example.loginformulario.Model.Curriculo" %><%--
  Created by IntelliJ IDEA.
  User: gustavo
  Date: 25/09/2024
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Curriculo curriculo = (Curriculo) request.getAttribute("curriculo");
%>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currículo Enviado</title>
</head>
<body>
<h2>Currículo Enviado</h2>

<p><strong>Nome:</strong> ${curriculo.nome}</p>
<p><strong>Data de Nascimento:</strong> ${curriculo.dataNascimento}</p>
<p><strong>Idioma Nativo:</strong> ${curriculo.idioma}</p>

<p><strong>Habilidades Técnicas:</strong>
<div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
    <dt class="text-sm font-medium leading-6 text-gray-900">Habilidades selecionados</dt>
    <dd class="mt-1 text-sm leading-6 font-light sm:col-span-2 sm:mt-0">${requestScope.curriculo.habilidades}</dd>
</div>
</p>

<p><strong>Informações Adicionais:</strong> ${curriculo.descricao}</p>
</body>
</html>