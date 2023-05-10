class HomeModel {
  static List<HomeModel> parseMyModels(List<dynamic> parsed) {
    return parsed.map<HomeModel>((json) => HomeModel.fromJson(json)).toList();
  }

  HomeModel({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    _albumId = albumId;
    _id = id;
    _title = title;
    _url = url;
    _thumbnailUrl = thumbnailUrl;
  }

  HomeModel.fromJson(dynamic json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }

  int? _albumId;
  int? _id;
  String? _title;
  String? _url;
  String? _thumbnailUrl;

  int? get albumId => _albumId;

  int? get id => _id;

  String? get title => _title;

  String? get url => _url;

  String? get thumbnailUrl => _thumbnailUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = _albumId;
    map['id'] = _id;
    map['title'] = _title;
    map['url'] = _url;
    map['thumbnailUrl'] = _thumbnailUrl;
    return map;
  }
}
