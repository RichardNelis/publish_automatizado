import 'package:flutter/material.dart';
import 'package:publish_automatizado/app/model/message_model.dart';

SnackBar customSnackBar(MessageModel messageModel) {
  return SnackBar(
    backgroundColor: messageModel.sucesso! ? Colors.green : Colors.red,
    content: Text(messageModel.toString()),
  );
}
