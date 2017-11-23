package com.example.mellis.domino_android;

import android.app.Activity;
import android.support.design.widget.CollapsingToolbarLayout;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.mellis.domino_android.dummy.DummyContent;
import com.example.mellis.domino_android.modelo.Pedido;

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
            pedido = (Pedido) getArguments().get(ARG_ITEM_ID);

            Activity activity = this.getActivity();
            CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
            if (appBarLayout != null) {
                appBarLayout.setTitle(pedido.getNombrePedido());
            } else {
                activity.setTitle(pedido.getNombrePedido());
            }
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_pedido_detail, container, false);

        // Show the dummy content as text in a TextView.
        if (pedido != null) {
            ((TextView) rootView.findViewById(R.id.pedido_estado)).setText(pedido.getEstado());
            ((TextView) rootView.findViewById(R.id.pedido_aclaracion)).setText(pedido.getAclaracion());
        }

        return rootView;
    }
}