import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/main_models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AppointmentsUseCase extends BaseUseCase<void, AppointmentObject> {
  Repository repository;

  AppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, AppointmentObject>> execute(void input) {
    return repository.getAppointments();
  }
}
