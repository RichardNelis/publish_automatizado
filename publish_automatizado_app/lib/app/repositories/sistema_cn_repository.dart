import 'package:dio/dio.dart';
import 'package:publish_automatizado/app/model/message_model.dart';
import 'package:publish_automatizado/app/model/sistema_cn_model.dart';
import 'package:publish_automatizado/app/utils/constants.dart';

class SistemaCNRepository {
  late Dio dio;

  SistemaCNRepository() {
    dio = Dio();
    dio.options.baseUrl = kAHost;
  }

  Future<List<SistemaCNModel>> fetchAll() async {
    Response response;

    try {
      List<SistemaCNModel> lista = <SistemaCNModel>[];

      response = await dio.get(kASistemaCN);

      response.data.forEach(
        (d) => lista.add(
          SistemaCNModel.fromMap(d),
        ),
      );

      return lista;
    } on DioError catch (e) {
      throw Exception("Erro DIO");
    } on Exception catch (e) {
      throw Exception("Erro Ex");
    }
  }

  Future insert(SistemaCNModel model) async {
    Response response;
    MessageModel message;

    try {
      response = await dio.post(
        kASistemaCN,
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

  Future update(SistemaCNModel model) async {
    Response response;
    MessageModel message;

    try {
      response = await dio.put(
        kASistemaCN,
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
}
