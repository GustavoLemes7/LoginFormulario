package com.example.loginformulario.Model;

import java.time.LocalDate;
import java.util.ArrayList;

public class Curriculo {
    private String nome;
    private LocalDate dataNascimento;
    private String idioma;
    private ArrayList<String> habilidades;
    private String descricao;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public ArrayList<String> getHabilidades() {
        return habilidades;
    }

    public void setHabilidades(ArrayList<String> habilidades) {
        this.habilidades = habilidades;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return "Curriculo{" +
                "nome='" + nome + '\'' +
                ", dataNascimento=" + dataNascimento +
                ", idioma='" + idioma + '\'' +
                ", habilidades=" + habilidades +
                ", descricao='" + descricao + '\'' +
                '}';
    }
}
