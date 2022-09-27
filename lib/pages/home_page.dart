// ignore_for_file: prefer_const_constructors

import 'package:app_teste_login/controllers/home_controller.dart';
import 'package:app_teste_login/models/post_model.dart';
import 'package:app_teste_login/repositories/home_repository_imp.dart';
import 'package:app_teste_login/services/prefs_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => true);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(list[idx].id.toString()),
              title: Text(list[idx].title),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context).pushNamed(
                '/details',
                arguments: list[idx],
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
