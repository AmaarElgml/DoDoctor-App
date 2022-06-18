import 'package:doctor_app/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../../domain/model/main_models.dart';
import '../../../../../resources/values_manager.dart';

class CustomArticle extends StatelessWidget {
  const CustomArticle(this.article, {Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s4,
      shape: defaultCardShape,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                topRight: Radius.circular(AppSize.s12),
              ),
              child: Image.network(article.image,
                  fit: BoxFit.fill,height: AppSize.s120),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                article.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
