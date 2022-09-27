import 'dart:convert';

import 'package:app_teste_login/models/post_model.dart';
import 'package:app_teste_login/repositories/home_repository.dart';
import 'package:flutter/services.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    // root Bundle, acessa a pagina (assets/data.json) loead String
    List postJson = jsonDecode(value);
    // realizado o decode da lista de objetivo obtidos no data.json
    return postJson.map((e) => PostModel.fromJson(e)).toList();
    // realiza um mapeamento de postJson para PostModel
  }
}
