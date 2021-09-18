import 'dart:async';

import 'package:app_carros/model/carros_model.dart';
import 'package:app_carros/pages/carros_detalhes.dart';
import 'package:app_carros/services/carro_api.dart';
import 'package:app_carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView({required this.tipo});

  @override
  State<CarrosListView> createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  List<CarrosModel?> carros = [];

  final _sController = StreamController<List<CarrosModel?>>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadCarros();
  }

  _loadCarros() async {
    List<CarrosModel?> carros = await CarroApi.getCarros(widget.tipo);
    _sController.add(carros);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _sController.stream,
      builder: (context, snap) {
        if (snap.hasError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Tem algo errado'),
              );
            },
          );
        } else if (snap.hasData) {
          return _listView(snap);
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
  }

  _listView(snap) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: snap.data!.length,
          itemBuilder: (ctx, i) {
            CarrosModel c = snap.data[i];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Deville_Convertible.png",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome ?? "Cadillac Deville",
                      style: TextStyle(fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Compartilhar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarrosDetalhes(c)));
                          },
                          child: Text(
                            'Detalhes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
    );
  }
}
