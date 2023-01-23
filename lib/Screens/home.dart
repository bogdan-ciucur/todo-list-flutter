import 'package:flutter/material.dart';
import 'package:todo_list_flutter/Constants/colors.dart';
import 'package:todo_list_flutter/Constants/constants.dart';
import 'package:todo_list_flutter/Models/todo.dart';
import 'package:todo_list_flutter/Widgets/todo_item.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todoList = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: veritcalPadding),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      "All Todos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (Todo todo in todoList) ToDoItem(todo: todo,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cornerRadius)),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.menu, color: tdBlack, size: 30),
            Icon(Icons.account_circle)
          ]),
    );
  }
}
