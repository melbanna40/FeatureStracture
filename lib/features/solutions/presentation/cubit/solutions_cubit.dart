import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'solutions_state.dart';

class SolutionsCubit extends Cubit<SolutionsState> {
  SolutionsCubit() : super(SolutionsInitial());
}
