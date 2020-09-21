import 'package:dio/dio.dart';
import '../model/quote.dart';

String baseUrl = "http://www.prakrut.com/flutter/quote";

class QuotePageService {
  Future<Quote> getSingleQuote() async {
    try {
      var dio = Dio();
      Response response = await dio.get(
        '$baseUrl/get_one.php',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return Quote.fromJson(response.data);
    } catch (err) {
      throw err;
    }
  }

  static Future<ListQuote> getAll() async {
    try {
      var dio = Dio();
      Response response = await dio.get(
        '$baseUrl/list_all.php',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return ListQuote.fromJson(response.data);
    } catch (err) {
      throw err;
    }
  }
}

class ListQuote {
  List quotes;
  ListQuote({this.quotes});

  factory ListQuote.fromJson(List json) {
    return json == null
        ? null
        : ListQuote(
            quotes: json,
          );
  }
}
