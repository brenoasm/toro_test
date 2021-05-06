import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'package:toro_test/ui/pages/pages.dart';
import 'package:toro_test/ui/widgets/widgets.dart';

import 'widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late StreamSubscription<bool?> _loadingSubscription;
  late StreamSubscription<String?> _mainErrorSubscription;
  late StreamSubscription<String?> _redirectSubscription;

  @override
  void dispose() {
    _loadingSubscription.cancel();
    _mainErrorSubscription.cancel();
    _redirectSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          _loadingSubscription =
              widget.presenter.isLoadingStream.listen((isLoading) {
            if (isLoading == true) {
              showLoadingDialog(context);
            } else if (isLoading != null) {
              Navigator.of(context).pop();
            }
          });

          _mainErrorSubscription =
              widget.presenter.mainErrorStream.listen((mainError) {
            if (mainError != null) {
              showErrorDialog(context, error: mainError);
            }
          });

          _redirectSubscription =
              widget.presenter.redirectRouteStream.listen((redirectRoute) {
            if (redirectRoute != null) {
              Navigator.of(context).pushNamed(redirectRoute);
            }
          });

          return LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Provider(
                  create: (context) => widget.presenter,
                  builder: (context, __) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 40,
                              right: 40,
                            ),
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 32,
                                    ),
                                    child: Image.asset(
                                      logoTransparentPath,
                                      height: 35,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.grey.shade800,
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kFontFamily,
                                      ),
                                      text: easiestWayToInvestOne,
                                      children: [
                                        TextSpan(
                                          text: easiestWayToInvestTwo,
                                          style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.cyan.shade600,
                                            height: 1.2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: easiestWayToInvestThree,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 32,
                                      bottom: 24,
                                    ),
                                    child: UsernameTextField(),
                                  ),
                                  PasswordTextField(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: 32,
                            horizontal: 16,
                          ),
                          child: StreamBuilder<bool>(
                            stream: widget.presenter.isFormValidStream,
                            initialData: false,
                            builder: (context, snapshot) {
                              return DefaultElevatedButton(
                                height: 70,
                                text: enter.toUpperCase(),
                                onPressed: snapshot.data == true
                                    ? widget.presenter.signIn
                                    : null,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
