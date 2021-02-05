import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sw_flutter_app/app/shared/helper/finance_helper.dart';
import 'package:sw_flutter_app/app/shared/repository/finance_repository.dart';
import 'package:sw_flutter_app/app/shared/util/toast_message.dart';
part 'finance_controller.g.dart';

@Injectable()
class FinanceController = _FinanceControllerBase with _$FinanceController;

abstract class _FinanceControllerBase with Store {
  final FinanceRepository repository;
  _FinanceControllerBase({this.repository});

  @observable
  bool loading = false;

  @observable
  FinanceHelper helper;

  @action
  Future<void> get() async {
    loading = true;

    var generic = await repository.get();

    if (generic.sucesso) {
      helper = generic.data as FinanceHelper;
    } else {
      ToastMessage.notificationError("Oops!", generic.mensagem);
    }

    loading = false;
  }
}
