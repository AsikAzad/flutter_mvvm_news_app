import 'package:flutter/material.dart';
import 'package:flutter_mvvm_news_app/view_models/view_model.dart';
import 'package:flutter_mvvm_news_app/widgets/circle_image.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  ViewModel article;
  DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            child: CircleImage(
              imageUrl: article.urlToImage,
            ),
          ),
          Text(
            article.publishedAt,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 9,
          ),
          Center(
            child: Text(
              article.title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            article.description,
            style: const TextStyle(fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
