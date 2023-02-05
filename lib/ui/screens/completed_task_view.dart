import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/ui/ui.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  @override
  void initState() {
    print('Init completed task view');
    context.read<TasksCubit>().readCompletedTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      // selector: (state) => state.removedTasks,
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StatCard(
                color: Colors.amber,
                label: 'Total Completed',
                taskLength: state.removedTasks.length,
              ),
              TasksListWidget(
                tasks: state.allTasks,
                showRecovery: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
