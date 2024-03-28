// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:uprint_kisok/core/utils/utils.dart';
// import 'package:uprint_kisok/core/validators/input_validators.dart';
// import 'package:uprint_kisok/widgets/custom_textfield.dart';
// import 'package:uprint_kisok/feature/authentication/signup/presentation/riverpod/sign_up_provider.dart';
// import 'package:uprint_kisok/widgets/custom_textfield.dart';
part of '../views/send_password_reset_email_screen.dart';


class _SendEmailForm extends ConsumerWidget {
  const _SendEmailForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required SendPasswordResetEmailNotifier controller, // Adjust the type to SignUpNotifier
  })  : _formKey = formKey,
        _controller = controller,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final SendPasswordResetEmailNotifier _controller; // Declare the controller as SignUpNotifier

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.05),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'Email',
            validator: ValidationUtils.emailValidator,
            textcontroller: _controller.emailField, // Access the email controller from SignUpNotifier
          ),
          SizedBox(height: screenHeight * 0.046),
          // roundedTextField(
          //   UIConstants.color.signupPurple,
          //   screenHeight,
          //   screenWidth,
          //   'Password',
          //   isPassword: true,
          //   validator: ValidationUtils.passwordValidator,
          //   textcontroller: _controller.passwordField,  // Access the password controller from SignUpNotifier
          // ),
          // SizedBox(height: screenHeight * 0.07),
        ],
      ),
    );
  }
}