import 'package:dartz/dartz.dart';
import 'package:doctor_app/data/network/requests.dart';
import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class BookingUseCase extends BaseUseCase<BookingUseCaseInput, String> {
  Repository repository;

  BookingUseCase(this.repository);

  @override
  Future<Either<Failure, String>> execute(BookingUseCaseInput input) {
    return repository.setAppointment(AppointmentRequest(
        input.id, input.date, input.start, input.end, input.status));
  }
}

class BookingUseCaseInput {
  int id;
  String date;
  String start;
  String end;
  String status;

  BookingUseCaseInput(this.id, this.date, this.start, this.end, this.status);
}
