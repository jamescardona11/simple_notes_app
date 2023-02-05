import 'package:flutter/material.dart';

import 'isar_database_page.dart';
import 'sembast_database_page.dart';

class HomePage extends StatefulWidget {
  /// default constructor
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DB Examples'),
      ),
      body: IndexedStack(
        index: index,
        children: [
          IsarDatabasePage(),
          SembastDatabasePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        elevation: 2,
        onTap: (i) => setState(() {
          index = i;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
            ),
            label: 'Isar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cached,
            ),
            label: 'Sembast',
          ),
        ],
      ),
    );
  }
}
