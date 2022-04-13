import 'package:bloc/bloc.dart';
import 'package:byaan/features/auth/login/data/model/user_model/user_model.dart';
import 'package:injectable/injectable.dart';

 import '../data/remote_source/login_request.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRequest loginRequest;
  bool isLoading = false;

  LoginCubit(this.loginRequest) : super(LoginInitial());

  Future<void> getUserData(String phone, String password) async {
    emit(const LoginLoading());
    final response = await loginRequest.getUserData(phone, password);
    emit(response.fold(LoginFailed.new, LoginSuccessful.new));
  }
}
