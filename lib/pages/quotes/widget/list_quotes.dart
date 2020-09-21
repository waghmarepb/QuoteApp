import 'package:flutter/material.dart';
import '../service/quote_service.dart';

class ListQuotes extends StatefulWidget {
  @override
  _ListQuotesState createState() => _ListQuotesState();
}

class _ListQuotesState extends State<ListQuotes> {
  Widget _authorName({name: ''}) {
    final author = name;
    return Text(author);
  }

  Widget quoteName({quote: ''}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        color: Theme.of(context).primaryColor,
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Text(quote,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget quoteDetails({quote: ''}) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            quote,
            softWrap: true,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _fullScreenView({quoteText: '', authorName: ''}) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // _authorName(name: '$authorName'),
          quoteDetails(quote: '$quoteText'),
          _authorName(name: '$authorName'),
        ],
      ),
    );
  }

  void _viewFull({author: '', quote: ''}) {
    Navigator.of(context).push(
      new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return _fullScreenView(authorName: author, quoteText: quote);
        },
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: QuotePageService.getAll(),
      builder: (context, snapshot) {
        final quoteList = snapshot.data;

        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
            ),
            itemCount: quoteList.quotes.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      quoteName(quote: '${quoteList.quotes[index]["quote"]}'),
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                      ),
                      _authorName(name: '${quoteList.quotes[index]["author"]}'),
                    ],
                  ),
                ),
                onTap: () {
                  _viewFull(
                      author: '${quoteList.quotes[index]["author"]}',
                      quote: '${quoteList.quotes[index]["quote"]}');
                },
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
