import 'package:flutter/material.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.onDrawerItemTap,
  });

  final ValueChanged<int> onDrawerItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            BlocBuilder<TasksCubit, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  leading: const Icon(Icons.create_new_folder),
                  trailing: Text(state.allTasks.length.toString()),
                  title: const Text("My Tasks"),
                );
              },
            ),
            BlocBuilder<TasksCubit, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  leading: const Icon(Icons.delete),
                  trailing: Text(state.removedTasks.length.toString()),
                  title: const Text("Deleted task"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
