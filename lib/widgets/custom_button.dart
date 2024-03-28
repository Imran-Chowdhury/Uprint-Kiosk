

import 'package:flutter/material.dart';


// 

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.screenHeight,
    required this.buttonName,
    required this.color,
    required this.onpressed,
  });

  final double screenHeight;
  final String buttonName;
  final Color color;
  final void Function()?  onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenHeight*0.035), 
        ),
      ),
      onPressed: onpressed,
      child: Text(
        buttonName,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}