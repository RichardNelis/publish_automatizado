import 'package:dio/dio.dart';
import 'package:publish_automatizado/app/model/chamado_model.dart';
import 'package:publish_automatizado/app/model/message_model.dart';
import 'package:publish_automatizado/app/utils/constants.dart';

class PublishRepository {
  late Dio dio;

  PublishRepository() {
    dio = Dio();
    dio.options.baseUrl = kAHost;
  }

  Future publish(ChamadoModel model) async {
    Response response;
    MessageModel message;

    try {
      response = await dio.post(
        kAPublish,
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
