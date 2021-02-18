import 'splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SplashController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<SplashModule>.of();
}
