import 'package:flutter/material.dart';
import 'package:flutter_mvvm_news_app/constants/constant.dart';
import 'package:flutter_mvvm_news_app/view_models/list_view_model.dart';
import 'package:flutter_mvvm_news_app/widgets/news_grid.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('News App'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (country) {
              listViewModel.fetchNewsByCountry(Constants.countries[country]!);
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 15, top: 15),
              child: Text(
                'Headlines',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: NewsGrid(articles: listViewModel.articles,)
            ),
          ],
        ),
      ),
    );
  }
}
