import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());
}
