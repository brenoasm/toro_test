import 'package:toro_test/domain/repositories/repositories.dart';

import 'package:toro_test/infra/repositorories/repositories.dart';

AuthRepository makeAuthRepository() => AuthRepositoryImpl();
