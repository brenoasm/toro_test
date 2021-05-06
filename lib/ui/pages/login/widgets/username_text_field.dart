import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toro_test/ui/pages/pages.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'login_text_field.dart';

class UsernameTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<String?>(
      stream: presenter.usernameErrorStream,
      initialData: null,
      builder: (context, snapshot) {
        final error = snapshot.data;

        return LoginTextField(
          labelText: usernameTitle,
          error: error,
          validator: (value) {
            presenter.onUsernameChanged(value);
          },
        );
      },
    );
  }
}
