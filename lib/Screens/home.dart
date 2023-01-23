import 'package:flutter/material.dart';
import 'package:todo_list_flutter/Constants/colors.dart';
import 'package:todo_list_flutter/Constants/constants.dart';
import 'package:todo_list_flutter/Models/todo.dart';
import 'package:todo_list_flutter/Widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = [];
  final todoController = TextEditingController();
  List<Todo> foundTodos = [];

  @override
  void initState() {
    setState(() {
      foundTodos = todoList;
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todo in foundTodos)
                        ToDoItem(
                          todo: todo,
                          onTodoChanged: handleTodoChange,
                          onDelete: deleteTodo,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        hintText: "Add a new todo",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      addTodo(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;

      if (todo.isDone) {
        todoList.remove(todo);

        todoList.insert(todoList.length, todo);
      } else {
        todoList.remove(todo);

        todoList.insert(0, todo);
      }
    });
  }

  void deleteTodo(String id) {
    setState(() {
      todoList.removeWhere((todo) => todo.id == id);
    });
  }

  void addTodo(String todoText) {
    setState(() {
      if (todoController.text.isNotEmpty)
        todoList.insert(
            0,
            Todo(
                id: UniqueKey().toString(), todoText: todoText, isDone: false));
    });

    todoController.clear();
  }

  void searchTodos(String searchedText) {
    List<Todo> results = [];

    if (searchedText.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((todo) =>
              todo.todoText.toLowerCase().contains(searchedText.toLowerCase()))
          .toList();
    }

    setState(() {
      foundTodos = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => searchTodos(value),
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
          hintText: 'Search',
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
