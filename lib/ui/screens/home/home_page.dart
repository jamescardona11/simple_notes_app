import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:simple_notes_app/ui/ui.dart';

class HomePage extends StatefulWidget {
  /// default constructor
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pageList = [];
  int indexPage = 0;

  @override
  void initState() {
    pageList.addAll([
      TasksView(onDrawerItemTap: onDrawerItemTap),
      DeletedTaskView(),
      CompletedTaskView(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        // actions: [
        //   IconButton(
        //     onPressed: () => showModalBox(context),
        //     icon: const Icon(Icons.add),
        //   ),
        // ],
      ),
      drawer: MyDrawer(
        onDrawerItemTap: onDrawerItemTap,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: pageList[indexPage],
      ),
    );
  }

  void onDrawerItemTap(int index) {
    if (index == indexPage) return;
    setState(() {
      indexPage = index;
    });
  }
}
