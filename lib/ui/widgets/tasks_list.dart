import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../domian/models/tasks_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({
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
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted == false
              ? (value) {
                  context.read<TasksBloc>().updateTask(task);
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
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure!"),
                  content: const Text("You want to delete?"),
                  actions: <Widget>[
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
    );
  }

  void removeTask({
    required BuildContext ctx,
    required Task task,
  }) {
    task.isDeleted ? ctx.read<TasksBloc>().removeTask(task.id) : ctx.read<TasksBloc>().deleteTask(task.id);
    Navigator.pop(ctx);
  }
}
