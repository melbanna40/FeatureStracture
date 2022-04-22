// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/temp/data/services/network_service.dart' as _i4;
import '../features/temp/domain/repository/temp_repository.dart' as _i5;
import '../features/temp/presentation/cubit/temp_cubit.dart' as _i6;
import '../network/base_presenter.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BaseApiHelper>(() => _i3.NetworkRequestImp());
  gh.factory<_i4.TempNetworkService>(() => _i4.TempNetworkService());
  gh.factory<_i5.TempRepository>(
      () => _i5.TempRepository(get<_i4.TempNetworkService>()));
  gh.factory<_i6.TempCubit>(() => _i6.TempCubit(get<_i5.TempRepository>()));
  return get;
}
