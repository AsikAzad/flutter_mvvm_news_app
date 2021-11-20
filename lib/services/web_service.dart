// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_news_app/constants/constant.dart';
import 'package:flutter_mvvm_news_app/models/model_news_article.dart';

class WebService {
  var dio = Dio();

  Future<List<ModelNewsArticle>> getTopHeadlines() async {
    final response = await dio.get(Constants.topHeadlines);

    if (response.statusCode == 200) {
      final result = response.data;

      Iterable list = result['articles'];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("response failed");
    }
  }

  Future<List<ModelNewsArticle>> getNewsByCountry(String country) async {
    final response = await dio.get(Constants.headlinesFor(country));

    if (response.statusCode == 200) {
      final result = response.data;

      Iterable list = result['articles'];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("response failed");
    }
  }
}
