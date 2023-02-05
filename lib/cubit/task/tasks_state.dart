part of 'tasks_cubit.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;
  final List<Task> completedTask;
  final StatsModel statsModel;
  final int completedTaskPagination;

  const TasksState({
    this.allTasks = const [],
    this.completedTask = const [],
    this.removedTasks = const [],
    this.statsModel = const StatsModel(),
    this.completedTaskPagination = 0,
  });

  @override
  List<Object> get props => [
        allTasks,
        removedTasks,
        statsModel,
        completedTask,
        completedTaskPagination,
      ];

  TasksState copyWith({
    List<Task>? allTasks,
    List<Task>? completedTask,
    List<Task>? removedTasks,
    StatsModel? statsModel,
    int? completedTaskPagination,
  }) {
    return TasksState(
      allTasks: allTasks ?? this.allTasks,
      completedTask: completedTask ?? this.completedTask,
      removedTasks: removedTasks ?? this.removedTasks,
      statsModel: statsModel ?? this.statsModel,
      completedTaskPagination: completedTaskPagination ?? this.completedTaskPagination,
    );
  }
}
