
part of '../views/login_screen.dart';



class _LoginForm extends ConsumerWidget {
  const _LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required LoginNotifier controller, // Adjust the type to SignUpNotifier
  })  : _formKey = formKey,
        _controller = controller,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final LoginNotifier _controller; 

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
            
            
             UIConstants.color.loginBlue,
            screenHeight,
            screenWidth,
            'Email',
            validator: ValidationUtils.emailValidator,
            textcontroller: _controller.emailField,
             
          ),
          SizedBox(height: screenHeight * 0.046),
          roundedTextField(
            UIConstants.color.loginBlue,
            screenHeight,
            screenWidth,
            'Password',
            isPassword: true,
            validator: ValidationUtils.passwordValidator,
            textcontroller: _controller.passwordField,
          ),
          SizedBox(height: screenHeight * 0.07),
        ],
      ),
    );
  }
}

