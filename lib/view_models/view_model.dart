import 'package:flutter_mvvm_news_app/models/model_news_article.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class ViewModel {
  late final ModelNewsArticle _modelNewsArticle;
  ViewModel({required ModelNewsArticle article}) : _modelNewsArticle = article;

  String get title {
    return _modelNewsArticle.title;
  }

  String get publishedAt {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ')
        .parse(_modelNewsArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime);
  }

  String get description {
    return _modelNewsArticle.description;
  }

  String get url {
    return _modelNewsArticle.url;
  }

  String get urlToImage {
    return _modelNewsArticle.urlToImage;
  }
}
