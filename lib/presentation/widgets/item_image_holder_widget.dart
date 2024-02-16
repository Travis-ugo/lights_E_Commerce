// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';

class ItemImageHolderWidget extends StatelessWidget {
  const ItemImageHolderWidget({
    Key? key,
    this.iconPosition = IconPosition.leading,
    this.height = 130,
    this.width = 140,
    required this.item,
  }) : super(key: key);

  final IconPosition iconPosition;
  final double height;
  final double width;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sales_image/${item.itemImages[1]}.jpeg"),
          fit: BoxFit.cover,
        ),
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: iconPosition == IconPosition.trailing
            ? AlignmentDirectional.topEnd
            : AlignmentDirectional.topStart,
        children: [
          BlocBuilder<CommerceBloc, CommerceState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (state.favouriteItems.contains(item)) {
                    context
                        .read<CommerceBloc>()
                        .add(RemoveFromFavEvent(item: item));
                  } else {
                    context.read<CommerceBloc>().add(AddToFavEvent(item: item));
                  }
                },
                icon: Icon(
                  state.favouriteItems.contains(item)
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  size: 25,
                  color: Colors.black.withOpacity(0.5),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
enum IconPosition { leading, trailing }
