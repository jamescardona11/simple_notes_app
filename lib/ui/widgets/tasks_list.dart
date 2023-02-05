import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/domian/domian.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return TaskItem(task: task);
        },
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: ListTile(
          onTap: () {
            // onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TasksCubit>().completeTask(task);
                  }
                : null,
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: task.isDeleted ? Theme.of(context).primaryColor : Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: task.isDeleted ? const Icon(Icons.compare_arrows_outlined) : const Icon(Icons.delete),
              onPressed: () async {
                await showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Are you sure!"),
                    content: const Text("You want to delete?"),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text("Delete"),
                        onPressed: () => removeTask(ctx: context, task: task),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void removeTask({
    required BuildContext ctx,
    required Task task,
  }) {
    task.isDeleted ? ctx.read<TasksCubit>().removeTask(task.id) : ctx.read<TasksCubit>().deleteTask(task.id);
    Navigator.pop(ctx);
  }
}
