import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sw_flutter_app/app/shared/helper/weather_location.dart';
import 'package:sw_flutter_app/app/shared/repository/weather_repository.dart';
import 'package:sw_flutter_app/app/shared/util/toast_message.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {}
