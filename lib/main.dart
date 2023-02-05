import 'package:flutter/material.dart';
import 'package:simple_notes_app/ui/screens/home/home_page.dart';

import 'config/di/di.dart';
import 'cubit/cubit_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TasksCubit>(),
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
