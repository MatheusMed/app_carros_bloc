import 'package:app_carros/bloc/lorem_bloc.dart';
import 'package:app_carros/model/carros_model.dart';
import 'package:app_carros/services/custom_text.dart';
import 'package:app_carros/services/lorimpsum_api.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarrosDetalhes extends StatefulWidget {
  CarrosModel? carro;

  CarrosDetalhes(this.carro);

  @override
  State<CarrosDetalhes> createState() => _CarrosDetalhesState();
}

class _CarrosDetalhesState extends State<CarrosDetalhes> {
  @override
  void initState() {
    _loremBloc.loadText();
    super.initState();
  }

  @override
  void dispose() {
    _loremBloc.dispose();
    super.dispose();
  }

  final _loremBloc = LoremBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro!.nome!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.place),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          PopupMenuButton(
              onSelected: _onCLickPop,
              itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'Editar',
                      child: Text('Editar'),
                    ),
                    PopupMenuItem(
                      value: 'Deletar',
                      child: Text('Deletar'),
                    ),
                    PopupMenuItem(
                      value: 'Share',
                      child: Text('Share'),
                    ),
                  ]),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Deville_Convertible.png"),
            _bloco1(),
            Divider(
              endIndent: 10,
              indent: 10,
              thickness: 2,
              height: 2,
              color: Colors.white30,
            ),
            SizedBox(
              height: 20,
            ),
            _bloco2(),
          ],
        ),
      ),
    );
  }

  ListTile _bloco1() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            txt: widget.carro!.nome!,
            tamanhoFont: 25,
            bold: true,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, size: 40),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share, size: 40),
              )
            ],
          ),
        ],
      ),
      subtitle: CustomText(
        txt: widget.carro!.nome!,
        tamanhoFont: 17,
      ),
    );
  }

  _onCLickPop(String value) {
    switch (value) {
      case "Editar":
        print('editar !!!!');
        break;
      case "Deletar":
        print('Deletar !!!!');
        break;
      case "Share":
        print('share !!!!');
        break;
      default:
    }
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: widget.carro!.descricao!,
          bold: true,
          tamanhoFont: 25,
        ),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<String?>(
          stream: _loremBloc.stream,
          builder: (cxt, snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomText(
              txt: snap.data!,
            );
          },
        ),
      ],
    );
  }
}
