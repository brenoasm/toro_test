import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'package:toro_test/ui/pages/pages.dart';

import 'login_text_field.dart';

class PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<String?>(
      stream: presenter.passwordErrorStream,
      initialData: null,
      builder: (context, snapshot) {
        final error = snapshot.data;

        return LoginTextField(
          obscureText: true,
          labelText: passwordTitle,
          error: error,
          validator: (value) {
            presenter.onPasswordChanged(value);
          },
        );
      },
    );
  }
}
