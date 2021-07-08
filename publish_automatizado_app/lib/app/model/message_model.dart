import 'dart:convert';

import 'package:dio/dio.dart';

class MessageModel {
  String? mensagem;
  bool? sucesso;

  MessageModel({this.mensagem, this.sucesso}) {
    this.sucesso = this.sucesso ?? true;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      mensagem: map['mensagem'],
    );
  }

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  toString() {
    String msg = mensagem!;
    msg = msg.replaceAll('[', '');
    msg = msg.replaceAll(']', '');
    return msg;
  }

  static MessageModel erroMensagem(
      {Response? response, String? messageDinamica}) {
    MessageModel messagemodel = MessageModel();

    if (response != null && response.data != null) {
      messagemodel = MessageModel.fromMap(response.data);
    } else if (messageDinamica != null) {
      messagemodel.mensagem = messageDinamica;
    } else {
      messagemodel.mensagem =
          "Desculpe encontrados um erro!\nTente novamente mais tarde.";
    }

    messagemodel.sucesso = false;
    return messagemodel;
  }
}
