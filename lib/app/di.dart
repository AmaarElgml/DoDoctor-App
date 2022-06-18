import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/appointments_usecase.dart';
import '../domain/usecase/booking_usecase.dart';
import '../domain/usecase/forgot_password_usecase.dart';
import '../domain/usecase/home_usecase.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/notifications_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../domain/usecase/articles_usecase.dart';
import '../presentation/booking/viewmodel/booking_viewmodel.dart';
import '../presentation/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import '../presentation/login/viewmodel/login_viewmodel.dart';
import '../presentation/main/pages/appointments/viewmodel/appointments_viewmodel.dart';
import '../presentation/main/pages/articles/viewmodel/articles_viewmodel.dart';
import '../presentation/main/pages/home/viewmodel/home_viewmodel.dart';
import '../presentation/main/pages/notifications/viewmodel/notifications_viewmodel.dart';
import '../presentation/register/viewmodel/register_viewmodel.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initMainModule() {
  initHomeModule();
  initArticlesModule();
  initNotificationsModule();
  initAppointmentsModule();
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initArticlesModule() {
  if (!GetIt.I.isRegistered<ArticlesUseCase>()) {
    instance
        .registerFactory<ArticlesUseCase>(() => ArticlesUseCase(instance()));
    instance.registerFactory<ArticlesViewModel>(
        () => ArticlesViewModel(instance()));
  }
}

initNotificationsModule() {
  if (!GetIt.I.isRegistered<NotificationsUseCase>()) {
    instance.registerFactory<NotificationsUseCase>(
        () => NotificationsUseCase(instance()));
    instance.registerFactory<NotificationsViewModel>(
        () => NotificationsViewModel(instance()));
  }
}

initAppointmentsModule() {
  if (!GetIt.I.isRegistered<AppointmentsUseCase>()) {
    instance.registerFactory<AppointmentsUseCase>(
        () => AppointmentsUseCase(instance()));
    instance.registerFactory<AppointmentsViewModel>(
        () => AppointmentsViewModel(instance()));
  }
}

initBookingModule() {
  if (!GetIt.I.isRegistered<BookingUseCase>()) {
    instance.registerFactory<BookingUseCase>(() => BookingUseCase(instance()));
    instance
        .registerFactory<BookingViewModel>(() => BookingViewModel(instance()));
  }
}
