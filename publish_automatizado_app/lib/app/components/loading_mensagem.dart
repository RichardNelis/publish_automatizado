import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:publish_automatizado_app/app/components/custom_snackbar.dart';
import 'package:publish_automatizado_app/app/model/message_model.dart';

Future<bool> loadingMessage(context, Future<dynamic> press()) async {
  MessageModel messageModel = MessageModel();
  BuildContext contextLoading = context;

  FocusScope.of(context).requestFocus(FocusNode());

  showDialog(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (context) {
      contextLoading = context;

      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: 50,
            color: Colors.transparent,
            child: circularProgress(),
          ),
        ),
      );
    },
  );

  messageModel = await press();

  Modular.to.pop(contextLoading);

  if (messageModel.mensagem != null) {
    asuka.showSnackBar(customSnackBar(messageModel));
    return messageModel.sucesso!;
  }

  return false;
}

Widget circularProgress() => Center(
        child: SpinKitCircle(
      color: Colors.white,
      size: 50.0,
    ));
