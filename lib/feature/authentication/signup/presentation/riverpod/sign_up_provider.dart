

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uprint_kisok/core/base/base_state.dart';
import 'package:uprint_kisok/feature/authentication/signup/domain/use_case/sign_up_use_case.dart';

part 'sign_up_notifier.dart';


final signUpProvider = StateNotifierProvider<SignUpNotifier, BaseState>(
  (ref) {
    return SignUpNotifier(
      ref,
      useCase: ref.read(signUpUseCaseProvider),
      // accountVerificationUseCase: ref.read(accountVerificationUseCaseProvider),
    );
  },
);
