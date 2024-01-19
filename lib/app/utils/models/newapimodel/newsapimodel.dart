class NewsModel {
  var id;
  var name;
  var description;
  var url;
  var category;
  var language;
  var country;

  NewsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory NewsModel.formApi({required Map data}) {
    return NewsModel(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      url: data['url'],
      category: data['category'],
      language: data['language'],
      country: data['country'],
    );
  }
}
