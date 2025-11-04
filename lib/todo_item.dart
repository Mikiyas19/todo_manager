class TodoItem {
  final String id;
  final String title;
  final String description;
  bool isCompleted;
  final DateTime createdAt;

  TodoItem({required this.id, required this.title, required this.description})
    : isCompleted = false,
      createdAt = DateTime.now();

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return 'TodoItem(id: $id, title: $title, completed: $isCompleted)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
