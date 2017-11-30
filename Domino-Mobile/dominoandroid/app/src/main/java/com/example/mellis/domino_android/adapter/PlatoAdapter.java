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
import com.example.mellis.domino_android.modelo.Promo;
import com.example.mellis.domino_android.service.PedidosService;

import java.sql.DatabaseMetaData;
import java.util.ArrayList;
import java.util.List;

import retrofit.Call;
import retrofit.Callback;
import retrofit.GsonConverterFactory;
import retrofit.Response;
import retrofit.Retrofit;

/**
 * Created by brian on 30/11/2017.
 */

public class PlatoAdapter extends ArrayAdapter<Plato> {

    private PedidosService pedidosService;

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

        //necesito pedir la promo del plato para mostrarla

        String BASE_URL = "http://192.168.0.4:8080/pedidos/";

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        pedidosService = retrofit.create(PedidosService.class);

        this.mostrarPedidoConPromo(plato,rowView);

        return rowView;
    }

    private void mostrarPedidoConPromo(Plato plato, View rowView) {
        Call<Promo> promoCall = pedidosService.getPromoById(String.valueOf(plato.getId_promo()));

        promoCall.enqueue(new Callback<Promo>() {
            @Override
            public void onResponse(Response<Promo> response, Retrofit retrofit) {
                Promo promo = response.body();

                mostrarPlato(plato,promo,rowView);
            }

            @Override
            public void onFailure(Throwable t) {

            }
        });

    }

    private void mostrarPlato(Plato plato, Promo promo, View rowView) {
        TextView tvId = (TextView) rowView.findViewById(R.id.lblPromo);
        tvId.setText("Promo " + promo.getNombre());
        TextView tvTamanio = (TextView) rowView.findViewById(R.id.lblTamanio);
        tvTamanio.setText("Tamanio: " + plato.getId_tamanio());
    }


}
