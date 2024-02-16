// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ExpandableButtonWidget extends StatelessWidget {
  const ExpandableButtonWidget({
    Key? key,
    this.isFilled = true,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  final bool isFilled;
  final Widget buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        key: Key('$buttonTitle key'),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: isFilled ? Colors.white : Colors.grey[900],
          backgroundColor: isFilled ? Colors.grey[900] : null,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          minimumSize: const Size(100, 50),
          side: const BorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: buttonTitle,
      ),
    );
  }
}
