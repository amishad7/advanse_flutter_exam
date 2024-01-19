class ArticalesModel {
  var author;
  var title;
  var description;
  var url;
  var urlToImage;

  ArticalesModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  factory ArticalesModel.formApi({required Map data}) {
    return ArticalesModel(
      author: data['author'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      urlToImage: data['urlToImage'],
    );
  }
}
