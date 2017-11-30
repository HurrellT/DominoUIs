package com.example.mellis.domino_android.adapter;

import android.app.Fragment;
import android.content.Context;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.example.mellis.domino_android.R;
import com.example.mellis.domino_android.modelo.Plato;

import java.sql.DatabaseMetaData;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by brian on 30/11/2017.
 */

public class PlatoAdapter extends ArrayAdapter<Plato> {

    public PlatoAdapter(Context context, List<Plato> platos) {
        super(context, R.layout.plato_row, platos);
    }

    @Override
    public long getItemId(int position) {
        //return position;
        return getItem(position).getId_promo();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.plato_row, parent, false);
        final Plato plato = getItem(position);

        TextView tvId = (TextView) rowView.findViewById(R.id.lblPromo);
        String id = String.valueOf(plato.getId_promo());
        tvId.setText("Promo " + id);
        TextView tvTamanio = (TextView) rowView.findViewById(R.id.lblTamanio);
        tvTamanio.setText("Tamanio: " + plato.getId_tamanio());

        return rowView;
    }


}
