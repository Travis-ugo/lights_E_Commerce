// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/title_and_subtitle_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              SizedBox(width: 15),
              TitleAndSubTitleWidget(
                title: 'Hi Andrew',
                subTitle: 'Your profile view',
                subTitleFontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: Icon(Icons.person),
                  ),
                ),
                Text("Hi Andre"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
