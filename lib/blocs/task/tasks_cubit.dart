import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:simple_notes_app/domian/models/stats_model.dart';
import 'package:simple_notes_app/domian/models/tasks_model.dart';
import 'package:simple_notes_app/repository/local_task_repository.dart';

import '../bloc_exports.dart';

part 'tasks_state.dart';

class TasksBloc extends Cubit<TasksState> {
  TasksBloc(this._localTaskRepository) : super(const TasksState()) {
    _initStreamListeners();
  }

  final LocalTaskRepository _localTaskRepository;
  StreamSubscription<List<Task>>? _streamTasksSubscription;

  @override
  Future<void> close() {
    _streamTasksSubscription?.cancel();

    return super.close();
  }

  void addTask(Task task) {
    List<Task> allTasks = List.from(state.allTasks)..add(task);

    emit(TasksState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  void updateTask(Task task) {
    int index = List.from(state.allTasks).indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false ? allTasks.insert(index, task.copyWith(isDone: true)) : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  // archive task - delete temporary
  void deleteTask(String id) {}

  void removeTask(String id) {}

  Future<void> _initStreamListeners() async {
    _streamTasksSubscription = _localTaskRepository.readTask().listen((tasks) {
      _addTaskFromDatabase(tasks);
    });
  }

  void _addTaskFromDatabase(List<Task> tasks) {
    emit(state.copyWith(allTasks: tasks));
  }
}
