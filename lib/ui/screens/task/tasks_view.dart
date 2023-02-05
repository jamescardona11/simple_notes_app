import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/domian/models/tasks_model.dart';
import 'package:simple_notes_app/ui/ui.dart';
import 'package:simple_notes_app/ui/widgets/tasks_list.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    Key? key,
  }) : super(key: key);

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
                    ),
                  ),
                  Expanded(
                    child: StatCard(
                      color: Colors.indigoAccent,
                      label: 'PendingTask Tasks',
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
