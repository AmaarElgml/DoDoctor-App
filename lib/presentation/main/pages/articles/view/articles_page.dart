import 'package:doctor_app/presentation/main/pages/articles/view/widgets/article_card.dart';
import 'package:flutter/material.dart';
import '../../../../../app/di.dart';
import '../../../../../domain/model/main_models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/values_manager.dart';
import '../viewmodel/articles_viewmodel.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final ArticlesViewModel _viewModel = instance<ArticlesViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.start();
              }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return StreamBuilder<ArticleObject>(
        stream: _viewModel.outputArticlesData,
        builder: (context, snapshot) {
          return _getArticlesWidget(snapshot.data?.articleData.articles);
        });
  }

  Widget _getArticlesWidget(List<Article>? articles) {
    if (articles != null) {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
        children: articles
            .map((article) => ArticleCard(article))
            .toList(),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
