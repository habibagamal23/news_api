import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/routes.dart';
import '../model/NewsModel.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //navigate task
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesString.newsDetailScreen,
            arguments: article);
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 6,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  article.urlToImage ?? 'https://via.placeholder.com/150',
                  height: 180.h, // Responsive height
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200], // Fallback color if image fails
                      child: Icon(
                        Icons.broken_image,
                        size: 50.sp, // Responsive icon size
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title ?? 'No Title Available',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20, overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 8.h),
                  Text(
                    article.description ?? 'No Description Available',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'By ${article.author ?? 'Unknown Author'}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
