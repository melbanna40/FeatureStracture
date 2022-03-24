import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'courses_list_state.dart';

class CoursesListCubit extends Cubit<CoursesListState> {
  CoursesListCubit() : super(CoursesListInitial());
}
