package com.example.mellis.domino_android.modelo;

import android.content.Context;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.TextView;

import com.example.mellis.domino_android.R;

import java.util.List;

/**
 * Created by Mellis on 23/11/2017.
 */

public class PedidoAdapter extends ArrayAdapter<Pedido> {
    public PedidoAdapter(Context context, List<Pedido> peliculas) {
        super(context, R.layout.pedido_row, peliculas);
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

        TextView tvPelicula = (TextView) rowView.findViewById(R.id.lblPelicula);
        tvPelicula.setText(pedido.toString());
        return rowView;
    }
}
