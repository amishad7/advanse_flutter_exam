import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:practical_exam/app/utils/models/newapimodel/newsapimodel.dart';

class NewsHelper {
  NewsHelper._();

  static NewsHelper newsHelper = NewsHelper._();

  ApiData() async {
    String Apikey = "d8d131503887483184f41033278f84b6";
    String hostname = "https://newsapi.org";
    String link = "$hostname/v2/top-headlines/sources?apiKey=$Apikey";

    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      log("============================");
      log("DecodeData: $decodeData");
      log("============================");

      List NewsData = decodeData['sources'];

      log("============================");
      log("News: $NewsData");
      log("============================");

      List<NewsModel> NewsDataList = NewsData.map(
        (e) => NewsModel.formApi(data: e),
      ).toList();

      log("============================");
      log("DecodeData: ${NewsDataList}");
      log("============================");

      return NewsDataList;
    } else {
      return null;
    }
  }

  TopHeadLines() async {
    String link =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=d8d131503887483184f41033278f84b6";

    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      log("============================");
      log("DecodeData: $decodeData");
      log("============================");

      List NewsData = decodeData['articles'];

      log("============================");
      log("News: $NewsData");
      log("============================");

      List<NewsModel> NewsDataList = NewsData.map(
        (e) => NewsModel.formApi(data: e),
      ).toList();

      log("============================");
      log("DecodeData: ${NewsDataList[2].country}");
      log("============================");

      return NewsDataList;
    } else {
      return null;
    }
  }
}
