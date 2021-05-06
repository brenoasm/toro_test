import 'package:toro_test/main/factories/factories.dart';

import 'package:toro_test/ui/presenters/presenters.dart';

LoginStreamPresenter makeLoginStreamPresenter() => LoginStreamPresenter(
      signInUseCase: makeSignInUseCase(),
      validation: makeLoginValidation(),
    );
