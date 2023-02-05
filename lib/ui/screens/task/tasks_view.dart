import 'package:flutter/material.dart';
import 'package:simple_notes_app/blocs/bloc_exports.dart';
import 'package:simple_notes_app/models/tasks_model.dart';
import 'package:simple_notes_app/ui/ui.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
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
              TasksList(tasks: tasksList),
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
