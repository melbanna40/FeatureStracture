// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/auth/login/application/login_cubit.dart' as _i7;
import '../features/auth/login/data/remote_source/login_request.dart' as _i4;
import '../features/home/application/home_cubit/home_cubit.dart' as _i6;
import '../features/home/data/remote_source/home_request.dart' as _i3;
import '../network/network_request.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HomeRequest>(() => _i3.StoreRequestImp());
  gh.factory<_i4.LoginRequest>(() => _i4.LoginRequestImp());
  gh.factory<_i5.NetworkRequest>(() => _i5.NetworkRequestImp());
  gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit(get<_i3.HomeRequest>()));
  gh.factory<_i7.LoginCubit>(() => _i7.LoginCubit(get<_i4.LoginRequest>()));
  return get;
}
