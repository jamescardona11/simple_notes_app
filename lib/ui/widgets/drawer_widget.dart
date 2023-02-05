import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.onDrawerItemTap,
  });

  final ValueChanged<int> onDrawerItemTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) => Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Text(
                  "Menu",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  onDrawerItemTap.call(0);
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.listCheck,
                      size: 18,
                    ),
                  ],
                ),
                trailing: Text(state.allTasks.length.toString()),
                title: const Text("My Tasks"),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  onDrawerItemTap.call(1);
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.trash,
                      size: 18,
                    ),
                  ],
                ),
                trailing: Text(state.removedTasks.length.toString()),
                title: const Text("Deleted task"),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  onDrawerItemTap.call(2);
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.check,
                      size: 18,
                    ),
                  ],
                ),
                // trailing: Text(state.statsModel.completedTask.toString()),
                title: const Text("Completed task"),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.read<TasksCubit>().create100RandomTask();
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.shuffle,
                      size: 18,
                    ),
                  ],
                ),
                // trailing: Text(state.statsModel.completedTask.toString()),
                title: const Text("Create Random task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
