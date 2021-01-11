class ResultadoDTO {
  double resultado;

  ResultadoDTO({this.resultado});

  ResultadoDTO.fromJson(Map<String, dynamic> json) {
    if (json['resultado'] != null) {
      try {
        resultado = (json['resultado'] as int).roundToDouble();
      } catch (e, s) {
        resultado = json['resultado'];
      }
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultado'] = this.resultado;
    return data;
  }
}
