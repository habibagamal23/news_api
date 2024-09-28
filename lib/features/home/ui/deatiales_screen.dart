import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/NewsModel.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? "News Detail"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  article.urlToImage ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.broken_image,
                        size: 50.sp,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 16.0.h),
            Text(
              article.title ?? "No Title",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
            ),
            SizedBox(height: 8.0.h),
            Text(article.description ?? "No Description",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16.0.h),
            Text(article.content ?? "No Content",
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 16.0.h),
          ],
        ),
      ),
    );
  }
}
