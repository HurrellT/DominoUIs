package com.example.mellis.domino_android.modelo;

import java.io.Serializable;

/**
 * Created by Mellis on 23/11/2017.
 */

public class Pedido implements Serializable {
    public long getId() {
        return new Long(21354);
    }

    public CharSequence getNombrePedido() {
        return "Luca estuvo aqui";
    }

    public String getEstado() {
        return "Aca va el estado de tu pedido";
    }

    public String getAclaracion() {
        return "Aca va la aclaracion de un pedido";
    }
}
