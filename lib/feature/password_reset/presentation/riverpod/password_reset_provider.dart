import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uprint_kisok/core/base/base_state.dart';
import 'package:uprint_kisok/feature/password_reset/domain/use_case/password_reset_use_case.dart';





final resetPasswordProvider = StateNotifierProvider<ResetPasswordNotifier, BaseState>((ref) {
  return ResetPasswordNotifier(ref, useCase: ref.read(resetPasswordUseCaseProvider));
  
},);



class ResetPasswordNotifier extends StateNotifier<BaseState> {
  ResetPasswordNotifier(
    this.ref, {
    required this.useCase,
    // required this.accountVerificationUseCase,
  }) : super(const InitialState());
  Ref ref;
  ResetPasswordUseCase useCase;


  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField1 = TextEditingController();
  TextEditingController passwordField2 = TextEditingController();
  TextEditingController otpField =TextEditingController();
  
  


  Future<void> resetPassword()async {
    state = const LoadingState();

     Map<String, dynamic> requestBody = {
    "email": emailField.text.trim(),
    "otp": otpField.text.trim(),
    "password": passwordField1.text.trim(),
    "password2":passwordField2.text.trim(),
  };

  final res = await useCase.resetPassword(requestBody);

     
   
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