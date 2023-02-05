import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:simple_notes_app/domian/domian.dart';

import '../cubit_exports.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this._createTaskUseCase,
    this._updateTaskUseCase,
    this._readAllTaskUseCase,
    this._readStatsUseCase,
  ) : super(const TasksState()) {
    _initStreamListeners();
  }

  final CreateTaskUseCase _createTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final ReadAllTaskUseCase _readAllTaskUseCase;
  final ReadStatsUseCase _readStatsUseCase;

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
    // _streamTasksSubscription = _localTaskRepository.readTask().listen((tasks) {
    //   _addTaskFromDatabase(tasks);
    // });
  }

  void _addTaskFromDatabase(List<Task> tasks) {
    emit(state.copyWith(allTasks: tasks));
  }
}
