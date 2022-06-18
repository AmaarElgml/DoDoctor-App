import '../network/app_api.dart';
import '../network/requests.dart';
import '../response/auth_response/auth_response.dart';
import '../response/main_response/main_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgotPasswordResponse> forgotPassword(String email);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  Future<BookingResponse> setAppointment(AppointmentRequest appointmentRequest);

  Future<HomeResponse> getHomeData();

  Future<ArticlesResponse> getArticles();

  Future<NotificationResponse> getNotifications();

  Future<AppointmentsResponse> getAppointments();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password);
  }

  @override
  Future<BookingResponse> setAppointment(
      AppointmentRequest appointmentRequest) async {
    return await _appServiceClient.postAppointment(
        appointmentRequest.id,
        appointmentRequest.date,
        appointmentRequest.bookingStart,
        appointmentRequest.bookingEnd,
        appointmentRequest.appointmentStatus);
  }

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appServiceClient.getHomeData();
  }

  @override
  Future<ArticlesResponse> getArticles() async {
    return await _appServiceClient.getArticles();
  }

  @override
  Future<NotificationResponse> getNotifications() async {
    return await _appServiceClient.getNotifications();
  }

  @override
  Future<AppointmentsResponse> getAppointments() async {
    return await _appServiceClient.getAppointments();
  }
}
