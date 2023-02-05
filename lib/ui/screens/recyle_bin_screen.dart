import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/ui/ui.dart';

class RecycleBinScreen extends StatelessWidget {
  static const id = 'recycle-bin';
  const RecycleBinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(
                    'Deleted tasks: 0',
                  ),
                ),
              ),
              TasksList(tasks: state.removedTasks),
            ],
          ),
        ),
      );
    });
  }
}
