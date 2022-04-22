import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_init.config.dart';


final getIt = GetIt.instance;
@injectableInit
GetIt configureDependencies() => $initGetIt(getIt);

