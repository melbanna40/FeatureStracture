import 'package:bloc/bloc.dart';
import 'package:byaan/features/temp/data/models/temp_response_entity.dart';
import 'package:byaan/features/temp/domain/repository/temp_repository.dart';
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
