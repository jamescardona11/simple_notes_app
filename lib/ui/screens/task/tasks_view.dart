// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/domian/models/tasks_model.dart';
import 'package:simple_notes_app/ui/ui.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    Key? key,
    required this.onDrawerItemTap,
  }) : super(key: key);

  final ValueChanged<int> onDrawerItemTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
        // backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StatCard(
                      color: Colors.amber,
                      label: 'Completed Tasks',
                      taskLength: state.statsModel.completedTask,
                      onTap: () {
                        onDrawerItemTap.call(2);
                      },
                    ),
                  ),
                  Expanded(
                    child: StatCard(
                      color: Colors.indigoAccent,
                      label: 'PendingTask Tasks',
                      taskLength: state.statsModel.pendingTask,
                    ),
                  ),
                ],
              ),
              TasksListWidget(
                tasks: tasksList,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBox(context),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
