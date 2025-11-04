import 'package:test/test.dart';
import 'package:todo_manager/todo_item.dart';
import 'package:todo_manager/todo_list.dart';

void main() {
  group('TodoItem', () {
    test('should create todo with correct initial values', () {
      final todo = TodoItem(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
      );

      expect(todo.id, '1');
      expect(todo.title, 'Test Todo');
      expect(todo.isCompleted, false);
    });

    test('should toggle completion status', () {
      final todo = TodoItem(id: '1', title: 'Test', description: 'Test');

      todo.toggleCompletion();
      expect(todo.isCompleted, true);

      todo.toggleCompletion();
      expect(todo.isCompleted, false);
    });

    test('should have proper equality', () {
      final todo1 = TodoItem(id: '1', title: 'A', description: 'Desc');
      final todo2 = TodoItem(id: '1', title: 'B', description: 'Different');

      expect(todo1, todo2);
    });
  });

  group('TodoList', () {
    test('should add todo to list', () {
      final todoList = TodoList();
      final todo = TodoItem(id: '1', title: 'Test', description: 'Test');

      todoList.addTodo(todo);

      expect(todoList.totalTodos, 1);
      expect(todoList.items[0].title, 'Test');
    });

    test('should allow duplicates', () {
      final todoList = TodoList();
      final todo1 = TodoItem(id: '1', title: 'A', description: 'Desc');
      final todo2 = TodoItem(id: '1', title: 'B', description: 'Different');

      todoList.addTodo(todo1);
      todoList.addTodo(todo2);

      expect(todoList.totalTodos, 2);
    });

    test('should handle null return from find', () {
      final todoList = TodoList();

      final result = todoList.findTodoById('nonexistent');

      expect(result, isNull);
    });
  });
}
