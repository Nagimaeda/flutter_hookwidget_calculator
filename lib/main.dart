import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'apps/home/home_view.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hook Widget Moment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      initialRoute: "/",
    );
  }
}
