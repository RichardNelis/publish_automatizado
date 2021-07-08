import 'package:dio/dio.dart';
import 'package:publish_automatizado/app/model/message_model.dart';
import 'package:publish_automatizado/app/model/sistema_create_model.dart';
import 'package:publish_automatizado/app/model/sistema_model.dart';
import 'package:publish_automatizado/app/utils/constants.dart';

class SistemaRepository {
  late Dio dio;

  SistemaRepository() {
    dio = Dio();
    dio.options.baseUrl = kAHost;
  }

  Future<List<SistemaModel>> fetchAll() async {
    Response response;

    try {
      List<SistemaModel> lista = <SistemaModel>[];

      response = await dio.get(kASistema);

      response.data.forEach(
        (d) => lista.add(
          SistemaModel.fromMap(d),
        ),
      );

      return lista;
    } on DioError catch (e) {
      throw Exception("Erro DIO");
    } on Exception catch (e) {
      throw Exception("Erro Ex");
    }
  }

  Future<MessageModel> insert(SistemaCreateModel model) async {
    Response response;
    MessageModel message;

    try {
      response = await dio.post(
        kASistema,
        data: model.toJson(),
      );

      message = MessageModel.fromMap(response.data["message"]);
    } on DioError catch (e) {
      message = MessageModel.erroMensagem(response: e.response);
    } on Exception {
      message = MessageModel.erroMensagem();
    }

    return message;
  }

  Future update(SistemaCreateModel model) async {
    Response response;
    MessageModel message;

    try {
      response = await dio.put(
        kASistema,
        data: model.toJson(),
      );

      message = MessageModel.fromMap(response.data);
    } on DioError catch (e) {
      message = MessageModel.erroMensagem(response: e.response);
    } on Exception {
      message = MessageModel.erroMensagem();
    }

    return message;
  }

  Future delete(int idSistema) async {
    Response response;
    MessageModel message;

    try {
      response = await dio.delete("$kASistema/$idSistema");

      message = MessageModel.fromMap(response.data);
    } on DioError catch (e) {
      message = MessageModel.erroMensagem(response: e.response);
    } on Exception {
      message = MessageModel.erroMensagem();
    }

    return message;
  }
}
