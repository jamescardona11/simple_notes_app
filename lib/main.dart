import 'package:flutter/material.dart';
import 'package:simple_notes_app/repository/local_task_repository.dart';
import 'package:simple_notes_app/ui/screens/home/home_page.dart';

import 'blocs/bloc_exports.dart';
import 'repository/db_core/db_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ICarbonAdapter dbImplementation = await _initDB();

  final localTaskRepository = LocalTaskRepository(dbImplementation);

  runApp(MyApp(
    localTaskRepository: localTaskRepository,
  ));
}

Future<ICarbonAdapter> _initDB() {
  return IsarAdapterImp.initAdapter();
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.localTaskRepository,
  }) : super(key: key);

  final LocalTaskRepository localTaskRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc(localTaskRepository),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        // initialRoute: '/',
        // onGenerateRoute: appRouter.onGenerateRoute,
        home: const HomePage(),
      ),
    );
  }
}
