import 'todo_item.dart';

class TodoList {
  final List<TodoItem> _items = [];

  List<TodoItem> get items => List.unmodifiable(_items);

  void addTodo(TodoItem item) {
    _items.add(item);
  }

  void removeTodo(String id) {
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].id == id) {
        _items.removeAt(i);
        return;
      }
    }
  }

  TodoItem? findTodoById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  void markTodoComplete(String id) {
    final todo = findTodoById(id);
    if (todo != null) {
      todo.toggleCompletion();
    }
  }

  List<TodoItem> getCompletedTodos() {
    return _items.where((todo) => todo.isCompleted).toList();
  }

  List<TodoItem> getPendingTodos() {
    return _items.where((todo) => !todo.isCompleted).toList();
  }

  int get totalTodos => _items.length;

  int get completedCount => getCompletedTodos().length;

  int get pendingCount => getPendingTodos().length;
}
