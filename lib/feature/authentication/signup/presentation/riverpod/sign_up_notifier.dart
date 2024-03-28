part of 'sign_up_provider.dart';




class SignUpNotifier extends StateNotifier<BaseState> {
  SignUpNotifier(
    this.ref, {
    required this.useCase,
    // required this.accountVerificationUseCase,
  }) : super(const InitialState());

  final Ref ref;
  final SignUpUseCase useCase;
  // final AccountVerificationUseCase accountVerificationUseCase;




  Future<void> signUp() async {
    state = const LoadingState();

    
      Map<String, dynamic> requestBody = {
        "email": emailField.text.trim(),
        "password": passwordField.text.trim(),
        "password2": confirmPasswordField.text.trim(),
        "first_name": firstNameField.text.trim(),
        "last_name": lastNameField.text.trim(),
        "mobile_number": phoneNumberField.text.trim(),
        "username": userNameField.text.trim(),
        "registration_id": ""
        // "first_name": "Imran",
        // "mobile_number": "1234567890",
        // "last_name": "Chowdhury",
        // "username": "Imran",
         //"registration_id": ""
      };

      
      final res = await useCase.signUp(requestBody);
      

      
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




  final TextEditingController firstNameField = TextEditingController();
  final TextEditingController lastNameField = TextEditingController();
  final TextEditingController phoneNumberField = TextEditingController();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController userNameField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  final TextEditingController confirmPasswordField = TextEditingController();
}
