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

public class PedidoListActivity extends AppCompatActivity implements PedidoListFragment.Callbacks {

    private boolean mTwoPane;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedido_app_barr);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle(getTitle());

        if (findViewById(R.id.pedido_detail_container) != null) {
            mTwoPane = true;
            ((PedidoListFragment) getSupportFragmentManager()
                    .findFragmentById(R.id.pedido_list))
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
