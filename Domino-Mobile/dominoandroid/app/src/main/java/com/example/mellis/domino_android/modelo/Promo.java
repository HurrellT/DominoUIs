package com.example.mellis.domino_android.modelo;

/**
 * Created by Mellis on 30/11/2017.
 */

public class Promo {
    public long id;
    public String nombre;
    public int precio;

    public Promo(){
    }

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

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
}
