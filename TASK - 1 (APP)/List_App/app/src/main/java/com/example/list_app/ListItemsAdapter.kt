package com.example.list_app

import android.graphics.Paint.STRIKE_THRU_TEXT_FLAG
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CheckedTextView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.item_todo.view.*

class ListItemsAdapter (
    private val items: MutableList<ListItems>
) : RecyclerView.Adapter<ListItemsAdapter.ListItemsViewHolder>() {

    class ListItemsViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ListItemsViewHolder {
        return ListItemsViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.item_todo,
                parent,
                false
            )
        )
    }

    fun addItems(item: ListItems) {
        items.add(item)
        notifyItemInserted(items.size - 1)
    }

    fun deleteDoneItems() {
        items.removeAll { item ->
            item.isChecked
        }
        notifyDataSetChanged()
    }

    private fun toggleStrikeThrough(tvListItems: TextView, isChecked: Boolean) {
        if (isChecked) {
            tvListItems.paintFlags = tvListItems.paintFlags or STRIKE_THRU_TEXT_FLAG
        } else {
            tvListItems.paintFlags = tvListItems.paintFlags and STRIKE_THRU_TEXT_FLAG.inv()
        }
    }

    override fun onBindViewHolder(holder: ListItemsViewHolder, position: Int) {
        val curItem=items[position]
        holder.itemView.apply {
            tvListItems.text = curItem.title
            cbDone.isChecked = curItem.isChecked
            toggleStrikeThrough(tvListItems, curItem.isChecked)
            cbDone.setOnCheckedChangeListener {_, isChecked ->
                toggleStrikeThrough(tvListItems, isChecked)
                curItem.isChecked = !curItem.isChecked
            }
        }
    }

    override fun getItemCount(): Int {
        return items.size
    }
}