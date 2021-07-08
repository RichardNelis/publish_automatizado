import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado/app/model/chamado_model.dart';
import 'package:publish_automatizado/app/model/sistema_model.dart';
import 'package:publish_automatizado/app/modules/home/home_store.dart';
import 'package:publish_automatizado/app/repositories/publish_repository.dart';
import 'package:publish_automatizado/app/repositories/sistema_repository.dart';
import 'package:publish_automatizado/app/store/chamado_model_store.dart';
import 'package:publish_automatizado/app/store/sistema_model_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(
          i.get<ChamadoModelStore>(),
          i.get<SistemaRepository>(),
          i.get<PublishRepository>(),
        )),
    Bind((i) => PublishRepository()),
    Bind((i) => ChamadoModelStore(i.get<ChamadoModel>())),
    Bind((i) => ChamadoModel()),
    Bind((i) => SistemaRepository()),
    Bind((i) => SistemaModelStore(i.get<SistemaModel>())),
    Bind((i) => SistemaModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
