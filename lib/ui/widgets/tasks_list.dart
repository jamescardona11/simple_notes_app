import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';
import 'package:simple_notes_app/domian/domian.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    Key? key,
    required this.tasks,
    this.showRecovery = false,
  }) : super(key: key);

  final List<Task> tasks;
  final bool showRecovery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return TaskItem(
            task: task,
            showRecovery: showRecovery,
          );
        },
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.task,
    this.showRecovery = false,
  }) : super(key: key);

  final Task task;
  final bool showRecovery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            // onToDoChanged(todo);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Checkbox(
                  value: task.isDone,
                  onChanged: task.isDeleted == false
                      ? (value) {
                          context.read<TasksCubit>().completeTask(task);
                        }
                      : null,
                ),
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                const Spacer(),
                if (showRecovery)
                  _ActionIconWidget(
                    color: Theme.of(context).primaryColor,
                    icon: FontAwesomeIcons.arrowsRotate,
                    onTap: () async {},
                  ),
                _ActionIconWidget(
                  color: Colors.red,
                  icon: FontAwesomeIcons.trash,
                  onTap: () async {
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
              ],
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

class _ActionIconWidget extends StatelessWidget {
  const _ActionIconWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        color: Colors.white,
        icon: FaIcon(icon, size: 16),
        onPressed: onTap,
      ),
    );
  }
}
