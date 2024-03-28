import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/core/base/base_state.dart';
import 'package:uprint_kisok/core/utils/utils.dart';
import 'package:uprint_kisok/core/validators/input_validators.dart';
import 'package:uprint_kisok/feature/authentication/login/presentation/views/login_screen.dart';
import 'package:uprint_kisok/feature/authentication/signup/presentation/riverpod/sign_up_provider.dart';
import 'package:uprint_kisok/widgets/custom_button.dart';
import 'package:uprint_kisok/widgets/custom_textfield.dart';



part '../widgets/signup_form.dart';





class SignUpScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
     print(screenHeight);
     print(screenWidth);


    final controller = ref.watch(signUpProvider.notifier); //watches over entire SignUpNotifier Class
    final state = ref.watch(signUpProvider); // watches the state (i.e base state) associated with the signUpProvider.
    
     //h = 866
    //w = 411.5

    ref.listen(signUpProvider,
    (_,state){
      if(state is SuccessState){
        Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
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

     
           
                      SizedBox(height: screenHeight*0.057,),
                  //  SizedBox(height: screenHeight*0.115,),
                  Text(
                    'SignUp',
                    style: TextStyle(
                      color: UIConstants.color.signupPurple,
    
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(
                    height: screenHeight*0.0115,),
                  const Text('Hello agent! Start a new journey with us.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                   SizedBox(
                     height: screenHeight*0.0115,),
                  const Text(
                    'Sign up an account to continue printing.',
                     style: TextStyle(
                    color: Colors.grey,
                  ),),
    
    
                _SignupForm(formKey: _formKey,controller: controller,),
                  //  controller.emailField
    
                 SizedBox(
                  width: screenWidth*0.972, // Set your custom width
                  height: screenHeight*0.07, // Set your custom height
                  child: CustomButton(
                    screenHeight: screenHeight,
                     buttonName: 'Sign Up',
                     color: UIConstants.color.signupPurple,
                      onpressed: (){

                      if (_formKey.currentState!.validate()) {


                        controller.signUp();

                       }
                      },
                     ),
                ),
              SizedBox(height: screenHeight*0.023),
    
          
    
              SizedBox(height: screenHeight*0.023),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
              const  Text(
                    "Already have an account?",
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
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
                  },
                   child: const  Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                      ),
                 ),
                ],
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
        )
      ),
    );

    
  }
}



