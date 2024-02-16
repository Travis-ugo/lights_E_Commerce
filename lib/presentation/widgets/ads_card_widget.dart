import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/title_and_subtitle_widget.dart';

class AdsCardWidget extends StatelessWidget {
  const AdsCardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommerceBloc, CommerceState>(
      builder: (context, state) {
        return Container(
          height: 220,
          width: 340,
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ads_image/$imagePath.jpeg"),
              fit: BoxFit.cover,
            ),
            color: const Color.fromARGB(255, 80, 196, 196).withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleAndSubTitleWidget(
                title: title,
                subTitle: subTitle,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CommerceBloc>().add(FetchItemsEvent());
                },
                key: const Key('explore'),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey[900],
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  minimumSize: const Size(100, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Explore now',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}