import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem(this.review, this.rating, {Key? key}) : super(key: key);

  final String review;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: [
            BoxShadow(
                color: ColorManager.primary.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: RatingBar.builder(
                  itemSize: 25,
                  initialRating: 4.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: ColorManager.primary,
                  ),
                  unratedColor: ColorManager.lightGrey,
                  onRatingUpdate: (rating) {},
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$rating',
                      style: TextStyle(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '/ 5.0',
                      style: TextStyle(color: ColorManager.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.chat_bubble, color: ColorManager.grey),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Text(review,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
