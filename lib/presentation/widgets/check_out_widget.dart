// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:lights_on_heights_e_commerce_assessment/presentation/my_cart_view.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/expandable_button_widget.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({
    Key? key,
    required this.total,
  }) : super(key: key);

  final String total;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child:  Center(
                child: Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    r"$""$total",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        ExpandableButtonWidget(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyCartView()));
          },
          buttonTitle: const Text(
            'check out',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
