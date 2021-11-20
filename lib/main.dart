import 'package:flutter/material.dart';
import 'package:flutter_mvvm_news_app/screens/main_screen.dart';
import 'package:flutter_mvvm_news_app/view_models/list_view_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => ListViewModel(),
        ),
      ],
      child: const NewsScreen(),),
    );
  }
}
