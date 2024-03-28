
part of '../views/password_reset_screen.dart';



class _PasswordResetForm extends ConsumerWidget {
  const _PasswordResetForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required ResetPasswordNotifier controller, 
  })  : _formKey = formKey,
        _controller = controller,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ResetPasswordNotifier _controller; 

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
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'Enter the OTP',
            validator: ValidationUtils.otpValidator,
            textcontroller: _controller.otpField, // Access the email controller from SignUpNotifier
          ),
          SizedBox(height: screenHeight * 0.046),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'New Password',
            isPassword: true,
            validator: ValidationUtils.passwordValidator,
            textcontroller: _controller.passwordField1,  // Access the password controller from SignUpNotifier
          ),
          SizedBox(height: screenHeight * 0.046),
            roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'Confirm Password',
            validator: ValidationUtils.passwordValidator2,
            textcontroller: _controller.passwordField2, // Access the email controller from SignUpNotifier
          ),
          SizedBox(height: screenHeight * 0.07),
        ],
      ),
    );
  }
}