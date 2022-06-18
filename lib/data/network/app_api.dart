import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../app/constants.dart';
import '../response/auth_response/auth_response.dart';
import '../response/main_response/main_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/customer/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

  @POST("/customer/register")
  Future<AuthenticationResponse> register(
      @Field("username") String userName,
      @Field("country_code") String countryMobileCode,
      @Field("phone") String mobileNumber,
      @Field("email") String email,
      @Field("password") String password);

  @POST("/bookings")
  Future<BookingResponse> postAppointment(
    @Field("id") int id,
    @Field("date") String appointmentDate,
    @Field("start") String bookingStart,
    @Field("end") String bookingEnd,
    @Field("status") String appointmentStatus,
  );

  @GET("/home")
  Future<HomeResponse> getHomeData();

  @GET("/articles")
  Future<ArticlesResponse> getArticles();

  @GET("/customer/notifications")
  Future<NotificationResponse> getNotifications();

  @GET("/customer/appointments")
  Future<AppointmentsResponse> getAppointments();
}
