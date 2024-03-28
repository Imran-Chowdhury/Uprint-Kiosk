import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uprint_kisok/feature/authentication/login/presentation/views/login_screen.dart';

// import '../../../../widgets/dialogbox.dart';


class HomeScreen extends ConsumerWidget {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;

    return 
    // WillPopScope(
    //   onWillPop: () async {
    //     showAlertDialog(context); // Show the alert dialog when the back button is pressed
    //     return false; // Prevent the back button from closing the app immediately
    //     // return true;
    //   },
    //   child: 
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const  Text('Home Screen will be implemented soon'),
              ElevatedButton(
                onPressed: () => signOutGoogle(context), // Pass context here
                child: const Text('Log out'),
              ),
            ],
          ),
        ),
      );
    // );
  }

  Future<void> signOutGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    final currentUser = googleSignIn.currentUser;
    print('The current user is $currentUser');
    try {
      if(currentUser!=null){
        
       await googleSignIn.disconnect();
       // ignore: use_build_context_synchronously
        //  Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => LoginScreen()),
        //     );
// ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );


      }else{
        // ignore: use_build_context_synchronously
        //  Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => LoginScreen()),
        //     );


              Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
      }
    
    } catch (e) {
    rethrow;
      // Handle sign-out error
    }
  }
}

