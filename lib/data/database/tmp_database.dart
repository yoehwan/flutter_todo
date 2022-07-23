import 'dart:async';

class TmpDataBase {
  static final TmpDataBase _instance = TmpDataBase._internal();

  factory TmpDataBase() {
    return _instance;
  }

  TmpDataBase._internal();

  final Map<dynamic, dynamic> _data = {};

  List<dynamic> get dataList => _data.values.toList();
  List<dynamic> get keyList => _data.keys.toList();

  Future update(dynamic key, dynamic data) async {
    _data[key] = data;
    _streamController.add(DataEvent(key, data));
  }

  Future remove(dynamic key) async {
    _data.remove(key);
    _streamController.add(DataEvent(key, null));
  }

  final StreamController<DataEvent> _streamController =
      StreamController.broadcast();
  Stream<DataEvent> stream() {
    return _streamController.stream;
  }
}

class DataEvent {
  final dynamic key;
  final dynamic data;

  DataEvent(this.key, this.data);
}
