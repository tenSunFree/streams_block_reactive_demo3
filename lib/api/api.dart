import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/home_model.dart';

Api api = Api();

class Api {
  static const String baseUrl = 'jsonplaceholder.typicode.com';

  final _httpClient = HttpClient();

  Future<List<HomeModel>> getPhotos() async {
    var uri = Uri.https(
      baseUrl,
      '/photos',
    );
    var response = await _getRequest(uri);
    final List<dynamic> decodedJson = json.decode(response);
    final List<HomeModel> list = HomeModel.parseMyModels(decodedJson);
    return list;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return response.transform(utf8.decoder).join();
  }
}
