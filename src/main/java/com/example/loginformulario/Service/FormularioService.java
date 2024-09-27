package com.example.loginformulario.Service;

import com.example.loginformulario.Model.Curriculo;


import java.util.List;
import java.util.ArrayList;


public class FormularioService {

    public List<String> validarDados(Curriculo curriculo) {

        List<String> erros = new ArrayList<>();

        if((curriculo.getNome().trim()).isEmpty()){
            erros.add("Informe o nome ");
        }

        if(curriculo.getIdioma() == null){
            erros.add("Informe o idioma");
        }

        if(curriculo.getHabilidades() == null || curriculo.getHabilidades().isEmpty()){
            erros.add("Habilidades não pode estar vazio");
        }

        if(curriculo.getDescricao().trim().isEmpty()){
            erros.add("Informe o campo descricao");
        }

        return erros;
    }
}