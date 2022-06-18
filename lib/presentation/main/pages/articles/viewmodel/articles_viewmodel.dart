import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/rxdart.dart';
import '../../../../../domain/model/main_models.dart';
import '../../../../../domain/usecase/articles_usecase.dart';
import '../../../../base/base_viewmodel.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

class ArticlesViewModel extends BaseViewModel
    with ArticlesViewModelInput, ArticlesViewModelOutput {
  final _dataStreamController = BehaviorSubject<ArticleObject>();

  final ArticlesUseCase _articlesUseCase;

  ArticlesViewModel(this._articlesUseCase);

  @override
  void start() {
    _getArticlesData();
  }

  _getArticlesData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _articlesUseCase.execute(Void)).fold(
        (failure) => {
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (data) {
      inputState.add(ContentState());
      inputArticlesData.add(data);
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputArticlesData => _dataStreamController.sink;

  @override
  Stream<ArticleObject> get outputArticlesData => _dataStreamController.stream;
}

abstract class ArticlesViewModelInput {
  Sink get inputArticlesData;
}

abstract class ArticlesViewModelOutput {
  Stream<ArticleObject> get outputArticlesData;
}
