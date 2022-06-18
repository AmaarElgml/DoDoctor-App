import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../model/auth_models.dart';
import '../model/main_models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, String>> forgotPassword(String email);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, String>> setAppointment(AppointmentRequest appointmentRequest);

  Future<Either<Failure, HomeObject>> getHomeData();

  Future<Either<Failure, ArticleObject>> getArticles();

  Future<Either<Failure, NotificationObject>> getNotifications();

  Future<Either<Failure, AppointmentObject>> getAppointments();
}
