<%--
  Created by IntelliJ IDEA.
  User: gustavo
  Date: 26/09/2024
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<String> erros = (List<String>) request.getAttribute("erros");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Login</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12 mt-5">
            <h3>Login</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-6 alert alert-info">
            <form action="<%= request.getContextPath() %>/login" method="post">
                <div class="form-group">
                    <label for="txtUsu">Usuário</label>
                    <input id="txtUsu" type="text"
                           class="form-control"
                           name="usuario"
                           />
                </div>

                <div class="form-group">
                    <label for="txtSenha">Senha</label>
                    <input id="txtSenha" type="password"
                           class="form-control"
                           name="senha"
                            />
                </div>

                <input type="hidden" name="submetido" value="1" />

                <button class="btn btn-success">Entrar</button>

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
        </div>


    </div>

</div>


<!-- JavaScript (Opcional) -->
<!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>
