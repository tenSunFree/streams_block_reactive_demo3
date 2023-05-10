import 'dart:async';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import '../api/api.dart';
import '../models/home_model.dart';
import 'bloc_provider.dart';

class HomeBloc implements BlocBase {
  final PublishSubject<List<HomeModel>> _modelListController =
      PublishSubject<List<HomeModel>>();

  Sink<List<HomeModel>> get _inModelList => _modelListController.sink;

  Stream<List<HomeModel>> get outModelList => _modelListController.stream;

  HomeBloc() {
    getPhotos();
  }

  getPhotos() async {
    List<HomeModel> photos = await api.getPhotos();
    _inModelList.add(UnmodifiableListView<HomeModel>(photos));
  }

  void dispose() {
    _modelListController.close();
  }
}
