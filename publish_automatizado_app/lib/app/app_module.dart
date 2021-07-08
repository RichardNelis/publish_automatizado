import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado_app/app/modules/cadastro/sistema/sistema_module.dart';
import 'package:publish_automatizado_app/app/modules/cadastro/sistema_cn/sistema_cn_module.dart';
import 'package:publish_automatizado_app/app/utils/constants.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(kPSistema, module: SistemaModule()),
    ModuleRoute(kPSistemaCN, module: SistemaCNModule()),
  ];
}
