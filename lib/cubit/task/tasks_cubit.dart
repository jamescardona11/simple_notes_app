import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:simple_notes_app/domian/domian.dart';

import '../cubit_exports.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this._createTaskUseCase,
    this._updateTaskUseCase,
    this._removeTaskUseCase,
    this._readAllTaskUseCase,
    this._readStatsUseCase,
    this._readDeletedTaskUseCase,
    this._readLastCompletedTaskUseCase,
  ) : super(const TasksState()) {
    print('Init Task Cubit');

    _initStreamListeners();
  }

  final CreateTaskUseCase _createTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final RemoveTaskUseCase _removeTaskUseCase;
  final ReadAllTaskUseCase _readAllTaskUseCase;
  final ReadStatsUseCase _readStatsUseCase;
  final ReadDeletedTaskUseCase _readDeletedTaskUseCase;
  final ReadLastCompletedTaskUseCase _readLastCompletedTaskUseCase;

  StreamSubscription<List<Task>>? _streamTasksSubscription;
  StreamSubscription<List<Task>>? _streamDeletedTasksSubscription;
  StreamSubscription<StatsModel>? _streamStatsSubscription;

  @override
  Future<void> close() {
    _streamTasksSubscription?.cancel();
    _streamDeletedTasksSubscription?.cancel();
    _streamStatsSubscription?.cancel();

    return super.close();
  }

  Future<void> addTask(Task task) async {
    await _createTaskUseCase.call(task);
  }

  Future<void> completeTask(Task task) async {
    await _updateTaskUseCase.call(task.copyWith(isDone: true));
  }

  // archive task - delete temporary
  Future<void> deleteTask(String id) async {
    final task = state.allTasks.firstWhere((element) => element.id == id);
    await _updateTaskUseCase.call(task.copyWith(isDeleted: true));
  }

  Future<void> removeTask(String id) async {
    await _removeTaskUseCase.call(id);
  }

  Future<void> readCompletedTask() async {
    final items = await _readLastCompletedTaskUseCase.call(
      state.completedTaskPagination,
    );

    emit(state.copyWith(completedTask: items, completedTaskPagination: items.length));
  }

  Future<void> _initStreamListeners() async {
    _streamTasksSubscription = _readAllTaskUseCase.call().listen((tasks) {
      emit(state.copyWith(
        allTasks: tasks.where((element) => !element.isDeleted).toList(),
      ));
    });

    // This use_case is to show how to work with queries - filtering
    // probably for this app, we can avoid the creation of this use case
    _streamDeletedTasksSubscription = _readDeletedTaskUseCase.call().listen((tasks) {
      emit(state.copyWith(
        removedTasks: tasks,
      ));
    });

    _streamStatsSubscription = _readStatsUseCase.call().listen((stat) {
      emit(state.copyWith(statsModel: stat));
    });
  }
}
