class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<Todo> todoList() {
    return [
      Todo(id: "0", todoText: "Some Text 0", isDone: true),
      Todo(id: "1", todoText: "Some Text 1", isDone: true),
      Todo(id: "2", todoText: "Some Text 2"),
      Todo(id: "3", todoText: "Some Text 3"),
      Todo(id: "4", todoText: "Some Text 4"),
      Todo(id: "5", todoText: "Some Text 5"),
    ];
  }
}