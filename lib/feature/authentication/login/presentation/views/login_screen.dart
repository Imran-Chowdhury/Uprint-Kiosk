import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:uprint_kisok/core/base/base_state.dart';
import 'package:uprint_kisok/core/utils/utils.dart';

import 'package:uprint_kisok/core/validators/input_validators.dart';
// import 'package:uprint_kisok/feature/authentication/google_login/riverpod/google_login_provider.dart';
import 'package:uprint_kisok/feature/authentication/login/presentation/riverpod/login_provider.dart';
import 'package:uprint_kisok/feature/authentication/send_password_reset_email/presentation/views/send_password_reset_email_screen.dart';

import 'package:uprint_kisok/feature/authentication/signup/presentation/views/signup_screen.dart';
import 'package:uprint_kisok/feature/home/presentation/views/home_screen.dart';
import 'package:uprint_kisok/widgets/custom_button.dart';
import 'package:uprint_kisok/widgets/custom_textfield.dart';


part '../widgets/login_form.dart';



class LoginScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = ref.watch(loginProvider.notifier);
   final googleController = ref.watch(googleLoginProvider.notifier);
    final state  = ref.watch(loginProvider);
    final googleState = ref.watch(googleLoginProvider);
    // var token;
    
    
    print(screenHeight);
    print(screenWidth);

     //h = 866
    //w = 411.5
   

    ref.listen(loginProvider,(_,state){
      if(state is SuccessState){

        controller.emailField.clear();
        controller.passwordField.clear();
        // token = controller.accessToken;
        
          //  Navigator.push(context,MaterialPageRoute(
          //                     builder: (context) => HomeScreen(), // Instantiate the destination page widget
          //                     ),
          //                   );
                               Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,
            );


      }
    });

    ref.listen(googleLoginProvider,(_,state){
      if(state is SuccessState){

      
        // token = controller.accessToken;
        
          //  Navigator.push(context,MaterialPageRoute(
          //                     builder: (context) => HomeScreen(), // Instantiate the destination page widget
          //                     ),
          //                   );

                            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,
            );


      }
    });


    
    return GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children:[ SingleChildScrollView(
            child: Center(
            child: Padding(
              padding:  EdgeInsets.all(screenHeight*0.018),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: screenHeight*0.057,),

                 
                    Center(
                      child: Container(
                          height: screenHeight*0.092, //80
                          width: screenWidth*0.437, //180
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/logo/uprintLogo.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                    ),

     
           
                      SizedBox(height: screenHeight*0.057,),
                  //  SizedBox(height: screenHeight*0.115,),
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: UIConstants.color.loginBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(
                    height: screenHeight*0.0115,),
                  const Text('We are happy to see you agent',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                   SizedBox(
                     height: screenHeight*0.0115,),
                  const Text(
                    'Sign in to your account to continue printing',
                     style: TextStyle(
                    color: Colors.grey,
                  ),),
    
    
                _LoginForm(formKey: _formKey,controller: controller,),
                
    
                 SizedBox(
                  width: screenWidth*0.972, // Set your custom width
                  height: screenHeight*0.07, // Set your custom height
                  child: CustomButton(
                    screenHeight: screenHeight, 
                    buttonName: 'Login',
                    color: UIConstants.color.loginBlue,
                    onpressed: (){

                      if (_formKey.currentState!.validate()) {

                        controller.login();
                        // print(controller.accessToken);

                    
                       }
                      },
                    ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                SizedBox(
                  width: screenWidth*0.972, // Set your custom width
                  height: screenHeight*0.07, // Set your custom height
                  child: CustomButton(
                    screenHeight: screenHeight, 
                    buttonName: 'Continue with Google',
                    color: UIConstants.color.loginBlue,
                    onpressed: (){

                      googleController.googleLogin();



                     
                      },
                    ),
                ),
              SizedBox(height: screenHeight*0.023),
    
               Center(
                 child: GestureDetector(
                  onTap: () {
                       Navigator.pushReplacement(context,MaterialPageRoute(
                              builder: (context) => SendPasswordResetEmailScreen(), // Instantiate the destination page widget
                              ),
                            );
                  },
                   child: const Text('Forgot password',
                   style: TextStyle(color: Colors.orange),),
                 ),
               ),
    
              SizedBox(height: screenHeight*0.023),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
              const  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: screenWidth*0.024),
                 GestureDetector(
                  onTap: () {
                    controller.emailField.clear();
                   controller.passwordField.clear();
                    Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
                  },
                   child: const  Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                      ),
                 ),

                //  const SizedBox(width: 10.0,),
                //  const ElevatedButton(onPressed: signOutGoogle, child: Text('Log out')),
                ],
               ),     
                ],
              ),
            ),
            ),
          ),
            if (state is LoadingState || googleState is LoadingState) // Conditionally display CircularProgressIndicator
              const Center(
                child: CircularProgressIndicator(),
              ),
          ]
        ),
      ),
    );

    
  }
}


