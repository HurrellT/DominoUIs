package com.example.mellis.domino_android.adapter;

/**
 * Created by Mellis on 30/11/2017.
 */

public class IngredienteReal {
    private long id;
    private String nombre;
    private double precio;
    private String distribucionElegida;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDistribucionElegida() {
        return distribucionElegida;
    }

    public void setDistribucionElegida(String distribucionElegida) {
        this.distribucionElegida = distribucionElegida;
    }
}
