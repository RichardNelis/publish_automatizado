import 'package:publish_automatizado/app/model/sistema_cn_model.dart';
import 'package:publish_automatizado/app/modules/cadastro/sistema_cn/sistema_cn_page.dart';
import 'package:publish_automatizado/app/modules/cadastro/sistema_cn/sistema_cn_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado/app/repositories/sistema_cn_repository.dart';
import 'package:publish_automatizado/app/store/sistema_cn_model_store.dart';
import 'package:publish_automatizado/app/utils/constants.dart';

class SistemaCNModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SistemaCNStore(i.get<SistemaCNRepository>(), i.get<SistemaCNModelStore>())),
    Bind((i) => SistemaCNRepository()),
    Bind((i) => SistemaCNModelStore(i.get<SistemaCNModel>())),
    Bind((i) => SistemaCNModel()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(kPSistemaCN, child: (_, args) => SistemaCNPage()),
  ];
}
