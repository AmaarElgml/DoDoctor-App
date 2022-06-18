import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/main_models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class NotificationsUseCase extends BaseUseCase<void, NotificationObject> {
  Repository repository;

  NotificationsUseCase(this.repository);

  @override
  Future<Either<Failure, NotificationObject>> execute(void input) {
    return repository.getNotifications();
  }
}
