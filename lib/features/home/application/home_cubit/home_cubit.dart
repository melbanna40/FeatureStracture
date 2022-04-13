import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/home_model/home_model.dart';
import '../../data/remote_source/home_request.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRequest storeRequest;
  bool isLoading = false;

  HomeCubit(this.storeRequest) : super(const HomeInitial());

  Future<void> getHomeData(int take) async {
    emit(const HomeLoading());
    final response = await storeRequest.getStoreList(take);
    emit(response.fold(HomeFailure.new, HomeLoaded.new));
  }
}
