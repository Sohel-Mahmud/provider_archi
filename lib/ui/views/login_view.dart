import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_archi/core/viewmodels/login_view_model.dart';
import 'package:provider_archi/ui/shared/app_colors.dart';
import 'package:provider_archi/ui/views/base_widget.dart';
import 'package:provider_archi/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider.value(
    //   value: LoginViewModel(authenticationService: Provider.of(context)),
    //   child: Consumer<LoginViewModel>(
    //     child: LoginHeader(controller: _controller),
    //     builder: (context, model, child) => Scaffold(
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            model.busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
