import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors_mangment.dart';
import '../../core/constant.dart';
import '../../core/styles.dart';
import 'logic/artical_cubit.dart';
import 'model/NewsModel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: BlocBuilder<ArticalCubit, ArticalState>(
        builder: (context, state) {
          if (state is ArticalLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticalScuess) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return NewsCard(
                  article: article,
                );
              },
            );
          } else if (state is ArticalFaliuere) {
            return Center(
              child: Text(state.errmsg,
                  style: TextStyles.font13GrayRegular
                      .copyWith(color: ColorsManager.red)),
            );
          }
          return const Center(
              child: Text('Select a category to load news'));
        },
      ));
  }
}



class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ConstantString.newsDetailScreen,
          arguments: article,
        );
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
            // Article Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                article.urlToImage ??
                    'https://via.placeholder.com/150', // Fallback for missing image
                height: 180.h, // Responsive height
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180.h,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey[400],
                      size: 50.sp,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    article.title ?? 'No Title Available',
                    style: TextStyles.font24Black700Weight,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  // Description
                  Text(
                    article.description ?? 'No Description Available',
                    style: TextStyles.font13GrayRegular,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  // Metadata Row (Author and Source)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Author
                      Text(
                        'By ${article.author ?? 'Unknown Author'}',
                        style: TextStyles.font13GrayRegular,
                      ),
                      // Source
                    ],
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


