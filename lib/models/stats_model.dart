class StatsModel {
  final int pendingTask;
  final int completedTask;

  const StatsModel({
    this.pendingTask = 0,
    this.completedTask = 0,
  });

  @override
  bool operator ==(covariant StatsModel other) {
    if (identical(this, other)) return true;

    return other.pendingTask == pendingTask && other.completedTask == completedTask;
  }

  @override
  int get hashCode => pendingTask.hashCode ^ completedTask.hashCode;
}
