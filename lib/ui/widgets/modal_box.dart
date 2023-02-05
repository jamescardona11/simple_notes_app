import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';

import '../../domian/models/tasks_model.dart';

void showModalBox(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).copyWith().size.height * 0.55,
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
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              // autofocus: true,
              decoration: const InputDecoration(
                helperMaxLines: 3,
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        var task = Task.create(
                          title: titleController.text,
                        );
                        context.read<TasksCubit>().addTask(task);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Add'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
