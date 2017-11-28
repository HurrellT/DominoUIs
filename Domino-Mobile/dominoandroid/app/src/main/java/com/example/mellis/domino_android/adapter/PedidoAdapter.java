package com.example.mellis.domino_android.adapter;

import android.content.Context;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.TextView;

import com.example.mellis.domino_android.R;
import com.example.mellis.domino_android.modelo.Pedido;

import java.util.List;

/**
 * Created by Mellis on 23/11/2017.
 */

public class PedidoAdapter extends ArrayAdapter<Pedido> {
    public PedidoAdapter(Context context, List<Pedido> pedidos) {
        super(context, R.layout.pedido_row, pedidos);
    }

    @Override
    public long getItemId(int position) {
        //return position;
        return getItem(position).getId();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.pedido_row, parent, false);
        final Pedido pedido = getItem(position);

        TextView tvId = (TextView) rowView.findViewById(R.id.lblId);
        String id = String.valueOf(pedido.getId());
        tvId.setText("Pedido " + id);
        TextView tvEstado = (TextView) rowView.findViewById(R.id.lblEstado);
        tvEstado.setText("Estado: " + pedido.getEstado());
        TextView tvMonto = (TextView) rowView.findViewById(R.id.lblMonto);
        String monto = String.valueOf(pedido.getMonto());
        tvMonto.setText("$" + monto);
        TextView tvAclaracion = (TextView) rowView.findViewById(R.id.lblAclaracion);
        tvAclaracion.setText(pedido.getAclaraciones());
        return rowView;
    }
}
