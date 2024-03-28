 part of 'login_provider.dart';




class LoginNotifier extends StateNotifier<BaseState> {
  LoginNotifier(
    
    this.ref, {
    required this.useCase,
  }) : super(const InitialState()) {
    // _autoFillTextFields();
  }

  final Ref ref;
   final LoginUseCase useCase;
  
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  // var accessToken;
 

  // void _autoFillTextFields() {
  //   if (CacheService().retrieve(CacheKeys.rememberMe) ?? false) {
  //     userNameField.text = CacheService().retrieve(CacheKeys.userName) ?? "";
  //     passwordField.text = CacheService().retrieve(CacheKeys.password) ?? "";
  //   }
  // }



  Future<void> login()async {
     
    state = const LoadingState();

    Map<String, dynamic> requestBody = {
    "email": emailField.text.trim(),
    "password": passwordField.text.trim(),
  };

  final res = await useCase.login(requestBody);

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
          // token = r['token'];
          // accessToken = r['token']['access']; //map
          // accessToken = r['token']; //map
        
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





  // Future<void> googleLogin()async{

  //   try{
  //       var user = await GoogleSignIn().signIn();

  //       if(user!=null){
  //          var userAuth = await user.authentication;
  //          var token = userAuth.accessToken;

  //         Map<String, dynamic> requestBody  = {'token': token};

  //           print(userAuth.accessToken);
  //           print(user.displayName);


  //           final res = await useCase.googleLogin(requestBody);

  //           res.fold(
  //             (l){
  //               state = ErrorState(l['message']);

  //               Fluttertoast.showToast(
  //                   msg: l['message'],
  //                   toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
  //                 timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
  //               );

  //             },
  //             (r){
  //               state = const SuccessState();

  //                 Fluttertoast.showToast(
  //                   msg:r['message'] ,
  //                   toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
  //                 timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
  //                 );


  //             },

  //           );
  //         }
  //   } catch (e, stackTrace) {
  //         print('Error: $e, StackTrace: $stackTrace');
  //    }
       
  // }

}




class GoogleLoginNotifier extends StateNotifier<BaseState> {
  GoogleLoginNotifier(
    
    this.ref, {
    required this.useCase,
  }) : super(const InitialState()) {
    // _autoFillTextFields();
  }

  final Ref ref;
  // final LoginUseCase useCase;
  final GoogleLoginUseCase useCase;
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  // var accessToken;
 

  // void _autoFillTextFields() {
  //   if (CacheService().retrieve(CacheKeys.rememberMe) ?? false) {
  //     userNameField.text = CacheService().retrieve(CacheKeys.userName) ?? "";
  //     passwordField.text = CacheService().retrieve(CacheKeys.password) ?? "";
  //   }
  // }






  Future<void> googleLogin()async{

    state = const LoadingState();

    try{
      await GoogleSignIn().signOut();
        var user = await GoogleSignIn().signIn();
        

        if(user!=null){
           var userAuth = await user.authentication;
           var token = userAuth.accessToken.toString();
          

          Map<String, dynamic> requestBody  = {'token': token};
          

            print(userAuth.accessToken.toString());
            print(user.displayName);
            print(user.email);


            final res = await useCase.googleLogin(requestBody);

            res.fold(
              (l){
                // print(l);
                


                  state = ErrorState(l['message']);

                Fluttertoast.showToast(
                    msg: l['message'],
                    toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
                  timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
                );

           
                

              },
              (r){
                //  print(r);
                

                   state = const SuccessState();

                  Fluttertoast.showToast(
                    msg:r['message'] ,
                    toastLength: Toast.LENGTH_LONG, // Use Toast.LENGTH_LONG for longer duration
                  timeInSecForIosWeb: 5, // Set time in seconds for iOS and web
                  );
                  
              },

            );
          }
    } catch (e, stackTrace) {
          print('Error: $e, StackTrace: $stackTrace');
     }
       
  }

}
