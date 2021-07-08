import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:publish_automatizado_app/app/components/loading_mensagem.dart';
import 'package:publish_automatizado_app/app/modules/cadastro/sistema_cn/sistema_cn_store.dart';
import 'package:flutter/material.dart';
import 'package:publish_automatizado_app/app/store/sistema_cn_model_store.dart';

class SistemaCNPage extends StatefulWidget {
  final String title;
  const SistemaCNPage({Key? key, this.title = 'Sistema CN'}) : super(key: key);
  @override
  SistemaCNPageState createState() => SistemaCNPageState();
}

class SistemaCNPageState extends State<SistemaCNPage> {
  final SistemaCNStore store = Modular.get();

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
                if (store.sistemaCNs == null) {
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
                          store.sistemaCNs!.length > 0
                              ? DropdownButtonFormField<SistemaCNModelStore>(
                                  items: store.sistemaCNs!
                                      .map(
                                        (element) => DropdownMenuItem<
                                            SistemaCNModelStore>(
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

                                    store.selecionarSistemaCN(value!);
                                  },
                                )
                              : Container(),
                          TextFormField(
                            controller: store.nomeController,
                            decoration: InputDecoration(labelText: "Sistema"),
                            onChanged:
                                store.sistemaCNModelStore.changeNomeSistema,
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
                                store.sistemaCNModelStore.changeCaminhoSistema,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório!";
                              }
                            },
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
