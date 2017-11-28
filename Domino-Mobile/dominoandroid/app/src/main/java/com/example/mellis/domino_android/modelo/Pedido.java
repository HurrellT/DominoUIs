package com.example.mellis.domino_android.modelo;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Mellis on 23/11/2017.
 */

public class Pedido implements Serializable {

    private long id;
    private String estado;
    private long monto;
    private List<Plato> platos;
    private String id_usuario;
    private String aclaraciones;

    public Pedido(){}

    public Pedido(long id, String estado, long monto, List<Plato> platos, String id_usuario, String aclaraciones){
        this.id = id;
        this.estado = estado;
        this.monto = monto;
        this.platos = platos;
        this.id_usuario = id_usuario;
        this.aclaraciones = aclaraciones;
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id){ this.id = id;}

    public CharSequence getEstado() { return this.estado; }

    public void setEstado(String estado){ this.estado = estado; }

    public long getMonto(){ return this.monto; }

    public void setMonto(long monto){ this.monto = monto; }

    public String getAclaraciones() {
        return this.aclaraciones;
    }

    public void setAclaraciones(String aclaraciones){ this.aclaraciones = aclaraciones;}
}
