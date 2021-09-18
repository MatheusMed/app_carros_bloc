import 'package:app_carros/model/carros_model.dart';
import 'package:flutter/material.dart';

class CarrosDetalhes extends StatelessWidget {
  CarrosModel? carro;

  CarrosDetalhes(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro!.nome!),
      ),
      body: Image.network(
          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Deville_Convertible.png"),
    );
  }
}
