part of 'tasks_cubit.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;
  final StatsModel statsModel;

  const TasksState({
    this.allTasks = const [],
    this.removedTasks = const [],
    this.statsModel = const StatsModel(),
  });

  @override
  List<Object> get props => [
        allTasks,
        removedTasks,
        statsModel,
      ];

  TasksState copyWith({
    List<Task>? allTasks,
    List<Task>? removedTasks,
    StatsModel? statsModel,
  }) {
    return TasksState(
      allTasks: allTasks ?? this.allTasks,
      removedTasks: removedTasks ?? this.removedTasks,
      statsModel: statsModel ?? this.statsModel,
    );
  }
}
