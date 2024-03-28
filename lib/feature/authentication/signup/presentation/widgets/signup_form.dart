part of '../views/signup_screen.dart';






class _SignupForm extends ConsumerWidget {
  const _SignupForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required SignUpNotifier controller, 
  })  : _formKey = formKey,
        _controller = controller,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final SignUpNotifier _controller; 

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
            'Password',
            isPassword: true,
            validator: ValidationUtils.passwordValidator,
            textcontroller: _controller.passwordField,  
          ),
          
           SizedBox(height: screenHeight * 0.05),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'Confirm Password',
            validator: ValidationUtils.passwordValidator2,
            textcontroller: _controller.confirmPasswordField, 
          ),
           SizedBox(height: screenHeight * 0.05),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'First Name',
            validator: ValidationUtils.firstNameValidator,
            textcontroller: _controller.firstNameField, // Access the email controller from SignUpNotifier
          ),
           SizedBox(height: screenHeight * 0.05),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'Last Name',
            validator: ValidationUtils.lastNameValidator,
            textcontroller: _controller.lastNameField, // Access the email controller from SignUpNotifier
          ),
           SizedBox(height: screenHeight * 0.05),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'Mobile Number',
            validator: ValidationUtils.phoneNumberValidator,
            textcontroller: _controller.phoneNumberField, // Access the email controller from SignUpNotifier
          ),
           SizedBox(height: screenHeight * 0.05),
          roundedTextField(
            UIConstants.color.signupPurple,
            screenHeight,
            screenWidth,
            'User Name',
            validator: ValidationUtils.userNameValidator,
            textcontroller: _controller.userNameField, // Access the email controller from SignUpNotifier
          ),
          SizedBox(height: screenHeight * 0.05),
          
        ],
      ),
    );
  }
}