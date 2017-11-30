package com.example.mellis.domino_android.modelo;

import java.util.List;

/**
 * Created by brian on 27/11/2017.
 */

public class Plato {

    private int id_promo;
    private String id_tamanio;
    private List<Ingrediente> extras;

    public Plato(){}

    public Plato(int id_promo, String id_tamanio, List<Ingrediente> extras){
        this.id_promo = id_promo;
        this.id_tamanio = id_tamanio;
        this.extras = extras;
    }

    public int getId_promo() { return id_promo; }

    public void setId_promo(int id_promo) { this.id_promo = id_promo; }

    public String getId_tamanio() { return id_tamanio; }

    public void setId_tamanio(String id_tamanio) { this.id_tamanio = id_tamanio; }

    public List<Ingrediente> getExtras() { return extras; }

    public void setExtras(List<Ingrediente> extras) { this.extras = extras; }
}
