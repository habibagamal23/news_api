import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwesapi_app/core/styles.dart';

import 'model/NewsModel.dart';

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
        padding: EdgeInsets.all(16.0.w), // Use responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            if (article.urlToImage != null)
              AspectRatio(
                aspectRatio: 16 / 9, // Ensure the image retains a proper aspect ratio
                child: Image.network(
                  article.urlToImage??"",
                  fit: BoxFit.cover, // Ensure the image covers the available space
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
            SizedBox(height: 16.0.h),

            // Article Title
            Text(
              article.title ?? "No Title",
              style:Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp, // Dynamic text color from the theme
              ),
            ),
            SizedBox(height: 8.0.h),

            // Article Description
            Text(
              article.description ?? "No Description",
              style: TextStyles.font13GrayRegular
            ),
            SizedBox(height: 16.0.h),

            // Article Content
            Text(
              article.content ?? "No Content",
              style: TextStyles.font13GrayRegular.copyWith(fontSize: 16)
            ),
            SizedBox(height: 16.0.h),

            // Add other details or metadata here if needed
          ],
        ),
      ),
    );
  }
}
