import 'package:app_teste_login/models/post_model.dart';
import 'package:app_teste_login/repositories/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepository.getList();
  }
}
