import 'package:publish_automatizado/app/model/sistema_model.dart';
import 'package:publish_automatizado/app/modules/cadastro/sistema/sistema_Page.dart';
import 'package:publish_automatizado/app/modules/cadastro/sistema/sistema_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado/app/repositories/sistema_cn_repository.dart';
import 'package:publish_automatizado/app/repositories/sistema_repository.dart';
import 'package:publish_automatizado/app/store/sistema_model_store.dart';
import 'package:publish_automatizado/app/utils/constants.dart';

class SistemaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SistemaStore(
          i.get<SistemaModelStore>(),
          i.get<SistemaRepository>(),
          i.get<SistemaCNRepository>(),
        )),
    Bind((i) => SistemaRepository()),
    Bind((i) => SistemaCNRepository()),
    Bind((i) => SistemaModelStore(i.get<SistemaModel>())),
    Bind((i) => SistemaModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(kPSistema, child: (_, args) => SistemaPage()),
  ];
}
