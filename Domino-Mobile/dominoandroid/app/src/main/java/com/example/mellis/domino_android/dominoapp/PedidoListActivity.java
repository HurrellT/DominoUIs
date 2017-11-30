package com.example.mellis.domino_android.dominoapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.view.View;

import com.example.mellis.domino_android.R;
import com.example.mellis.domino_android.modelo.Pedido;

/**
 * An activity representing a list of Peliculas. This activity
 * has different presentations for handset and tablet-size devices. On
 * handsets, the activity presents a list of items, which when touched,
 * lead to a {@link PedidoDetailActivity} representing
 * item details. On tablets, the activity presents the list of items and
 * item details side-by-side using two vertical panes.
 * <p/>
 * The activity makes heavy use of fragments. The list of items is a
 * {@link PedidoListFragment} and the item details
 * (if present) is a {@link PedidoDetailFragment}.
 * <p/>
 * This activity also implements the required
 * {@link PedidoListFragment.Callbacks} interface
 * to listen for item selections.
 */
public class PedidoListActivity extends AppCompatActivity implements PedidoListFragment.Callbacks {

    /**
     * Whether or not the activity is in two-pane mode, i.e. running on a tablet
     * device.
     */
    private boolean mTwoPane;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedido_app_barr);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle(getTitle());

        if (findViewById(R.id.pedido_detail_container) != null) {
            // The detail container view will be present only in the
            // large-screen layouts (res/values-large and
            // res/values-sw600dp). If this view is present, then the
            // activity should be in two-pane mode.
            mTwoPane = true;

            // In two-pane mode, list items should be given the
            // 'activated' state when touched.
            ((PedidoListFragment) getSupportFragmentManager()
                    .findFragmentById(R.id.pelicula_list)) //TODO:Ver con que reemplazarlo
                    .setActivateOnItemClick(true);
        }
    }

    /**
     * Callback method from {@link PedidoListFragment.Callbacks}
     * indicating that the item with the given ID was selected.
     */

    @Override
    public void onItemSelected(long id) {
        if (mTwoPane) {
            // In two-pane mode, show the detail view in this activity by
            // adding or replacing the detail fragment using a
            // fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putSerializable(PedidoDetailFragment.ARG_ITEM_ID, id);
            PedidoDetailFragment fragment = new PedidoDetailFragment();
            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.pedido_detail_container, fragment)
                    .commit();

        } else {
            // In single-pane mode, simply start the detail activity
            // for the selected item ID.
            Intent detailIntent = new Intent(this, PedidoDetailActivity.class);
            detailIntent.putExtra(PedidoDetailFragment.ARG_ITEM_ID, id);
            startActivity(detailIntent);
        }
    }
}
