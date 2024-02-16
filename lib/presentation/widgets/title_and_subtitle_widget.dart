
import 'package:flutter/material.dart';

class TitleAndSubTitleWidget extends StatelessWidget {
  const TitleAndSubTitleWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.titleFontWeight = FontWeight.w400,
    this.titleFontSize = 14,
    this.subTitleFontWeight = FontWeight.w900,
    this.subTitleFontSize = 24,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final FontWeight titleFontWeight;
  final double titleFontSize;
  final FontWeight subTitleFontWeight;
  final double subTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: titleFontWeight,
            fontSize: titleFontSize,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: subTitleFontWeight,
            fontSize: subTitleFontSize,
          ),
        ),
      ],
    );
  }
}
