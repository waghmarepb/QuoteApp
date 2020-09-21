import 'package:flutter/material.dart';

import 'pages/quotes/quotes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'शब्दवेडा',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.white,
        errorColor: Colors.red,
        primaryColor: Colors.deepPurple,
        bottomAppBarColor: Colors.black,
        backgroundColor: Colors.black,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => QuotesPage(),
      },
    );
  }
}
