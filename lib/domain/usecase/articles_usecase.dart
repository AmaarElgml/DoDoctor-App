import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/main_models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ArticlesUseCase extends BaseUseCase<void, ArticleObject> {
  Repository repository;

  ArticlesUseCase(this.repository);

  @override
  Future<Either<Failure, ArticleObject>> execute(void input) {
    return repository.getArticles();
  }
}
