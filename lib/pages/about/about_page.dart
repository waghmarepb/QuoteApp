import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return quoteName(context: context, quote: 'Pradip Waghmare');
  }
}

Widget quoteName({context, quote: ''}) {
  final size = MediaQuery.of(context).size;
  print('size $quote');
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 40.0,
    ),
    color: Colors.deepPurple,
    height: size.height,
    width: size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Text(quote,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              )),
        ),
      ],
    ),
  );
}
