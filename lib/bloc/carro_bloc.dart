import 'package:app_carros/bloc/simple_bloc.dart';
import 'package:app_carros/model/carros_model.dart';
import 'package:app_carros/services/carro_api.dart';

class CarroBloc extends SimpleBloc<List<CarrosModel?>?> {
  loadCarros(String tipo) async {
    try {
      List<CarrosModel?> carros = await CarroApi.getCarros(tipo);
      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}
