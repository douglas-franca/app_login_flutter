// ignore_for_file: prefer_const_constructors

import 'package:app_teste_login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginButtonComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Falha ao realizar o login'),
                      duration: const Duration(seconds: 5),
                    ));
                  }
                });
              },
              child: Text('login'),
            ),
    );
  }
}
