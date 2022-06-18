import 'package:flutter/material.dart';

import '../../../../../../domain/model/main_models.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard(this.article, {Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: defaultCardShape,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              topRight: Radius.circular(AppSize.s12),
            ),
            child: Image.network(article.image,
                fit: BoxFit.fill, width: double.infinity, height: AppSize.s140),
          ),
          Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('13 May 2022',
                      style: Theme.of(context).textTheme.caption),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(article.title,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3),
                      ),
                      IconButton(
                          icon: const Icon(Icons.share, size: 18),
                          onPressed: () {}),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
