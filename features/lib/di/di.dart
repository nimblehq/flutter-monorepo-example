import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

late GetIt featureGetIt;

@InjectableInit(initializerName: r'$initFeaturesModuleGetIt')
void configureFeaturesModuleDependencies(GetIt getIt) async {
  featureGetIt = getIt;
  $initFeaturesModuleGetIt(getIt);
}
