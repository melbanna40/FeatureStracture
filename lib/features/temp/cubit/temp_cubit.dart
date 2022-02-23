import 'package:bloc/bloc.dart';
import 'package:dev_banna/features/temp/data/models/temp_response_entity.dart';
import 'package:dev_banna/features/temp/repository/temp_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'temp_state.dart';


@Injectable()
class TempCubit extends Cubit<TempState> {
  final TempRepository mRepository;

  TempCubit(this.mRepository) : super(TempInitial());

  Future<void> getTempData() async {
    emit(const TempDataLoading());
    final response = await mRepository.getTempDataApiCall();
    emit(response.fold(TempDataFailed.new, TempDataSuccessful.new));
  }
}
