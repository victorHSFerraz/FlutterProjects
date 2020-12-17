import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'api_service.g.dart';

@Injectable()
class ApiService extends Disposable {
  final DioForNative client;

  ApiService(this.client);

  @override
  void dispose() {}
}
