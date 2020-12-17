import 'package:calculadora_app/app/shared/repository/api_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'android_controller.g.dart';

@Injectable()
class AndroidController = _AndroidControllerBase with _$AndroidController;

abstract class _AndroidControllerBase with Store {
  final ApiRepository _apiRepository;

  _AndroidControllerBase(this._apiRepository);

  double calculoDeValores = 0.0;

  double calculeTheTwoFactorys(List<String> values) {
    int index = 0;
    bool primeiroValor = true;

    String numeroPrimeiroValor = "";
    String numeroSegundoValor = "";
    String operadorDeCalculo = "";

    if (values != null && values.length != 0 && values.first == "") {
      values.removeAt(0);
    }

    values.forEach((element) {
      switch (element) {
        case "+":
        case "−":
        case "×":
        case "÷":
          if (primeiroValor) {
            if (index == 0) {
              numeroPrimeiroValor += "-";
            } else {
              primeiroValor = false;
              operadorDeCalculo = element;
            }
          }
          break;
        default:
          if (primeiroValor) {
            numeroPrimeiroValor += element;
          } else {
            numeroSegundoValor += element;
          }
          break;
      }

      index++;
    });

    double numeralPrimeiroValor = 0;
    double numeralSegundoValor = 0;

    try {
      numeralPrimeiroValor = double.parse(numeroPrimeiroValor);
      numeralSegundoValor = double.parse(numeroSegundoValor);

      switch (operadorDeCalculo) {
        case "+":
          return (numeralPrimeiroValor + numeralSegundoValor);
        case "−":
          return (numeralPrimeiroValor - numeralSegundoValor);
          break;
        case "×":
          return (numeralPrimeiroValor * numeralSegundoValor);
          break;
        case "÷":
          return (numeralPrimeiroValor / numeralSegundoValor);
          break;
      }
    } catch (e, s) {
      return 0;
    }
  }

  Valores generateListCalculos({List<String> values}) {
    int index = 0;

    List<String> numeros = [];
    List<String> operadores = [];
    List<double> auxiliar = [];
    bool operadorNegativo = false;
    bool dotAnterior = false;

    List listDisplay =
        values != null && values.length != 0 ? values : display.split("");

    listDisplay.forEach((element) {
      try {
        if (dotAnterior) {
          double value = double.parse("0." + element);
          auxiliar.add(value);

          if ((listDisplay.length - 1) == index) {
            String numero = "";
            auxiliar.forEach((elementA) {
              String value = elementA.toString();

              numero += value
                  .replaceAll(".0", "")
                  .replaceAll(".00", "")
                  .replaceAll("0.", ".");
            });

            numeros.add(numero.replaceAll(".0", "").replaceAll(".00", ""));
            auxiliar = [];
          }

          dotAnterior = false;
        } else {
          if (element == ".") {
            dotAnterior = true;
          } else {
            double value = double.parse(element);
            auxiliar.add(value);

            if ((listDisplay.length - 1) == index) {
              String numero = "";
              auxiliar.forEach((elementA) {
                String value = elementA.toString();

                numero += value.replaceAll(".0", "").replaceAll(".00", "");
              });

              numeros.add(numero.replaceAll(".0", "").replaceAll(".00", ""));
              auxiliar = [];
            }
          }
        }
      } catch (e, s) {
        if (index == 0) {
          operadorNegativo = true;
        } else {
          operadores.add(element);

          String numero = "";

          auxiliar.forEach((elementA) {
            String value = elementA.toString();

            numero += value
                .replaceAll(".0", "")
                .replaceAll(".00", "")
                .replaceAll("0.", ".");
          });

          if (operadorNegativo) {
            numeros
                .add("-" + numero.replaceAll(".0", "").replaceAll(".00", ""));
            operadorNegativo = false;
          } else {
            numeros.add(numero.replaceAll(".0", "").replaceAll(".00", ""));
          }

          auxiliar = [];
        }
      }

      index++;
    });

    if (numeros.length == 0) {
      display = "0";
      return null;
    } else if (operadores.length > numeros.length) {
      display = "0";
      return null;
    } else if (numeros.length < 2) {
      operadores.add("+");
      numeros.add("0");
    }

    return Valores(numeros, operadores);
  }

  String returnResult(Valores value) {
    int index = 0;

    String primeiroNumber = "";
    String segundoNumber = "";
    String operador = "";

    for (var item in value.numeros) {
      if (index == 0) {
        primeiroNumber = item;
      }

      if (index == 1) {
        operador = value.operadores.first;
        segundoNumber = item;
      }

      index++;
    }

    return calculeTheTwoFactorys([primeiroNumber, operador, segundoNumber])
        .toString()
        .replaceAll(".0", "");
  }

  @action
  void alterConnect(bool value) => hasConnected = value;

  @action
  void calcule({List<String> num, List<String> ope}) {
    List<String> numeros = [];
    List<String> operadores = [];

    String values = "";
    String resultado = "";

    if (num != null && num.length != 0 && ope != null && ope.length != 0) {
      numeros = num;
      operadores = ope;

      int indexF = 0;

      num.forEach((element) {
        values += element;
        try {
          values += ope[indexF];
        } catch (e, s) {}

        indexF++;
      });

      var valor = generateListCalculos(values: values.split(""));

      if (valor == null) {
        return;
      } else {
        resultado = returnResult(valor);
      }
    } else {
      var valor = generateListCalculos();

      numeros = valor.numeros;
      operadores = valor.operadores;

      if (valor == null) {
        return;
      } else {
        resultado = returnResult(valor);
      }
    }

    if (numeros.length == 2) {
      display = resultado;
    } else {
      numeros.removeAt(0);
      numeros.removeAt(0);
      operadores.removeAt(0);

      List<String> numTemp = [];

      for (var i = 0; i < numeros.length; i++) {
        if (i == 0) {
          numTemp.add(resultado);
        }

        numTemp.add(numeros[i]);
      }

      calcule(num: numTemp, ope: operadores);
    }
  }

  @observable
  bool hasConnected = false;

  @observable
  String display = "0";

  @action
  void calculeApi() {}

  @action
  void displayInput(String valor) {
    if (display == "0") {
      display = "";
    }

    if (valor == "DEL") {
      display = "0";
      return;
    }

    if (valor == "=") {
      if (hasConnected) {
        calculeApi();
      } else {
        calcule();
      }

      return;
    }

    display += valor;
  }
}

class Valores {
  List<String> numeros;
  List<String> operadores;

  Valores(this.numeros, this.operadores);
}
