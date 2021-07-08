import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado_app/app/components/loading_mensagem.dart';
import 'package:publish_automatizado_app/app/modules/cadastro/sistema/sistema_store.dart';
import 'package:flutter/material.dart';
import 'package:publish_automatizado_app/app/store/sistema_model_store.dart';

class SistemaPage extends StatefulWidget {
  final String title;
  const SistemaPage({Key? key, this.title = 'Sistema'}) : super(key: key);
  @override
  SistemaPageState createState() => SistemaPageState();
}

class SistemaPageState extends State<SistemaPage> {
  final SistemaStore store = Modular.get();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: _formKey,
          child: Observer(
            builder: (_) {
              if (store.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (store.sistemas == null) {
                  return Container(
                    child: Center(
                      child: Text("Carregando..."),
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          store.sistemas!.length > 0
                              ? DropdownButtonFormField<SistemaModelStore>(
                                  items: store.sistemas!
                                      .map(
                                        (element) =>
                                            DropdownMenuItem<SistemaModelStore>(
                                          value: element,
                                          child:
                                              Text(element.model.nomeSistema!),
                                        ),
                                      )
                                      .toList(),
                                  decoration: InputDecoration(
                                    labelText:
                                        "Selecione um sistema para alterar",
                                  ),
                                  onChanged: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());

                                    store.selecionarSistema(value!);
                                  },
                                )
                              : Container(),
                          TextFormField(
                            controller: store.nomeController,
                            decoration: InputDecoration(labelText: "Sistema"),
                            onChanged:
                                store.sistemaModelStore.changeNomeSistema,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório!";
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: store.caminhoController,
                            decoration: InputDecoration(labelText: "Caminho"),
                            onChanged:
                                store.sistemaModelStore.changeCaminhoSistema,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório!";
                              }
                            },
                          ),
                          SizedBox(height: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dependências"),
                              SizedBox(height: 30),
                              Container(
                                height: store.dependencias!.length * 55,
                                child: ReorderableListView(
                                  onReorder: store.changeIndexDependencia,
                                  children: <Widget>[
                                    for (var i = 0;
                                        i < store.dependencias!.length;
                                        i++)
                                      CheckboxListTile(
                                        key: ValueKey(store
                                            .dependencias![i].model.idCodigo),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.compare_arrows),
                                                SizedBox(width: 20),
                                                Text(store.dependencias![i]
                                                    .model.nomeSistema!)
                                              ],
                                            ),
                                          ],
                                        ),
                                        value: true,
                                        onChanged: (value) {
                                          store.addItemSistema(i);
                                        },
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sistemas CN"),
                              SizedBox(height: 30),
                              Container(
                                height: store.sistemaCNs!.length * 55,
                                child: ListView.builder(
                                  itemCount: store.sistemaCNs!.length,
                                  itemBuilder: (context, i) {
                                    return CheckboxListTile(
                                      value: false,
                                      onChanged: (value) {
                                        store.addItemDependencia(i);
                                      },
                                      title: Text(store
                                          .sistemaCNs![i].model.nomeSistema!),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool sucesso =
                                    await loadingMessage(context, store.save);

                                if (sucesso) {
                                  store.home();
                                }
                              }
                            },
                            child: Text("Salvar"),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
