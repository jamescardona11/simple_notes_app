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
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: context.read<TasksCubit>().readCompletedTask,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Show more completed tasks'),
                  ),
                ),
                const SizedBox(height: 20),
                TasksListWidget(
                  tasks: state.completedTask,
                  // showRecovery: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
