package com.example.mellis.domino_android.repo;

import com.example.mellis.domino_android.modelo.Pedido;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Mellis on 23/11/2017.
 */

public class RepoPedidos {


    private static List<Pedido> pedidos = new ArrayList<Pedido>();

    public static List<Pedido> getPedidos(Object o, int i) {
        pedidos.add(new Pedido());
        pedidos.add(new Pedido());
        return pedidos;
    }

    public static Pedido getPedido(long id) {
        return pedidos.get(0);
    }
}
