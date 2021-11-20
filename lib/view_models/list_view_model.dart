// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_news_app/models/model_news_article.dart';
import 'package:flutter_mvvm_news_app/services/web_service.dart';
import 'package:flutter_mvvm_news_app/view_models/view_model.dart';

enum LoadingStatus { Completed, Searching, Empty }

class ListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  List<ViewModel> articles = <ViewModel>[];

  void fetchTopNewsHeadlines() async {
    List<ModelNewsArticle> _newsArticle = await WebService().getTopHeadlines();

    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    articles =
        _newsArticle.map((article) => ViewModel(article: article)).toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  void fetchNewsByCountry(String country) async {
    List<ModelNewsArticle> _newsArticle =
        await WebService().getNewsByCountry(country);

    loadingStatus = LoadingStatus.Searching;
    notifyListeners();

    articles =
        _newsArticle.map((article) => ViewModel(article: article)).toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }
}
