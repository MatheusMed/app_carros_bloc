import 'dart:convert';

class CarrosModel {
  final int? id;
  final String? nome;
  final String? tipo;
  final String? descrica;
  final String? urlFoto;
  final String? urlVideo;
  final String? latitude;
  final String? longitude;
  CarrosModel({
    this.id,
    this.nome,
    this.tipo,
    this.descrica,
    this.urlFoto,
    this.urlVideo,
    this.latitude,
    this.longitude,
  });

  CarrosModel copyWith({
    int? id,
    String? nome,
    String? tipo,
    String? descrica,
    String? urlFoto,
    String? urlVideo,
    String? latitude,
    String? longitude,
  }) {
    return CarrosModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      tipo: tipo ?? this.tipo,
      descrica: descrica ?? this.descrica,
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
      'descrica': descrica,
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
      descrica: map['descrica'],
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
    return 'CarrosModel(id: $id, nome: $nome, tipo: $tipo, descrica: $descrica, urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarrosModel &&
        other.id == id &&
        other.nome == nome &&
        other.tipo == tipo &&
        other.descrica == descrica &&
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
        descrica.hashCode ^
        urlFoto.hashCode ^
        urlVideo.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
