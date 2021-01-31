// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  RequestModel({
    this.usuarioCalculadoraId,
    this.usuarioUsuarioId,
    this.operacaoId,
    this.calculadoraX,
    this.calculadoraY,
    this.calculadoraResultado,
  });

  int usuarioCalculadoraId;
  int usuarioUsuarioId;
  int operacaoId;
  int calculadoraX;
  int calculadoraY;
  int calculadoraResultado;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        usuarioCalculadoraId: json["usuario_calculadora_id"],
        usuarioUsuarioId: json["usuario_usuario_id"],
        operacaoId: json["operacao_id"],
        calculadoraX: json["calculadora_x"],
        calculadoraY: json["calculadora_y"],
        calculadoraResultado: json["calculadora_resultado"],
      );

  Map<String, dynamic> toJson() => {
        "usuario_calculadora_id": usuarioCalculadoraId,
        "usuario_usuario_id": usuarioUsuarioId,
        "operacao_id": operacaoId,
        "calculadora_x": calculadoraX,
        "calculadora_y": calculadoraY,
        "calculadora_resultado": calculadoraResultado,
      };
}
