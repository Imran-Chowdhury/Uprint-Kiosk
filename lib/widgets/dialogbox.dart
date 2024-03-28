import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final VoidCallback onYesPressed;

  CustomAlertDialog({required this.onYesPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
          //  Navigator.of(context).pop(); // Close the dialog
            onYesPressed(); // Trigger the action associated with "Yes"
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        onYesPressed: () {
          
          Navigator.of(context).pop(); // Close the alert dialog
    
          Navigator.of(context).pop(); // Close the home screen
        },
      );
    },
  );
}