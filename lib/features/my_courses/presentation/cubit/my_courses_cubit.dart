import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit() : super(MyCoursesInitial());
}
