import 'package:todo_manager/todo_item.dart';
import 'package:todo_manager/todo_list.dart';

void main() {
  final todoList = TodoList();
  final todo1 = TodoItem(
    id: '1',
    title: '',
    description: 'Practice code review',
  );
  final todo2 = TodoItem(id: '2', title: 'Write tests', description: '');

  final todo3 = TodoItem(
    id: '1',
    title: 'Duplicate todo',
    description: 'This should not be allowed',
  );

  todoList.addTodo(todo1);
  todoList.addTodo(todo2);
  todoList.addTodo(todo3);

  print('Total todos: ${todoList.totalTodos}');
  print('Completed: ${todoList.completedCount}');
  print('Pending: ${todoList.pendingCount}');

  final foundTodo = todoList.findTodoById('1');
  print('Found todo: $foundTodo');
}
