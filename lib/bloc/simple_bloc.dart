import 'dart:async';

class SimpleBloc<T> {
  final _sController = StreamController<T?>();

  Stream<T?> get stream => _sController.stream;

  void add(T obj) {
    _sController.add(obj);
  }

  void addError(Object error) {
    if (!_sController.isClosed) {
      _sController.addError(error);
    }
  }

  void dispose() {
    _sController.close();
  }
}
