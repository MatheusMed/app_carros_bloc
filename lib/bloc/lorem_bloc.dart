import 'package:app_carros/bloc/simple_bloc.dart';
import 'package:app_carros/services/lorimpsum_api.dart';

class LoremBloc extends SimpleBloc<String?> {
  static String? loremCache;

  loadText() async {
    try {
      String? lorem = loremCache ?? await LorimpsumApi.getLoripsum();

      loremCache = lorem;

      add(lorem!);
    } catch (e) {
      addError(e);
    }
  }
}
