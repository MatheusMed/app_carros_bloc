import 'package:app_carros/model/carros_model.dart';
import 'package:app_carros/pages/carros_detalhes.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarrosListView extends StatelessWidget {
  List<CarrosModel>? carros;
  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: carros!.length,
          itemBuilder: (ctx, i) {
            var c = carros![i];
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
