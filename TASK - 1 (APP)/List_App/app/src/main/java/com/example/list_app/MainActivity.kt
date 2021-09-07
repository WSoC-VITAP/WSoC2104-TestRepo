package com.example.list_app

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private lateinit var todoAdapter: ListItemsAdapter
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        todoAdapter = ListItemsAdapter(mutableListOf())
        rvListItems.adapter = todoAdapter
        rvListItems.layoutManager = LinearLayoutManager(this)
        btnAddItem.setOnClickListener {
            val todoTitle = etListItems.text.toString()
            if (todoTitle.isNotEmpty()) {
                val todo = ListItems(todoTitle)
                todoAdapter.addItems(todo)
                etListItems.text.clear()
            }
        }
        btnDeleteItem.setOnClickListener {
            todoAdapter.deleteDoneItems()
        }
    }
}