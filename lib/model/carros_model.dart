import 'dart:convert';

class CarrosModel {
  final int? id;
  final String? nome;
  final String? tipo;
  final String? descricao;
  final String? urlFoto;
  final String? urlVideo;
  final String? latitude;
  final String? longitude;
  CarrosModel({
    this.id,
    this.nome,
    this.tipo,
    this.descricao,
    this.urlFoto,
    this.urlVideo,
    this.latitude,
    this.longitude,
  });

  CarrosModel copyWith({
    int? id,
    String? nome,
    String? tipo,
    String? descricao,
    String? urlFoto,
    String? urlVideo,
    String? latitude,
    String? longitude,
  }) {
    return CarrosModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      tipo: tipo ?? this.tipo,
      descricao: descricao ?? this.descricao,
      urlFoto: urlFoto ?? this.urlFoto,
      urlVideo: urlVideo ?? this.urlVideo,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'descricao': descricao,
      'urlFoto': urlFoto,
      'urlVideo': urlVideo,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory CarrosModel.fromMap(Map<String, dynamic> map) {
    return CarrosModel(
      id: map['id'],
      nome: map['nome'],
      tipo: map['tipo'],
      descricao: map['descricao'],
      urlFoto: map['urlFoto'],
      urlVideo: map['urlVideo'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarrosModel.fromJson(String source) =>
      CarrosModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarrosModel(id: $id, nome: $nome, tipo: $tipo, descricao: $descricao, urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarrosModel &&
        other.id == id &&
        other.nome == nome &&
        other.tipo == tipo &&
        other.descricao == descricao &&
        other.urlFoto == urlFoto &&
        other.urlVideo == urlVideo &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        tipo.hashCode ^
        descricao.hashCode ^
        urlFoto.hashCode ^
        urlVideo.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
