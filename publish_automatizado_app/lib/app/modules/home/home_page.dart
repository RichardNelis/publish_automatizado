import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado_app/app/components/loading_mensagem.dart';
import 'package:publish_automatizado_app/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Publish Automatizado"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add_to_queue),
            tooltip: 'Sistema',
            onPressed: store.cadastroSistema,
          ),
          IconButton(
            icon: Icon(Icons.account_tree_outlined),
            tooltip: 'Sistema CN',
            onPressed: store.cadastroSistemaCN,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.sistemas == null) {
            return Container(
              child: Center(
                child: Text("Carregando..."),
              ),
            );
          }

          if (store.sistemas!.length == 0) {
            return Container(
              child: Center(
                child: Text("Não foi encontrado nenhum sistema."),
              ),
            );
          }

          var lista = store.sistemas!;

          return Stack(
            children: [
              Container(
                child: RefreshIndicator(
                  onRefresh: () => store.fetchSistemas(),
                  child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      var sistema = lista[index];
                      var model = sistema.model;

                      return Observer(
                        builder: (_) {
                          return Dismissible(
                            confirmDismiss: (DismissDirection direction) async {
                              return await showDialog(
                                useRootNavigator: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text("Deseja excluir o sistema?"),
                                    content: const Text(
                                        "Você tem certeza que deseja excluir o sistema?"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          var sucesso = await loadingMessage(
                                              context,
                                              () => store.excluirSistema(
                                                  model.idCodigo!));

                                          if (sucesso) {
                                            Navigator.of(context).pop(true);
                                          } else {
                                            Modular.to.pop();
                                          }
                                        },
                                        child: const Text("Confirmar"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Modular.to.pop(),
                                        child: const Text("Cancelar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            direction: DismissDirection.startToEnd,
                            background: Container(
                              padding: const EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                            key: ValueKey(model.idCodigo),
                            child: CheckboxListTile(
                              title: Text(model.nomeSistema!),
                              value: sistema.isChecked,
                              onChanged: sistema.changeCheckBox,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: store.habilitarBotao
                        ? () async {
                            return await showDialog(
                              useRootNavigator: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Publish"),
                                  content: Container(
                                    height: 180,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Número do Chamado"),
                                          onChanged: store
                                              .modelStore.changeNumeroChamado,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Responsável"),
                                          onChanged: store
                                              .modelStore.changeResponsavel,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Município"),
                                          onChanged:
                                              store.modelStore.changeMunicipio,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () async {
                                        var sucesso = await loadingMessage(
                                            context, store.gerarPublish);

                                        if (sucesso) {
                                          Navigator.of(context).pop(true);
                                        } else {
                                          Modular.to.pop();
                                        }
                                      },
                                      child: const Text("Gerar Publish"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => Modular.to.pop(),
                                      child: const Text("Cancelar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : null,
                    child: Text("Gerar Publish"),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
