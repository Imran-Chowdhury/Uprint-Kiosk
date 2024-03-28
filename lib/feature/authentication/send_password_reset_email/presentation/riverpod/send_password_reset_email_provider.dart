



import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uprint_kisok/feature/authentication/send_password_reset_email/domain/send_password_reset_email_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/core/base/base_state.dart';

final SendPasswordResetEmailProvider = StateNotifierProvider<SendPasswordResetEmailNotifier, BaseState>(
  (ref) {
    return SendPasswordResetEmailNotifier(
      ref,
      useCase: ref.read(sendPasswordResetEmailUsecaseProvider),
    );
  },
);




class SendPasswordResetEmailNotifier extends StateNotifier<BaseState> {
  SendPasswordResetEmailNotifier(
    this.ref, {
    required this.useCase,
  }) : super(const InitialState());

  final Ref ref;
  final SendPasswordResetEmailUsecase useCase;
  final TextEditingController emailField = TextEditingController();

  Future<void> sendPasswordResetEmail() async {
    state = const LoadingState();



   Map<String, dynamic> requestBody = {
        "email": emailField.text.trim(),
      };

      final res = await useCase.sendPasswordResetEmail(requestBody);

     res.fold(
      (l) {
        state = ErrorState(l);
         Fluttertoast.showToast(
          msg: l,
          toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
         timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
          );
      }
      , (r) {
        if(r['status_code']==200){
          state = const SuccessState();
         Fluttertoast.showToast(
          msg:r['message'] ,
          toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
         timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
          );
        }else{
          state =  ErrorState(r['message']);
          Fluttertoast.showToast(
          msg:r['message'] ,
          toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
         timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
          );
        }


      }
    );

  }
}