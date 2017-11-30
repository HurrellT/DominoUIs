package com.example.mellis.domino_android.modelo;

/**
 * Created by Mellis on 30/11/2017.
 */

public class Ingrediente {
    private long id;
    private String distribucionElegida;
    public Ingrediente(){
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDistribucionElegida() {
        return distribucionElegida;
    }

    public void setDistribucionElegida(String distribucionElegida) {
        this.distribucionElegida = distribucionElegida;
    }
}
