package com.example.mellis.domino_android.dominoapp;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.example.mellis.domino_android.R;
import com.example.mellis.domino_android.adapter.PedidoAdapter;
import com.example.mellis.domino_android.modelo.Pedido;
import com.example.mellis.domino_android.service.PedidosService;

import java.util.List;

import retrofit.Call;
import retrofit.Callback;
import retrofit.GsonConverterFactory;
import retrofit.Response;
import retrofit.Retrofit;

/**
 * A fragment representing a single Pedido detail screen.
 * This fragment is either contained in a {@link PedidoListActivity}
 * in two-pane mode (on tablets) or a {@link PedidoDetailActivity}
 * on handsets.
 */
public class PedidoDetailFragment extends Fragment {
    /**
     * The fragment argument representing the item ID that this fragment
     * represents.
     */
    public static final String ARG_ITEM_ID = "item_id";

    /**
     * The dummy content this fragment is presenting.
     */
    private Pedido pedido;

    private PedidosService pedidosService;

    private PedidoDetailFragment self = this;

    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public PedidoDetailFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (getArguments().containsKey(ARG_ITEM_ID)) {
            // Load the dummy content specified by the fragment
            // arguments. In a real-world scenario, use a Loader
            // to load content from a content provider.
            long pedidoId = (long) getArguments().get(ARG_ITEM_ID);

            String BASE_URL = "http://8.8.8.8:8080/pedidos/";

            Retrofit retrofit = new Retrofit.Builder()
                    .baseUrl(BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create())
                    .build();

            pedidosService = retrofit.create(PedidosService.class);
            this.recuperarPedido(pedidoId);


        }
    }

    private void recuperarPedido(long pedidoId) {
        Call<Pedido> pedidoCall = pedidosService.getPedidoById(String.valueOf(pedidoId));

        pedidoCall.enqueue(new Callback<Pedido>() {
            @Override
            public void onResponse(Response<Pedido> response, Retrofit retrofit) {
                Pedido pedido = response.body();

                Activity activity = self.getActivity();
                CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
                if (appBarLayout != null) {
                    appBarLayout.setTitle("Pedido " + pedido.getId());
                } else {
                    activity.setTitle("Pedido " + pedido.getId());
                }
                System.out.println(pedido.getAclaraciones());
                System.out.println(pedido.getMonto());


            }

            @Override
            public void onFailure(Throwable t) {
                t.printStackTrace();
                Log.e("PedidosApp", t.getMessage());
            }
        });
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_pedido_detail, container, false);

        // Show the dummy content as text in a TextView.
        System.out.println("Estamos en el onCreateView");
        //((TextView) rootView.findViewById(R.id.pedido_estado)).setText(pedido.getEstado());
        //((TextView) rootView.findViewById(R.id.pedido_aclaracion)).setText(pedido.getAclaraciones());


        return rootView;
    }
}
