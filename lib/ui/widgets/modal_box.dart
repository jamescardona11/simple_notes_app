import 'package:flutter/material.dart';
import 'package:simple_notes_app/blocs/bloc_exports.dart';

import '../../domian/models/tasks_model.dart';

void showModalBox(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  showModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).copyWith().size.height * 0.75,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  helperMaxLines: 1,
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var task = Task.create(
                        title: titleController.text,
                      );
                      context.read<TasksBloc>().addTask(task);
                      Navigator.pop(context);
                    },
                    child: const Text("Add"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
