import 'package:toro_test/ui/pages/pages.dart';

import 'login_presenter_factory.dart';

LoginPage makeLoginPage() => LoginPage(
      presenter: makeLoginStreamPresenter(),
    );
