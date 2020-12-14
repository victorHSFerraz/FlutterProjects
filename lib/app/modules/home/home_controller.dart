import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String display = "0";

  @action
  void calculo() {
    bool primeiroValor = true;

    List<String> values = display.split("");
    String numeroPrimeiroValor = "";
    String numeroSegundoValor = "";
    String operadorDeCalculo = "";

    values.forEach((element) {
      switch (element) {
        case "+":
        case "−":
        case "×":
        case "÷":
          if (primeiroValor) {
            primeiroValor = false;
            operadorDeCalculo = element;
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
    });

    double numeralPrimeiroValor = 0;
    double numeralSegundoValor = 0;

    try {
      numeralPrimeiroValor = double.parse(numeroPrimeiroValor);
      numeralSegundoValor = double.parse(numeroSegundoValor);

      switch (operadorDeCalculo) {
        case "+":
          display =
              (numeralPrimeiroValor + numeralSegundoValor).toStringAsFixed(2);
          break;
        case "−":
          display =
              (numeralPrimeiroValor - numeralSegundoValor).toStringAsFixed(2);
          break;
        case "×":
          display =
              (numeralPrimeiroValor * numeralSegundoValor).toStringAsFixed(2);
          break;
        case "÷":
          display =
              (numeralPrimeiroValor / numeralSegundoValor).toStringAsFixed(2);
          break;
      }
    } catch (e, s) {
      display = "0";
    }
  }

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
      calculo();
      return;
    }

    display += valor;
  }
}
