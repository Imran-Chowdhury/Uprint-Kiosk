







import 'package:flutter/material.dart';
import 'package:uprint_kisok/core/utils/utils.dart';
import 'package:uprint_kisok/core/validators/input_validators.dart';

import 'package:uprint_kisok/feature/password_reset/presentation/views/password_reset_screen.dart';
import 'package:uprint_kisok/widgets/custom_button.dart';
import 'package:uprint_kisok/widgets/custom_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/core/base/base_state.dart';

import 'package:uprint_kisok/feature/authentication/send_password_reset_email/presentation/riverpod/send_password_reset_email_provider.dart';
part '../widgets/send_password_reset_email_form.dart';



class SendPasswordResetEmailScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
     print(screenHeight);
     print(screenWidth);


    final controller = ref.watch(SendPasswordResetEmailProvider.notifier); //watches over entire SignUpNotifier Class
    final state = ref.watch(SendPasswordResetEmailProvider); // watches the state (i.e base state) associated with the signUpProvider.
    
  
     //h = 866
    //w = 411.5

    ref.listen(SendPasswordResetEmailProvider, 
    (_,state){
      if(state is SuccessState){
        controller.emailField.clear();
           Navigator.push(context,MaterialPageRoute(
                builder: (context) => ResetPasswordScreen(), // Instantiate the destination page widget
              ),
           );
      }
    });
    
    return GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
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

     
                      SizedBox(height: screenHeight*0.1,),
                      // SizedBox(height: screenHeight*0.057,),
                  //  SizedBox(height: screenHeight*0.115,),
                  Text(
                    'Apply for an OTP',
                    style: TextStyle(
                      color: UIConstants.color.loginBlue,
    
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(
                    height: screenHeight*0.0115,),
                  const Text('Agent you can request for geneartion of an OTP.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                   SizedBox(
                     height: screenHeight*0.0115,),
                  const Text(
                    "Enter your account's email.",
                     style: TextStyle(
                    color: Colors.grey,
                  ),),

               

                  SizedBox(height: screenHeight*0.057,),
    
    
                // _SignupForm(formKey: _formKey,controller: controller,),
                
                _SendEmailForm(formKey: _formKey,controller: controller),
                  //  controller.emailField
    
                 SizedBox(
                  width: screenWidth*0.972, // Set your custom width
                  height: screenHeight*0.07, // Set your custom height
                  child: CustomButton(
                    screenHeight: screenHeight,
                     buttonName: 'Click for an OTP',
                     color: UIConstants.color.loginBlue,
                      onpressed: (){

                      if (_formKey.currentState!.validate()) {


                        controller.sendPasswordResetEmail();


    
                          // Navigator.push(context,MaterialPageRoute(
                          //     builder: (context) => HomeScreen(), // Instantiate the destination page widget
                          //     ),
                          //   );
                       }
                      },
                     ),
                ),
                const SizedBox(height: 20.0,),
                 SizedBox(
                  width: screenWidth*0.972, // Set your custom width
                  height: screenHeight*0.07, // Set your custom height
                  child: CustomButton(
                    screenHeight: screenHeight,
                     buttonName: 'I have an unused OTP',
                     color: UIConstants.color.loginBlue,
                      onpressed: (){
                        controller.emailField.clear();

                     


    
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(), // Instantiate the destination page widget
                              ),
                            );
                       
                      },
                     ),
                ),
              SizedBox(height: screenHeight*0.023),
    
              
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
        )
      ),
    );

    
  }
}



