import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/cubit/cubit_exports.dart';

@module
abstract class CubitModule {
  TasksCubit get tasksCubit;
}
