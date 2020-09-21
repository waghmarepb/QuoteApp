import 'package:flutter/material.dart';
import '../service/quote_service.dart';

class OneQuote extends StatefulWidget {
  @override
  _OneQuoteState createState() => _OneQuoteState();
}

class _OneQuoteState extends State<OneQuote> {
  String quote;
  String color;
  String author;
  String category;
  void getQuote() async {
    QuotePageService _singleQuote = new QuotePageService();
    var quoteData = await _singleQuote.getSingleQuote();
    print('quoteData $quoteData');
    // if (!mounted)
    setState(() {
      quote = quoteData.quote;
      color = quoteData.color;
      author = quoteData.author;
      category = quoteData.category;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getQuote();
    });
  }

  Widget quoteName({quote: ''}) {
    final size = MediaQuery.of(context).size;
    print('size $quote');
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        // color: Colors.deepPurple,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffcc2b5e), Color(0xff753a88)],
          ),
        ),
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
      ),
    );
  }

  Widget _currentView({quoteText: 'Quote', author: 'ShabdVeda'}) {
    quoteText = quoteText == null ? 'Dummy' : quoteText;
    var authorName = author == null ? 'Dummy' : author;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        quoteName(quote: quoteText),
        Padding(
          padding: EdgeInsets.only(top: 40.0),
        ),
        Text(authorName),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _currentView(quoteText: quote, author: author),
    );
  }
}
