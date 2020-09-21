class Quote {
  String quote;
  String color;
  String author;
  String category;
  Quote({
    this.quote,
    this.color,
    this.author,
    this.category,
  });

  factory Quote.fromJson(List<dynamic> json) {
    return json == null
        ? null
        : Quote(
            quote: get(json[0], 'quote'),
            color: get(json[0], 'color'),
            author: get(json[0], 'author'),
            category: get(json[0], 'category'),
          );
  }
}

get(json, String key) {
  return json == null ? null : json.containsKey(key) ? json[key] : null;
}
