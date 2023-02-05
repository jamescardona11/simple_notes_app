import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/ui/ui.dart';

class DeletedTaskView extends StatelessWidget {
  const DeletedTaskView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TasksCubit, TasksState, List<Task>>(
      selector: (state) => state.removedTasks,
      builder: (context, removedTasks) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StatCard(
                color: Colors.amber,
                label: 'Total Deleted',
                taskLength: removedTasks.length,
              ),
              TasksListWidget(
                tasks: removedTasks,
                showRecovery: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
