import 'package:flutter/material.dart';
import 'package:flutter_mvvm_news_app/screens/detail_screen.dart';
import 'package:flutter_mvvm_news_app/view_models/view_model.dart';

import 'circle_image.dart';

// ignore: must_be_immutable
class NewsGrid extends StatelessWidget {
  List<ViewModel> articles;

  NewsGrid({Key? key, required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = articles[index];

        return GestureDetector(
          onTap: () {
            _showNewsDetailPage(context, article);
          },
          child: GridTile(
            child: CircleImage(imageUrl: article.urlToImage),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }

  void _showNewsDetailPage(BuildContext context, ViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailScreen(article: vm);
    }));
  }
}
