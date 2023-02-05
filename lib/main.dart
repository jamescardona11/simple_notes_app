import 'package:flutter/material.dart';
import 'package:simple_notes_app/config/app_routes.dart';
import 'package:simple_notes_app/repository/local_task_repository.dart';
import 'package:simple_notes_app/ui/screens/home/home_page.dart';

import 'blocs/bloc_exports.dart';

void main() {
  final appRouter = AppRouter();
  final localTaskRepository = LocalTaskRepository();

  runApp(MyApp(
    appRouter: appRouter,
    localTaskRepository: localTaskRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
    required this.localTaskRepository,
  }) : super(key: key);

  final AppRouter appRouter;
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
