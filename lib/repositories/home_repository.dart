import 'package:app_teste_login/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
