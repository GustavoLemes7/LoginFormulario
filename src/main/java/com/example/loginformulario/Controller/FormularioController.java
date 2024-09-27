package com.example.loginformulario.Controller;

import com.example.loginformulario.Model.Curriculo;
import com.example.loginformulario.Service.FormularioService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeParseException;
import java.time.format.DateTimeFormatter;

@WebServlet("/formulario")
public class FormularioController extends HttpServlet {
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> erros = new ArrayList<>();
        req.setAttribute("erros", erros);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/form.jsp");
        dispatcher.forward(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nome = req.getParameter("nome");
        String dataNascimento = req.getParameter("data_nascimento");
        String idioma = req.getParameter("idioma_nativo");
        String[] habilidades = req.getParameterValues("habilidades");
        String descriscao = req.getParameter("informacoes_adicionais");

        FormularioService service = new FormularioService();
        ArrayList<String> habilidade = new ArrayList<>();
        List<String> erros = new ArrayList<>();
        LocalDate data;
        if (habilidades != null) {
            for (String h : habilidades) {
                habilidade.add(h);
            }
        }
        Curriculo curriculo = new Curriculo();
        curriculo.setNome(nome);
        try {
            curriculo.setIdioma(idioma);
        } catch (Exception e1){
            curriculo.setIdioma(null);
        }
        try{
            curriculo.setHabilidades(habilidade);
        } catch (Exception e2){
            curriculo.setHabilidades(null);
        }
        curriculo.setDescricao(descriscao);
        erros = service.validarDados(curriculo);

        try {
            data = LocalDate.parse(dataNascimento);
            curriculo.setDataNascimento(data);

        } catch (DateTimeParseException e1){
            try {
                data = LocalDate.parse(dataNascimento, formatter);
                curriculo.setDataNascimento(data);
            }catch (DateTimeParseException e2) {
                erros.add("Data inválida");
            }
        }


        if (!erros.isEmpty()){
            req.setAttribute("erros", erros);
            RequestDispatcher dispatcher = req.getRequestDispatcher("form.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("curriculo", curriculo);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/curriculo.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
