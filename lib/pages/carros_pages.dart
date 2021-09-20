import 'package:app_carros/bloc/carro_bloc.dart';
import 'package:app_carros/model/carros_model.dart';
import 'package:app_carros/pages/carros_list_view.dart';
import 'package:app_carros/utils/text_error.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage({required this.tipo});

  @override
  State<CarrosPage> createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  List<CarrosModel>? carros;

  final _bloc = CarroBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.loadCarros(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snap) {
        if (!snap.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snap.hasError) {
          return TextError(
            msg: "Nao foi Possivel Carregar a lista",
          );
        }
        return CarrosListView(carros!);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
