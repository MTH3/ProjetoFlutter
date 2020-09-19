import 'package:flutter/material.dart';
import 'package:projeto_carros/pages/alert.dart';
import 'package:projeto_carros/pages/api_response.dart';
import 'package:projeto_carros/pages/home_page.dart';
import 'package:projeto_carros/pages/login_api.dart';
import 'package:projeto_carros/pages/usuarios.dart';
import 'package:projeto_carros/utils/Nav.dart';
import 'package:projeto_carros/widgets/app_button.dart';
import 'package:projeto_carros/widgets/app_form_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            AppForm(
              'Login',
              'Digite o email',
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              nextFocus: _focusSenha,
            ),
            SizedBox(height: 10),
            AppForm(
              'Senha',
              'digite a senha',
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(height: 20),
            AppButton(
              'Login',
              onPressed: _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;

    ApiResponse response = await LoginAPI.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;

      push(context, HomePage());
    } else {
      alert(context, response.msg);
    }
  }

// Validaçao de Login e senha!
  String _validateLogin(String text) {
    if (text.isEmpty) {
      return 'ERRO: por favor Digite o login';
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return 'ERRO: por favor Digite a senha';
    }
    return null;
  }
}
