





import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:uprint_kisok/core/base/base_state.dart';
import 'package:uprint_kisok/feature/authentication/login/domain/use_case/login_use_case.dart';

part 'login_notifier.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, BaseState>(
  (ref) {
    return LoginNotifier(
      ref,
      useCase: ref.read(loginUseCaseProvider),
    );
  },
);



final googleLoginProvider = StateNotifierProvider<GoogleLoginNotifier, BaseState>(
  (ref) {
    return GoogleLoginNotifier(
      ref,
      useCase: ref.read(googleloginUseCaseProvider),
    );
  },
);

