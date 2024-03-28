import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uprint_kisok/core/base/base_state.dart';
import 'package:uprint_kisok/core/utils/utils.dart';

import 'package:uprint_kisok/core/validators/input_validators.dart';

import 'package:uprint_kisok/feature/authentication/login/presentation/views/login_screen.dart';

import 'package:uprint_kisok/feature/password_reset/presentation/riverpod/password_reset_provider.dart';
import 'package:uprint_kisok/widgets/custom_button.dart';
import 'package:uprint_kisok/widgets/custom_textfield.dart';


part '../widgets/password_reset_form.dart';



class ResetPasswordScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = ref.watch(resetPasswordProvider.notifier);
   final state  = ref.watch(resetPasswordProvider);
    
    
    print(screenHeight);
    print(screenWidth);

     //h = 866
    //w = 411.5
   

    ref.listen(resetPasswordProvider,(_,state){
      if(state is SuccessState){

        controller.emailField.clear();
        controller.passwordField1.clear();
        controller.passwordField2.clear();
        controller.otpField.clear();
        
           Navigator.push(context,MaterialPageRoute(
                              builder: (context) => LoginScreen(), // Instantiate the destination page widget
                              ),
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
                    'Reset Password',
                    style: TextStyle(
                      color: UIConstants.color.loginBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(
                    height: screenHeight*0.0115,),
                  const Text('You can reset your password here',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                   SizedBox(
                     height: screenHeight*0.0115,),
                  const Text(
                    'For the otp check your email.',
                     style: TextStyle(
                    color: Colors.grey,
                  ),),
    
    
                _PasswordResetForm(formKey: _formKey,controller: controller,),
                
    
                 SizedBox(
                  width: screenWidth*0.972, // Set your custom width
                  height: screenHeight*0.07, // Set your custom height
                  child: CustomButton(
                    screenHeight: screenHeight, 
                    buttonName: 'Reset',
                    color: UIConstants.color.loginBlue,
                    onpressed: (){

                      if (_formKey.currentState!.validate()) {

                        controller.resetPassword();
                      
                
                       }
                      },
                    ),
                ),

                ],
              ),
            ),
            ),
          ),
            if (state is LoadingState) // Conditionally display CircularProgressIndicator
              const Center(
                child: CircularProgressIndicator(),
              ),
          ]
        ),
      ),
    );

    
  }
}
