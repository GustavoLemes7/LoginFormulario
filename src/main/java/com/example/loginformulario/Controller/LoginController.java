package com.example.loginformulario.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(urlPatterns = {"", "/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<String> erros = new ArrayList<>();
        req.setAttribute("erros", erros);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usuario = req.getParameter("usuario");
        String senha = req.getParameter("senha");

        List<String> erros = new ArrayList<>();

        if(usuario.trim().isEmpty() || !usuario.equals("Laboratório")){
            erros.add("Usuário inválido");
        }

        if(senha.trim().isEmpty() || !senha.equals("IFPR")){
            erros.add("senha inválida");
        }

        if(usuario.equals("Laboratório")  && senha.equals("IFPR")){
            req.setAttribute("erros", erros);
            HttpSession sessao = req.getSession();
            sessao.setAttribute("logado", true);
            sessao.setAttribute("usuario", usuario);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/form.jsp");
            dispatcher.forward(req, resp);
        }

        if(!erros.isEmpty()){
            req.setAttribute("erros", erros);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
            dispatcher.forward(req, resp);
        }
    }

    }
