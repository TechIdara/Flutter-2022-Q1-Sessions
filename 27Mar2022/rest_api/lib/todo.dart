class Todo {
  String? title;
  String? description;
  String? category;
  int? timestamp;
  int? priority;
  String? user_id;
  bool? isCompleted;
  String? id;

  Todo(
      {this.title,
      this.description,
      this.category,
      this.timestamp,
      this.priority,
      this.user_id,
      this.isCompleted,
      this.id});

  static List<Todo> fromJsonList(List<dynamic> json) {
    List<Todo> tempTodos = [];
    for (var jsonTodo in json) {
      var jsonTodoMap = jsonTodo as Map<String, dynamic>;
      tempTodos.add(Todo(
        title: jsonTodoMap['title'],
        description: jsonTodoMap['description'],
        category: jsonTodoMap['category'],
        timestamp: jsonTodoMap['timestamp'],
        priority: jsonTodoMap['priority'],
        user_id: jsonTodoMap['user_id'],
        isCompleted: jsonTodoMap['isCompleted'],
        id: jsonTodoMap['id'],
      ));
    }
    return tempTodos;
  }
}
