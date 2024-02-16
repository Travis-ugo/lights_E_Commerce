// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class AddAndMinusButtonWidget extends StatelessWidget {
  const AddAndMinusButtonWidget({
    Key? key,
    required this.addOrMinus,
    this.onTap,
  }) : super(key: key);

  final AddOrMinus addOrMinus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          border: Border.all(),
          color: addOrMinus == AddOrMinus.add ? Colors.grey[900] : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          addOrMinus == AddOrMinus.add ? Icons.add : Icons.remove,
          color: addOrMinus == AddOrMinus.add ? Colors.white : null,
        ),
      ),
    );
  }
}
enum AddOrMinus { add, minus }
