// ignore_for_file: prefer_const_constructors
import 'package:app_teste_login/components/login/custom_login_button_component.dart';
import 'package:app_teste_login/controllers/login_controller.dart';
import 'package:app_teste_login/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.2),
            CustomTextFieldWidget(
              label: 'login',
              onChanged: _controller.setLogin,
            ),
            CustomTextFieldWidget(
              label: 'senha',
              onChanged: _controller.setPass,
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomLoginButtonComponent(
              loginController: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
