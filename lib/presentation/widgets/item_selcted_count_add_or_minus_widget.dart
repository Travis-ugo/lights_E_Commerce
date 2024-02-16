import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/add_and_minus_button_widget.dart';

class ItemSelctedCountAddOrMinusWidget extends StatefulWidget {
  const ItemSelctedCountAddOrMinusWidget({super.key});

  @override
  State<ItemSelctedCountAddOrMinusWidget> createState() =>
      _ItemSelctedCountAddOrMinusWidgetState();
}

class _ItemSelctedCountAddOrMinusWidgetState
    extends State<ItemSelctedCountAddOrMinusWidget> {
  int itemCount = 1;

  void addFunction() {
    setState(() {
      itemCount += 1;
    });
  }

  void minusFunction() {
    setState(() {
      itemCount -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddAndMinusButtonWidget(
          addOrMinus: AddOrMinus.minus,
          onTap: () {
            minusFunction();
          },
        ),
        const SizedBox(width: 10),
        Container(
          height: 35,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text("$itemCount")),
        ),
        const SizedBox(width: 10),
        AddAndMinusButtonWidget(
          addOrMinus: AddOrMinus.add,
          onTap: () {
            addFunction();
          },
        ),
      ],
    );
  }
}
