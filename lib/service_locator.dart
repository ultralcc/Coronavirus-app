import 'package:coronavirus/scoped_model/home_view_model.dart';
import 'package:coronavirus/service/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = new GetIt.asNewInstance();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<APIService>(() => APIService());
  // Register ScopedModels

  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}
